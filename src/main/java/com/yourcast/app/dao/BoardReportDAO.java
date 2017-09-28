package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReportVO;

@Repository
public class BoardReportDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BoardReportMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardReportVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int b_num) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",b_num);
	}
	public BoardReportVO isCheck(BoardReportVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isCheck",vo);
	}
}
