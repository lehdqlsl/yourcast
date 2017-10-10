package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.PayVO;

@Repository
public class PayDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.PayMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(PayVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<PayVO> getList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getlist",map);
	}

	public int getCount(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount",m_num);
	}
	
	public List<PayVO> getInfo() {
		return sqlSession.selectList(NAMESPACE + ".getInfo");
	}
}
