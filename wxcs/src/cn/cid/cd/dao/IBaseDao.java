package cn.cid.cd.dao;

import java.util.List;

public interface IBaseDao<T> {

	
	public void save(T t);
	
	public void delete(Long id);
	
	public void update(T t);
	
	public T get(Long id);
	
	/**
	 * @return:返回List.数据库中所有纪录.不需要传入任何参数.
	 */
	public List<T> getAll();
	
	/**
	 * @param hql:输入一条完整的预处理HQL语句.如SELECT u From User u WHERE u.name = ?
	 * @param params:预处理语句对应的参数.
	 * @param start:分页所需要的开始条数.
	 * @param limit:分页所需要的每页大小.
	 * @return:返回一个LIST集合.
	 */
	public List<T> query(final String hql,final Object[] params,final Integer start,final Integer limit);
}
