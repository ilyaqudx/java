package cn.cid.cd.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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

/**
 * @author Administrator
 *
 */
public class GameInfoAction extends BaseAction {

	private GameInfo gameInfo = new GameInfo();
	private Forum forum  = new Forum();
	private IForumService forumService;
	public void setForumService(IForumService forumService) {
		this.forumService = forumService;
	}

	public Forum getForum() {
		return forum;
	}

	public void setForum(Forum forum) {
		this.forum = forum;
	}


	//处理游戏图片展示的文件数组
	private List<File> myHead = new ArrayList<File>();
	
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
	private List<String> myHeadFileName  = new ArrayList<String>();
	private List<String> myHeadContentType  = new ArrayList<String>();
	
	private List<String> logoFileName  = new ArrayList<String>();
	private List<String> logoContentType  = new ArrayList<String>();
	
	private String fileDirPath;
	
	private IGameImageService gameImageService;
	private IGameInfoService gameInfoService;
	private IGameStyleService gameStyleService;
	private IDevloperService devloperService;
	private ISDKVersionService sdkversionService;
	private IGameLogoService gameLogoService;
	
	public void setGameLogoService(IGameLogoService gameLogoService) {
		this.gameLogoService = gameLogoService;
	}

	public void setSdkversionService(ISDKVersionService sdkversionService) {
		this.sdkversionService = sdkversionService;
	}

	public void setDevloperService(IDevloperService devloperService) {
		this.devloperService = devloperService;
	}

	public void setGameStyleService(IGameStyleService gameStyleService) {
		this.gameStyleService = gameStyleService;
	}

	public void setGameInfoService(IGameInfoService gameInfoService) {
		this.gameInfoService = gameInfoService;
	}

	public GameInfo getGameInfo() {
		return gameInfo;
	}




	public void setGameInfo(GameInfo gameInfo) {
		this.gameInfo = gameInfo;
	}




	public void setGameImageService(IGameImageService gameImageService) {
		this.gameImageService = gameImageService;
	}




	public void setFileDirPath(String fileDirPath) {
		this.fileDirPath = fileDirPath;
	}
	
	


	public List<File> getMyHead() {
		return myHead;
	}

	public void setMyHead(List<File> myHead) {
		this.myHead = myHead;
	}

	public List<String> getMyHeadFileName() {
		return myHeadFileName;
	}

	public void setMyHeadFileName(List<String> myHeadFileName) {
		this.myHeadFileName = myHeadFileName;
	}

	public List<String> getMyHeadContentType() {
		return myHeadContentType;
	}
	public void setMyHeadContentType(List<String> myHeadContentType) {
		this.myHeadContentType = myHeadContentType;
	}
	@Override
	public String input() throws Exception {
		
		
		//初始化数据.
		List<GameStyle> styles = gameStyleService.getAll();
		List<SDKVersion> sdks = sdkversionService.getAll();
		List<Devloper> devs = devloperService.getAll();
		
		System.out.println("sdks==="+sdks);
		
		put("styles", styles);
		put("sdks", sdks);
		put("devs", devs);
		
		return INPUT;
	
	}
	
	
	//保存和更新基本数据
	public String save() throws Exception {
		System.out.println(gameInfo.toString());
		Long id = gameInfo.getId();
		
		
		//ID为空代表新添加.否则就是更新操作.
		if(id==null){
			//每次新的游戏添加后,都会默认设置一个LOGO.
			GameLogo logo = gameLogoService.get(1l);
			gameInfo.setLogo(logo);
			gameInfo.setAddTime(new Date());
			gameInfoService.save(gameInfo);
		}else{
			GameInfo dbGameInfo = gameInfoService.get(id);
			GameLogo logo = dbGameInfo.getLogo();
			List<GameImage> imgs = dbGameInfo.getImages();
			int top = dbGameInfo.getTop();
			int foot = dbGameInfo.getFoot();
			Date addTime = dbGameInfo.getAddTime();
			
			BeanUtils.copyProperties(gameInfo, dbGameInfo);
			dbGameInfo.setLogo(logo);
			dbGameInfo.setImages(imgs);
			dbGameInfo.setTop(top);
			dbGameInfo.setFoot(foot);
			dbGameInfo.setAddTime(addTime);
		
			gameInfoService.update(dbGameInfo);
		
		}
		//这里保存以后,应该重定向到list页面,如果是直接调用 list方法的话,会造成重复提交.
		return "save";

	}
	
