package cn.cid.cd.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.cid.cd.dao.IBaseDao;

public abstract class BaseDaoImpl<T> extends HibernateDaoSupport implements
		IBaseDao<T> {

	private Class<T> entity;

	public BaseDaoImpl() {
		// 得到带泛型的父类.
		ParameterizedType type = (ParameterizedType) getClass()
				.getGenericSuperclass();
		// 然后取出泛型的类型.
		this.entity = (Class<T>) type.getActualTypeArguments()[0];
	}

	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	@Override
	public void delete(Long id) {
		T t = this.getHibernateTemplate().get(entity, id);
		if(t!=null){
			this.getHibernateTemplate().delete(t);
		}
	}

	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	@Override
	public T get(Long id) {
		return this.getHibernateTemplate().get(entity, id);
	}

	@Override
	public List<T> getAll() {
		List<T> list = this.getHibernateTemplate().execute(new HibernateCallback<List<T>>() {

			@Override
			public List<T> doInHibernate(Session session) throws HibernateException,
					SQLException {

				String hql = "SELECT obj FROM " + entity.getSimpleName()+" obj ";
				Query query = session.createQuery(hql);
			
				return query.list();
			}
		});
		return list;
	}
	
	@Override
	public List<T> query(final String hql,final Object[] params,final Integer start,final Integer limit){
		List<T> list = this.getHibernateTemplate().execute(new HibernateCallback<List<T>>() {

			@Override
			public List<T> doInHibernate(Session session) throws HibernateException,
					SQLException {
				
				Query query = session.createQuery(hql);
				
				//-1:判断查询条件.如有值则将值赋给条件参数
				if(params!=null && params.length>0){
					for (int i = 0; i < params.length; i++) {
						query.setParameter(i, params[i]);
					}
				}
				
				//-2:判断分页条件.
				if(start!=null && start>=0){
					query.setFirstResult(start);
					query.setMaxResults(limit);
				}
				
				return query.list();
			}
		});
		return list;
	}

}
