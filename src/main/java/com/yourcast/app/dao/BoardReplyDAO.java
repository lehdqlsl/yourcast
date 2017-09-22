package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReplyVO;

@Repository
public class BoardReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BoardReplyMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardReplyVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int delete(int br_num) {
		return sqlSession.delete(NAMESPACE + ".delete", br_num);
	}

	public int update(BoardReplyVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public BoardReplyVO getInfo(int br_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", br_num);
	}

	public List<BoardReplyVO> getList(int b_num) {
		return sqlSession.selectList(NAMESPACE + ".getList",b_num);
	}
}
