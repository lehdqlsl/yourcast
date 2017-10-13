package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BoardReportVO;
import com.yourcast.app.vo.BoardVO;

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
	
	public List<BoardVO> getListAdmin(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getListAdmin",map);
	}
	
	public int getCountAdmin() {
		return sqlSession.selectOne(NAMESPACE + ".getCountAdmin");
	}
	
	public List<BoardReportVO> getList(int b_num){
		return sqlSession.selectList(NAMESPACE + "getList",b_num);
	}
}
