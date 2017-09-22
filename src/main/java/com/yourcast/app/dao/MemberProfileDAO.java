package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.MemberProfileVO;

@Repository
public class MemberProfileDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.MemberProfileMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(MemberProfileVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public int imgUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + ".imgUpdate", vo);
	}

	public int contentUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + ".contentUpdate", vo);
	}

	public int msgUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + ".msgUpdate", vo);
	}
	public MemberProfileVO getInfo(int profile_num) {
		return sqlSession.selectOne(NAMESPACE+".getInfo",profile_num);
	}
}
