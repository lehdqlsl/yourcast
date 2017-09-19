package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private final String NAMESPACE="";
	public int insert() {
		return 1;
	}
	public int update() {
		return 1;
	}
	public BoardVO getInfo() {
		return null;
	}
	public List<BoardVO> getList() {
		return null;
	}
	public int delete() {
		return 1;
	}
	public int hitUpdate() {
		return 1;
	}
	public int getCount() {
		return 1;
	}
	
}
