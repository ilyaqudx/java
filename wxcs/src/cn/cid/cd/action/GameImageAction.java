package cn.cid.cd.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import cn.cid.cd.domain.GameImage;
import cn.cid.cd.domain.GameInfo;
import cn.cid.cd.service.IGameImageService;
import cn.cid.cd.service.IGameInfoService;

/**
 * @author Administrator
 * 
 */
public class GameImageAction extends BaseAction {
	
	private List<File> imgs = new ArrayList<File>();
	private List<String> imgsFileName  = new ArrayList<String>();
	private List<String> imgsContentType  = new ArrayList<String>();
	
	

	public List<File> getImgs() {
		return imgs;
	}
	public void setImgs(List<File> imgs) {
		this.imgs = imgs;
	}
	public List<String> getImgsFileName() {
		return imgsFileName;
	}
	public void setImgsFileName(List<String> imgsFileName) {
		this.imgsFileName = imgsFileName;
	}
	public List<String> getImgsContentType() {
		return imgsContentType;
	}
	public void setImgsContentType(List<String> imgsContentType) {
		this.imgsContentType = imgsContentType;
	}

	private GameImage img = new GameImage();
	private GameInfo gameInfo = new GameInfo();

	public GameInfo getGameInfo() {
		return gameInfo;
	}
	public void setGameInfo(GameInfo gameInfo) {
		this.gameInfo = gameInfo;
	}

	private IGameImageService gameImageService;
	private IGameInfoService gameInfoService;
	public void setGameInfoService(IGameInfoService gameInfoService) {
		this.gameInfoService = gameInfoService;
	}
	


	public GameImage getImg() {
		return img;
	}



	public void setImg(GameImage img) {
		this.img = img;
	}



	public void setGameImageService(IGameImageService gameImageService) {
		this.gameImageService = gameImageService;
	}



	@Override
	public String input() throws Exception {

		return INPUT;

	}

	public String save() throws Exception {
		
		Long id = gameInfo.getId();
		
		if(id==null){
			//parseUpload();
		}else{
			updateImages();
			put("imgs",gameInfo.getImages());
			put("gameInfo",gameInfo);
		}

		// 这里保存以后,应该重定向到list页面,如果是直接调用 list方法的话,会造成重复提交.
		return "save";

	}

	public String edit() throws Exception {
		
		img = gameImageService.get(img.getId());

		// 这儿接收到要编辑的ID后,从数据库把对象查出来后,内容要显示到页面,还有其他的对象数据要准备.所以要初始化参数.直接返回input()方法.

		return input();
	}

	public String list() throws Exception {

		// 初始化数据.
		List<GameImage> imgs = gameImageService.getAll();

		put("imgs", imgs);

		return "list";
	}

	// 删除之后也重定向到list页面.否则也会重复提交.
	public String delete() throws Exception {
		
		Long id = img.getId();
		
		if(id!=null){
			//将与要删除的公司有关的游戏关系打破.
			String hql = "From GameInfo gi WHERE gi.images.id = ?";
			Object[] params = {id};
			List<GameInfo> games = gameInfoService.query(hql, params,-1, -1);
			if(games!=null && games.size()>0){
				for (GameInfo gameInfo : games) {
					gameInfo.setImages(null);
					gameInfoService.update(gameInfo);
				}
			}
			
			gameImageService.delete(id);
		}
		
		
		System.out.println("img_id"+id);
		return "delete";
	}
	
	private void parseUpload() throws IOException {
		//接收上传文件
		System.out.println("uploadFiles = "+imgs);//这个名字一定要注意,和前台一致才行.
		System.out.println("文件的名字 = "+imgsFileName);
		System.out.println("文件的类型 = "+imgsContentType);
		
		List<GameImage> images = gameInfo.getImages();
		
		//获取文件上传的目录路径
		String fileDirPath = ServletActionContext.getServletContext().getRealPath("/upload");
		
		//获取文件上传的目录
		File fileDir = new File(fileDirPath);
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		for (int i = 0; i < imgs.size(); i++) {
			//获取一个不重复的文件名
			String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(imgsFileName.get(i));
			
			//创建一个新文件存储上传文件
			File newFile = new File(fileDir,fileName);
			
			//把上传的临时文件复制到新的文件中
			FileUtils.copyFile(imgs.get(i),newFile);
			//保存到数据库中.
			GameImage img = new GameImage();
			img.setImageName(fileName);
			img.setImagePath(fileDirPath);
			
			images.add(img);//把上传上来的图片添加到它所属的对象中.
			
			gameImageService.save(img);//然后将图片的名称和路径保存到DB中.
		}
		
		
	}
	
	private void updateImages()throws Exception{

		Long id = gameInfo.getId();
		if(imgs!=null && imgs.size()>0){
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
			
			dbGameInfo.setImages(gameInfo.getImages());//把图片给DB中的游戏对象.
			
			
			
			gameInfoService.update(dbGameInfo);
		}
	}
	
	
	
	/**
	 * @return 返回某个游戏的图片资源.
	 */
	public String query(){
		
		Long id = gameInfo.getId();
		if(id!=null){
			gameInfo = gameInfoService.get(id);
			List<GameImage> imgs = gameInfo.getImages();
			put("imgs", imgs);
			put("gameInfo",gameInfo);
		}
		
		return "query";
	}
}
