package cn.itcast.cd.service;

import cn.itcast.cd.domain.User;

public interface IUserService {

	public void save(User user);
	
	public void delete(User user);
	
	public void update(User user);
	
	public void get(User user);
	
	public void list();
}
