package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

@Repository
public class FanDAO {
	@Autowired private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	private final String NAMESPACE="";
	public int insert() {
		return 1;
	}
	public int update() {
		return 1;
	}
}
