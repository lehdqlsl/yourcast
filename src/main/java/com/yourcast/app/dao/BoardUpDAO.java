package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardUpVO;

@Repository
public class BoardUpDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.BoardUpMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardUpVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int b_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", b_num);
	}
	public BoardUpVO isCheck(BoardUpVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isCheck",vo);
	}
}
