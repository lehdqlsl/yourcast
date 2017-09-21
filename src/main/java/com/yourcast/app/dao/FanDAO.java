package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.FanVO;

@Repository
public class FanDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.FanMapper";

	public int insert(FanVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
}
