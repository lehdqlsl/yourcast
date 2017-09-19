package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.SubscribeVO;

@Repository
public class SubscribeDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int delete() {
		return 1;
	}

	public int insert() {
		return 1;
	}

	public List<SubscribeVO> getList() {
		return null;
	}
}
