package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BroadcastVO;

@Repository
public class BroadcastDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public BroadcastVO getInfo() {
		return null;
	}

	public List<BroadcastVO> getList() {
		return null;
	}

	public int insert() {
		return 1;
	}

	public int getCount() {
		return 1;
	}

	public int update() {
		return 1;
	}
}
