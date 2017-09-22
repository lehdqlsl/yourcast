package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.StarUseVO;

@Repository
public class StarUseDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.StarUseMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(StarUseVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<StarUseVO> getSendList(int m_num) {
		return sqlSession.selectList(NAMESPACE + ".getsendlist",m_num);
	}
	
	public List<StarUseVO> getRecvList(int bj_num) {
		return sqlSession.selectList(NAMESPACE + ".getrecvlist",bj_num);
	}

	public int getSendCount(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getsendcount",m_num);
	}
	
	public int getRecvCount(int bj_num) {
		return sqlSession.selectOne(NAMESPACE + ".getrecvcount",bj_num);
	}
}
