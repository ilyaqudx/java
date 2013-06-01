package cn.cid.cd.test.dao;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.cid.cd.dao.IUserDao;
import cn.cid.cd.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/application.xml")
public class TestUserDaoImpl {

	@Autowired
	private ApplicationContext context;
	
	@Test
	public void save(){
		IUserDao userDao = (IUserDao) context.getBean("userDao");
		User user = new User();
		user.setName("李四");
		user.setPassword("234567");
		user.setSalary(888.0);
		userDao.save(user);
	}
	
	@Test
	public void get(){
		IUserDao userDao = (IUserDao) context.getBean("userDao");
		User user = userDao.get(1l);
		System.out.println(user);
	}
	
	@Test
	public void getAll(){
		IUserDao userDao = (IUserDao) context.getBean("userDao");
		List<User> list = userDao.getAll();
		System.out.println(list);
	}
	
	@Test
	public void query(){
		IUserDao userDao = (IUserDao) context.getBean("userDao");
		String hql = "SELECT obj FROM User obj";
		List<User> list = userDao.query(hql, null, null, null);
		System.out.println(list.size());
	}
	
	@Test
	public void delete(){
		IUserDao userDao = (IUserDao) context.getBean("userDao");
		userDao.delete(1l);
		List<User> list = userDao.getAll();
		System.out.println(list.size());
	}
}
