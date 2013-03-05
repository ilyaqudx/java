package cn.itcast.cd.service;

import cn.itcast.cd.dao.IUserDao;
import cn.itcast.cd.domain.User;

public class UserServiceImpl implements IUserService {

	private IUserDao userdao;
	
	@Override
	public void save(User user) {
		userdao.save(user);
	}

	@Override
	public void delete(User user) {
		userdao.delete(user);
	}

	@Override
	public void update(User user) {
		userdao.update(user);
	}

	@Override
	public void get(User user) {
		userdao.get(user);
	}

	@Override
	public void list() {
		userdao.list();
	}

}
