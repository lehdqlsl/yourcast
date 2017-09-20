package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BlacklistVO;
import org.apache.ibatis.session.SqlSession;

@Repository
public class BlacklistDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BlacklistMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BlacklistVO vo) {
		return sqlSession.insert(NAMESPACE + ".", vo);
	}

	public int delete(BlacklistVO vo) {
		return sqlSession.delete(NAMESPACE + ".", vo);
	}

	public List<BlacklistVO> getList() {
		return sqlSession.selectList(NAMESPACE + ".getlist");
	}

	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
}
