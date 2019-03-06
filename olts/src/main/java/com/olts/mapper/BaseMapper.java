/**
 * 
 */
package com.olts.mapper;

import java.util.List;

import com.olts.vo.Page;

/**
 * @author Administrator
 *
 */
public interface BaseMapper<T, PK extends java.io.Serializable> {

	/**
	 * 
	 * @param page
	 * @return
	 */
	public List<T> selectSelective(Page<T> page);

	public void insert(T entity);

	public void update(T entity);

	public void delete(Integer id);

}
