package com.yourcast.app.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.ExchangeVO;

@Repository
public class ExchangeDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ExchangeVO> getList() {
		return null;
	}

	public int getCount() {
		return 1;
	}

	public int insert() {
		return 1;
	}
}
