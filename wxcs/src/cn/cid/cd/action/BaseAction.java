package cn.cid.cd.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport {

	protected void put(String key,Object value){
		ActionContext.getContext().put(key, value);
		
		
	}
}
