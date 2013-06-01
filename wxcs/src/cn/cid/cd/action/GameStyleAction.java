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

import com.sun.corba.se.spi.copyobject.CopyobjectDefaults;

import cn.cid.cd.domain.Devloper;
import cn.cid.cd.domain.GameImage;
import cn.cid.cd.domain.GameInfo;
import cn.cid.cd.domain.GameStyle;
import cn.cid.cd.domain.SDKVersion;
import cn.cid.cd.service.IDevloperService;
import cn.cid.cd.service.IGameImageService;
import cn.cid.cd.service.IGameInfoService;
import cn.cid.cd.service.IGameStyleService;
import cn.cid.cd.service.ISDKVersionService;

/**
 * @author Administrator
 * 
 */
public class GameStyleAction extends BaseAction {

	private GameStyle style = new GameStyle();

	private IGameStyleService gameStyleService;
	private IGameInfoService gameInfoService;
	
	

	public void setGameInfoService(IGameInfoService gameInfoService) {
		this.gameInfoService = gameInfoService;
	}
	
	
	public GameStyle getStyle() {
		return style;
	}


	public void setStyle(GameStyle style) {
		this.style = style;
	}


	public IGameStyleService getGameStyleService() {
		return gameStyleService;
	}



	public void setGameStyleService(IGameStyleService gameStyleService) {
		this.gameStyleService = gameStyleService;
	}



	@Override
	public String input() throws Exception {

		return INPUT;

	}

	public String save() throws Exception {
		
		Long id = style.getId();
		
		if(id==null){
			gameStyleService.save(style);
		}else{
			gameStyleService.update(style);
		}

		// 这里保存以后,应该重定向到list页面,如果是直接调用 list方法的话,会造成重复提交.
		return "save";

	}

	public String edit() throws Exception {
		
		style = gameStyleService.get(style.getId());

		// 这儿接收到要编辑的ID后,从数据库把对象查出来后,内容要显示到页面,还有其他的对象数据要准备.所以要初始化参数.直接返回input()方法.

		return input();
	}

	public String list() throws Exception {

		// 初始化数据.
		List<GameStyle> styles = gameStyleService.getAll();

		put("styles", styles);

		return "list";
	}

	// 删除之后也重定向到list页面.否则也会重复提交.
	public String delete() throws Exception {
		
		Long id = style.getId();
		
		if(id!=null){
			//将与要删除的公司有关的游戏关系打破.
			String hql = "From GameInfo gi WHERE gi.style.id = ?";
			Object[] params = {id};
			List<GameInfo> games = gameInfoService.query(hql, params,-1, -1);
			if(games!=null && games.size()>0){
				for (GameInfo gameInfo : games) {
					gameInfo.setStyle(null);
					gameInfoService.update(gameInfo);
				}
			}
			
			gameStyleService.delete(id);
		}
		
		
		System.out.println("style_id"+id);
		return "delete";
	}
}
