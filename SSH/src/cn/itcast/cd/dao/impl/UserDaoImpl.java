package cn.itcast.cd.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.impl.QueryImpl;
import org.hibernate.loader.custom.sql.SQLQueryParser;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.cd.dao.IUserDao;
import cn.itcast.cd.domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements IUserDao {

	@Override
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}

	@Override
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}

	@Override
	public User get(User user) {
		
		return this.getHibernateTemplate().get(User.class, user.getId());
	}

	@Override
	public List<User> list() {
		return null;
	}

}
