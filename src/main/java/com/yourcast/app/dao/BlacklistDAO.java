package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BlacklistVO;

@Repository
public class BlacklistDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BlacklistMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BlacklistVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int delete(BlacklistVO vo) {
		return sqlSession.delete(NAMESPACE + ".delete", vo);
	}

	public List<BlacklistVO> getList(int bj_num) {
		return sqlSession.selectList(NAMESPACE + ".getlist",bj_num);
	}

	public int getCount(int bj_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount",bj_num);
	}
}
