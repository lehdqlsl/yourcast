package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReplyReportVO;
import com.yourcast.app.vo.BoardReplyVO;

@Repository
public class BoardReplyReportDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.BoardReplyReport";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BoardReplyReportVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int br_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", br_num);
	}
	public BoardReplyReportVO isCheck(BoardReplyReportVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isCheck", vo);
	}
	
	public List<BoardReplyVO> getListAdmin(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getListAdmin", map);
	}
	
	public int getCountAdmin() {
		return sqlSession.selectOne(NAMESPACE + ".getCountAdmin");
	}
	
	public List<BoardReplyReportVO> getList(int br_num){
		return sqlSession.selectList(NAMESPACE + ".getList",br_num);
	}
}
