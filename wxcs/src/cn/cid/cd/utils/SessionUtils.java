package cn.cid.cd.utils;

import java.util.List;

import cn.cid.cd.domain.User;

import com.opensymphony.xwork2.ActionContext;

public class SessionUtils {

	public static final String USER_IN_SESSION = "USER_IN_SESSION";
	public static final String PERMISSIONS_IN_SESSION = "PERMISSIONS_IN_SESSION";
	
	public static User getUserInSession(){
		return (User) ActionContext.getContext().getSession().get(USER_IN_SESSION);
	}
	
	public static void setUserInSession(User user){
		ActionContext.getContext().getSession().put(USER_IN_SESSION, user);
	}
	
	public static void removeUserInSession(){
		User user = getUserInSession();
		if(user!=null){
			ActionContext.getContext().getSession().remove(USER_IN_SESSION);
		}
	}
}
