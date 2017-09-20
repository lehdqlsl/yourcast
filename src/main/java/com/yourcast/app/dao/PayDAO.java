package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.PayVO;

@Repository
public class PayDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(PayVO vo) {
		return sqlSession.insert(NAMESPACE + ".", vo);
	}

	public List<PayVO> getList() {
		return sqlSession.selectList(NAMESPACE + ".");
	}

	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
}
