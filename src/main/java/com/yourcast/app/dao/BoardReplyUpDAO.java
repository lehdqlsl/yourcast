package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BoardReplyUpVO;

@Repository
public class BoardReplyUpDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardReplyUpVO vo) {
		return sqlSession.insert(NAMESPACE + ".", vo);
	}

	public int getCount(int br_num) {
		return sqlSession.selectOne(NAMESPACE + ".", br_num);
	}
}
