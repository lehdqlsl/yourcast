package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BoardReportVO;
import com.yourcast.app.vo.MemberProfileVO;

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
}
