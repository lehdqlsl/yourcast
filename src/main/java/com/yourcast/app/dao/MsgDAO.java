package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import com.yourcast.app.vo.MsgVO;

@Repository
public class MsgDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";
	
	public int insert(MsgVO vo) {
		return sqlSession.insert(NAMESPACE + ".",vo);		
	}
	
	public List<MsgVO> sendList() {
		return sqlSession.selectList(NAMESPACE + ".");
	}
	
	public List<MsgVO> recvList() {
		return sqlSession.selectList(NAMESPACE + ".");
	}
	
	public int sendDelete() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
	
	public int recvDelete() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
	
	public int sendCount() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
	
	public int recvCount() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
}
