package cn.cid.cd.service;

import java.util.List;

public interface IBaseService<T> {

	public void save(T t);
	
	public void delete(Long id);
	
	public void update(T t);
	
	public T get(Long id);
	
	public List<T> getAll();
	
	public List<T> query(final String hql,final Object[] params,final Integer start,final Integer limit);
}
