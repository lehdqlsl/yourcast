package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoUpDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert() {
		return 1;
	}

	public int getCount() {
		return 1;
	}
}