	public String edit()throws Exception{
		if(gameInfo.getId()!=null){
			gameInfo = gameInfoService.get(gameInfo.getId());
			put("gameInfo", gameInfo);
		}
		
		//这儿接收到要编辑的ID后,从数据库把对象查出来后,内容要显示到页面,还有其他的对象数据要准备.所以要初始化参数.直接返回input()方法.
		
		return input();
	}
	
	public String get(){
			Long gameId = gameInfo.getId();
			Long f_id = forum.getId();
			if(gameId!=null){
				gameInfo = gameInfoService.get(gameId);
				System.out.println("f_id==="+f_id);
				if(f_id!=null){//新浪分享是可以有多个参数的.接收到了直接就有forum的ID.
					forum = forumService.get(f_id);
				}else{//移动和腾讯分享是不能有多个参数的.所以我们直接获取游戏所属的forumID
					forum = forumService.get(gameInfo.getForum().getId());
				}
				
				String hql = "FROM GameInfo g WHERE g.forum.id = ?";
				
				List<GameInfo> list = gameInfoService.query(hql, new Object[]{forum.getId()}, null, null);
				put("list",list);
				put("forum", forum);
				put("gameInfo",gameInfo);
				
				return "get";
			}
		return null;
		
	}
	
	public String assessTop(){
		
		Long id = gameInfo.getId();
		if(id!=null){
			gameInfo = gameInfoService.get(id);
			gameInfo.setTop(gameInfo.getTop()+1);
			gameInfoService.update(gameInfo);
		}
		
		return null;
	}
	public String assessFoot(){
		
		Long id = gameInfo.getId();
		if(id!=null){
			gameInfo = gameInfoService.get(id);
			gameInfo.setFoot(gameInfo.getFoot()+1);
			gameInfoService.update(gameInfo);
		}
		
		return null;
	}
	
