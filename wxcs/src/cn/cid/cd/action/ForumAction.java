package cn.cid.cd.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import cn.cid.cd.domain.Devloper;
import cn.cid.cd.domain.Forum;
import cn.cid.cd.domain.GameImage;
import cn.cid.cd.domain.GameInfo;
import cn.cid.cd.domain.GameLogo;
import cn.cid.cd.domain.GameStyle;
import cn.cid.cd.domain.SDKVersion;
import cn.cid.cd.service.IDevloperService;
import cn.cid.cd.service.IForumService;
import cn.cid.cd.service.IGameImageService;
import cn.cid.cd.service.IGameInfoService;
import cn.cid.cd.service.IGameLogoService;
import cn.cid.cd.service.IGameStyleService;
import cn.cid.cd.service.ISDKVersionService;
import cn.cid.cd.utils.ComparatorImpl;

/**
 * @author Administrator
 *
 */
public class ForumAction extends BaseAction {

	private Forum forum = new Forum();
	private IGameInfoService gameInfoService;
	
	public void setGameInfoService(IGameInfoService gameInfoService) {
		this.gameInfoService = gameInfoService;
	}

	public Forum getForum() {
		return forum;
	}

	public void setForum(Forum forum) {
		this.forum = forum;
	}


	private List<File> logo = new ArrayList<File>();
	
	public List<File> getLogo() {
		return logo;
	}

	public void setLogo(List<File> logo) {
		this.logo = logo;
	}

	public List<String> getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(List<String> logoFileName) {
		this.logoFileName = logoFileName;
	}

	public List<String> getLogoContentType() {
		return logoContentType;
	}

	public void setLogoContentType(List<String> logoContentType) {
		this.logoContentType = logoContentType;
	}


	/*
	 * 定义两个String类型的变量分别接收文件的名称和内容类型，
	 * 它们的属性名称分为File类型的属性名后面加上“FileName”和ContentType“”。
	 */
	
	private List<String> logoFileName  = new ArrayList<String>();
	private List<String> logoContentType  = new ArrayList<String>();
	
	private IForumService forumService;
	private IGameImageService gameImageService;

	public void setGameImageService(IGameImageService gameImageService) {
		this.gameImageService = gameImageService;
	}

	public void setForumService(IForumService forumService) {
		this.forumService = forumService;
	}

	@Override
	public String input() throws Exception {
		
		
		//初始化数据.
		
		return INPUT;
	
	}
	
	
	//保存和更新基本数据
	public String save() throws Exception {
		System.out.println(forum.toString());
		Long id = forum.getId();
		
		
		//ID为空代表新添加.否则就是更新操作.
		if(id==null){
			//每次新的游戏添加后,都会默认设置一个LOGO.
			forumService.save(forum);
			
		}else{
			
		
		}
		//这里保存以后,应该重定向到list页面,如果是直接调用 list方法的话,会造成重复提交.
		return "save";

	}
	
	public String edit()throws Exception{
		if(forum.getId()!=null){
			
			put("gameInfo", forum);
		}
		
		//这儿接收到要编辑的ID后,从数据库把对象查出来后,内容要显示到页面,还有其他的对象数据要准备.所以要初始化参数.直接返回input()方法.
		
		return input();
	}
	
	/**最热闹的应用
	 * @return
	 * @throws Exception
	 */
	public String listHot()throws Exception{
		
		String hql = "FROM Forum f ORDER BY f.clickTimes DESC";
		List<Forum> forums = forumService.query(hql, null, null, null);
		put("forums", forums);
		
		return "list";
	}
	
	
	//删除之后也重定向到list页面.否则也会重复提交.
	public String delete()throws Exception{
		
		Long id = forum.getId();
		
		if(id!=null){
			forum = forumService.get(id);
			GameImage logo = forum.getForumLogo();
			String logoName = logo.getImageName();
			String logoPath = logo.getImagePath();
			
			if(logo!=null){
				forum.setForumLogo(null);//看要不要UPDATE
				gameImageService.delete(logo.getId());
				File file = new File(logoPath,logoName);
				if(file.exists()){
					file.delete();
				}
			}
			
			forumService.delete(id);
		}
		
		return "delete" ;
	}
	
	/**
	 * @return 版块的所有子项目.
	 */
	public String childlist(){
		
		Long id = forum.getId();
		System.out.println("forumID============="+id);
		if(id!=null){
			forum = forumService.get(id);
			String hql = "FROM GameInfo g WHERE g.forum.id = ?";
			List<GameInfo> games = gameInfoService.query(hql, new Object[]{id}, null, null);
				
			if(games!=null && games.size()>0){
				for (GameInfo gameInfo2 : games) {
					if(gameInfo2.getDiscription().length()>70){
						gameInfo2.setDiscription(gameInfo2.getDiscription().substring(0, 70)+"  ...");
					}
				}
			}
			
			put("forum", forum);
			put("games", games);
			return "childlist";
		}
		
		return null;
	}


	
	/**这个方法最主要是处理上传文件的.先将文件资源的名称和路径保存到DB.然后再将图片保存到硬盘.这样文件所属的对象保存时才不会出错.
	 * 
	 * 但要注意,文件上传,要注意上传文件的大小.默认是单个文件小于2M的.否则后台会报异常.但是不是给你报文件大小异常.是其它的莫名其妙的错误.
	 * @throws IOException
	 */
	private void parseUpload() throws IOException {
		//接收上传文件
		System.out.println("uploadFiles = "+logo);//这个名字一定要注意,和前台一致才行.
		System.out.println("文件的名字 = "+logoContentType);
		System.out.println("文件的类型 = "+logoFileName);
		
		
		//获取文件上传的目录路径
		String fileDirPath = ServletActionContext.getServletContext().getRealPath("/upload");
		
		//获取文件上传的目录
		File fileDir = new File(fileDirPath);
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		for (int i = 0; i < logo.size(); i++) {
			//获取一个不重复的文件名
			String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(logoFileName.get(i));
			
			//创建一个新文件存储上传文件
			File newFile = new File(fileDir,fileName);
			
			//把上传的临时文件复制到新的文件中
			FileUtils.copyFile(logo.get(i),newFile);
			//保存到数据库中.
			GameImage img = new GameImage();
			img.setImageName(fileName);
			img.setImagePath(fileDirPath);
			
			gameImageService.save(img);
			
			forum.setForumLogo(img);
		}
		
		
	}
}
