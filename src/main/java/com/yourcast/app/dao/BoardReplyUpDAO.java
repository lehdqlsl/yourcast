package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReplyUpVO;

@Repository
public class BoardReplyUpDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BoardReplyUpMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardReplyUpVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int br_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", br_num);
	}
	public BoardReplyUpVO isCheck(BoardReplyUpVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isCheck", vo);
	}
	public int checkUp(int br_num) {
		return sqlSession.selectOne(NAMESPACE + ".checkUp", br_num);
	}
}
