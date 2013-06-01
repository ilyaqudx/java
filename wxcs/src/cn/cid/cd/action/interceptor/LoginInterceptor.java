package cn.cid.cd.action.interceptor;

import cn.cid.cd.domain.User;
import cn.cid.cd.utils.SessionUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

//-1:定义拦截器,要继承一个abstractInterCeptor这个类.
public class LoginInterceptor extends AbstractInterceptor {

	private static final String LOGIN = "login";

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
	
		//System.out.println("检查是否登陆拦截器正在拦截:"+invocation.getAction());
		
		//这个拦截器的作用是,如果用户直接访问需要登陆的页面,就要进行检查 .看是否是已经登陆,如果没有,则返回登陆页面.
		User user =SessionUtils.getUserInSession();
		if(user!=null){
			return invocation.invoke();//放行的方法.
		}

		return LOGIN ;//返回值也就是代表视图.
	}

}
