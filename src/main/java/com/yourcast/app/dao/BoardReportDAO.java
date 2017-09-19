package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BoardReportVO;
import com.yourcast.app.vo.MemberProfileVO;

@Repository
public class BoardReportDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(BoardReportVO vo) {
		return sqlSession.insert(NAMESPACE+"",vo);
	}
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE+"");
	}
}
