package cn.itcast.cd.dao;

import java.util.List;

import cn.itcast.cd.domain.User;

public interface IUserDao {

	public void save(User user);
	
	public void delete(User user);
	
	public void update(User user);
	
	public User get(User user);
	
	public List<User> list();
}
