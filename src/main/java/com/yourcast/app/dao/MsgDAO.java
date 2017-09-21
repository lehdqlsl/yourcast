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
	private final String NAMESPACE = "com.jhta.mybatis.MsgMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(MsgVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<MsgVO> getSendList(int m_nums) {
		return sqlSession.selectList(NAMESPACE + ".getsendlist",m_nums);
	}

	public List<MsgVO> getRecvList(int m_numr) {
		return sqlSession.selectList(NAMESPACE + ".getrecvlist",m_numr);
	}
	
	public int viewDate(int msg_num) {
		return sqlSession.update(NAMESPACE + ".viewdate",msg_num);
	}

	public int sendDelete(int msg_num) {
		return sqlSession.update(NAMESPACE + ".senddelete",msg_num);
	}

	public int recvDelete(int msg_num) {
		return sqlSession.update(NAMESPACE + ".recvdelete",msg_num);
	}

	public int sendCount(int m_nums) {
		return sqlSession.selectOne(NAMESPACE + ".sendcount",m_nums);
	}

	public int recvCount(int m_numr) {
		return sqlSession.selectOne(NAMESPACE + ".recvcount",m_numr);
	}
}