	public String list()throws Exception{
		
		List<GameInfo> games = gameInfoService.getAll();
		for (GameInfo gameInfo : games) {
			String discription = gameInfo.getDiscription();
			if(discription.length()>=10){
				gameInfo.setDiscription(discription.substring(0, 10)+"...");
			}
		}
		
		put("games", games);
		
		return "list";
	}
	
	
	//删除之后也重定向到list页面.否则也会重复提交.
	public String delete()throws Exception{
		
		if(gameInfo.getId()!=null){
			GameInfo game = gameInfoService.get(gameInfo.getId());
			List<GameImage> imgs = game.getImages();//得到游戏对应的图片资源.
			List<Long> imgIds = new ArrayList<Long>();//这儿先得到图片的ID.将它们都获取出来.否则会报session关闭错误.
			List<String> imgName = new ArrayList<String>();
			if(imgs!=null && imgs.size()>0){
				for (GameImage gameImage : imgs) {
					imgIds.add(gameImage.getId());
					imgName.add(gameImage.getImageName());
				}
			}
			
			//级联删除:作用在将对象的LIST置为NULL.或者删除对象都可以自动解除他们中间表的关联.
			//这儿级联删除以后,希望对应的图片资源也删除掉.
			gameInfoService.delete(gameInfo.getId());
			
			//在这儿再来删除图片.
			//这儿删除上传的图片.没问题.
			if(imgs!=null && imgs.size()>0){
				for (Long long1 : imgIds) {
					gameImageService.delete(long1);
				}
				
				
				//删除上传到服务器的图片文件.如果路径正确才删除.
					File file = new File(imgs.get(0).getImagePath());
					if(file.exists()){
						System.out.println(file.getName());
						File[] files = file.listFiles();
						for (File file2 : files) {
							String fileName = file2.getName();
							if(imgName.contains(fileName)){
								file2.delete();
							}
						}
					}
				}
		}
		
		return "delete" ;
	}
	
	
	public String uploadLogo()throws Exception{
		
		System.out.println("logo = "+logo);//这个名字一定要注意,和前台一致才行.
		System.out.println("文件的名字 = "+logoFileName);
		System.out.println("文件的类型 = "+logoContentType);
		Long id = gameInfo.getId();
		System.out.println("id======================="+id);
		if(id!=null){
			gameInfo = gameInfoService.get(id);
			GameLogo dbLogo = gameInfo.getLogo();
			
			//获取logo上传的目录路径
			String fileDirPath = ServletActionContext.getServletContext().getRealPath("/logo");
			
			//获取文件上传的目录
			File fileDir = new File(fileDirPath);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			
			if(logo!=null && logo.size()>0){
				
				//获取一个不重复的文件名
				String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(logoFileName.get(0));
				
				//创建一个新文件存储上传文件
				File newFile = new File(fileDir,fileName);
				
				//把上传的临时文件复制到新的文件中
				FileUtils.copyFile(logo.get(0),newFile);
				
				
				
				//--------如果原来的LOGO图片是默认,不删除.如果不是则删除.-------------
				if(dbLogo.getId()!=1){
					String oldName = dbLogo.getName();
					String oldPath = dbLogo.getPath();
					File oldLogo = new File(oldPath,oldName);
					
					if(oldLogo.exists()){
						oldLogo.delete();
					}
					
					//新的数据保存到数据库中.
					dbLogo.setName(fileName);
					dbLogo.setPath(fileDirPath);
					gameLogoService.update(dbLogo);//然后将图片的名称和路径保存到DB中.	
					gameInfo.setLogo(dbLogo);
				}else{
					
					//如果LoGO之前是默认的,就重新保存新的LOGO.
					GameLogo newLogo = new GameLogo();
					
					newLogo.setName(fileName);
					newLogo.setPath(fileDirPath);
					gameLogoService.save(newLogo);//然后将图片的名称和路径保存到DB中.
					gameInfo.setLogo(newLogo);
				}			
			}
			
			
			gameInfoService.update(gameInfo);
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
		System.out.println("uploadFiles = "+myHead);//这个名字一定要注意,和前台一致才行.
		System.out.println("文件的名字 = "+myHeadFileName);
		System.out.println("文件的类型 = "+myHeadContentType);
		
		List<GameImage> images = gameInfo.getImages();
		
		//获取文件上传的目录路径
		String fileDirPath = ServletActionContext.getServletContext().getRealPath("/upload");
		
		//获取文件上传的目录
		File fileDir = new File(fileDirPath);
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		for (int i = 0; i < myHead.size(); i++) {
			//获取一个不重复的文件名
			String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(myHeadFileName.get(i));
			
			//创建一个新文件存储上传文件
			File newFile = new File(fileDir,fileName);
			
			//把上传的临时文件复制到新的文件中
			FileUtils.copyFile(myHead.get(i),newFile);
			//保存到数据库中.
			GameImage img = new GameImage();
			img.setImageName(fileName);
			img.setImagePath(fileDirPath);
			
			images.add(img);//把上传上来的图片添加到它所属的对象中.
			
			gameImageService.save(img);//然后将图片的名称和路径保存到DB中.
		}
		
		
	}
	
	
	//这个方法先放在这儿.单独处理图片的时候要用.
	private void updateImages()throws Exception{

		Long id = gameInfo.getId();
		if(myHead!=null && myHead.size()>0){
			GameInfo dbGameInfo = gameInfoService.get(id);
			List<Long> ids = new ArrayList<Long>();
			String imgPath = null;
			List<String> imgNames = new ArrayList<String>();
			if(dbGameInfo.getImages()!=null && dbGameInfo.getImages().size()>0){
				for (GameImage gameImage : dbGameInfo.getImages()) {
					ids.add(gameImage.getId());
					imgNames.add(gameImage.getImageName());
				}
				imgPath = dbGameInfo.getImages().get(0).getImagePath();
				dbGameInfo.setImages(null);
				gameInfoService.update(dbGameInfo);
			}
			
			if(ids!=null && ids.size()>0){
				for (Long long1 : ids) {
					gameImageService.delete(long1);
				}
				File file = new File(imgPath);
				File[] imgFiles = file.listFiles();
				for (File file2 : imgFiles) {
					if(imgNames.contains(file2.getName())){
						file2.delete();
					}
				}
			}
			
			//这里注意,从前台接收上来的对象,和我们从DB中查出来的对象,它们的ID是一样的,如果我们以新的对象去更新,DB会认为是两个对象具有相同的ID.
			//这个是不行的.
			parseUpload();//将上传的图片保存到数据库和硬盘上.
			
			BeanUtils.copyProperties(gameInfo, dbGameInfo);
			
			gameInfoService.update(dbGameInfo);
		}else{
			//如果修改时没有上传图片.就沿用以前的图片.上面是上传了图片就用新图片.
			GameInfo dbGameInfo = gameInfoService.get(id);
			List<GameImage> imgs = dbGameInfo.getImages();
			BeanUtils.copyProperties(gameInfo, dbGameInfo);
			dbGameInfo.setImages(imgs);
			gameInfoService.update(dbGameInfo);
		}
	}
}
