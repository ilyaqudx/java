package cn.cid.cd.test.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.cid.cd.domain.User;
import cn.cid.cd.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/application.xml")
public class TestUserServiceImpl {

	@Autowired
	private IUserService userService;
	
	@Test
	public void save(){
		
		User user = new User();
		user.setName("test userService...");
		user.setPassword("1111");
		user.setSalary(111.1);
		userService.save(user);
	}
	
	@Test
	public void delete(){
		userService.delete(8l);
	}
	
	@Test
	public void get(){
		User user = userService.get(7l);
		//System.out.println(user);
		System.out.println(userService.getAll());
	}
	
	@Test
	public void update(){
		User user = userService.get(7l);
		user.setName("UPDATE");
		user.setPassword("update");
		user.setSalary(222.9);
		userService.update(user);
	}
}
