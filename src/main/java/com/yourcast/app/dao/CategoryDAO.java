package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.CategoryVO;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert() {
		return 1;
	}

	public int update() {
		return 1;
	}

	public int delete() {
		return 1;
	}

	public CategoryVO getInfo() {
		return null;
	}

	public List<CategoryVO> getList() {
		return null;
	}
}
