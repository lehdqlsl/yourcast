package com.yourcast.app.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReplyVO;

@Repository
public class BoardReplyDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(BoardReplyVO vo) {
		return sqlSession.insert(NAMESPACE+"",vo);
	}
	public int delete(int br_num) {
		return sqlSession.delete(NAMESPACE+"",br_num);
	}
	public int update(BoardReplyVO vo) {
		return sqlSession.update(NAMESPACE+"",vo);
	}
	public BoardReplyVO getInfo(int br_num) {
		return sqlSession.selectOne(NAMESPACE+"",br_num);
	}
	public List<BoardReplyVO> getList(){
		return sqlSession.selectList(NAMESPACE+"");
	}
}
