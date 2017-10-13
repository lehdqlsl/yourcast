package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public List<MsgVO> getSendList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getsendlist",map);
	}

	public List<MsgVO> getRecvList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getrecvlist",map);
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
	public MsgVO recvmsg(int m_numr) {
		return sqlSession.selectOne(NAMESPACE+".recvmsg",m_numr);
	}
	public MsgVO sendmsg(int m_nums) {
		return sqlSession.selectOne(NAMESPACE+".sendmsg", m_nums);
	}
}
