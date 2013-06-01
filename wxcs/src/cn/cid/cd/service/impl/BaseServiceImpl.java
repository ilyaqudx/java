package cn.cid.cd.service.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.cid.cd.dao.IBaseDao;
import cn.cid.cd.service.IBaseService;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

	private IBaseDao baseDao;
	
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void save(T t) {
		baseDao.save(t);
	}

	@Override
	public void delete(Long id) {
		baseDao.delete(id);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);
	}

	@Override
	public T get(Long id) {
		
		return (T) baseDao.get(id);
	}

	@Override
	public List<T> getAll() {
		return baseDao.getAll();
	}

	@Override
	public List<T> query(String hql, Object[] params, Integer start,
			Integer limit) {
		return baseDao.query(hql, params, start, limit);
	}

}
