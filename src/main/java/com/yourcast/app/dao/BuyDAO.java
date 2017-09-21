package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BuyVO;

@Repository
public class BuyDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BuyMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BuyVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<BuyVO> getList(int m_num) {
		return sqlSession.selectList(NAMESPACE + ".getList",m_num);
	}

	public int getCount(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",m_num);
	}
}
