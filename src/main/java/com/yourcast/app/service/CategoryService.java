package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.CategoryDAO;
import com.yourcast.app.vo.CategoryVO;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO dao;

	public void setDao(CategoryDAO dao) {
		this.dao = dao;
	}

	public int insert(CategoryVO vo) {
		return dao.insert(vo);
	}

	public int update(CategoryVO vo) {
		return dao.update(vo);
	}

	public int delete(CategoryVO vo) {
		return dao.delete(vo);
	}

	public CategoryVO getInfo(int category_num) {
		return dao.getInfo(category_num);
	}

	public List<CategoryVO> getList(int m_num) {
		return dao.getList(m_num);
	}
	
	public int getCategory_num(CategoryVO vo) {
		return dao.getCategory_num(vo);
	}
}
