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
	private static final String NAMESPACE = "com.jhta.mybatis.ExchangeMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ExchangeVO> getList(int m_num) {
		return sqlSession.selectList(NAMESPACE + ".getlist", m_num);
	}

	public int getCount(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", m_num);
	}

	public int insert(ExchangeVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
}
