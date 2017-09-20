package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.MemberProfileVO;

@Repository
public class MemberProfileDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(MemberProfileVO vo) {
		return sqlSession.insert(NAMESPACE + "", vo);
	}

	// 얘가 왜있을까요...
	public int delete(int profile_num) {
		return sqlSession.delete(NAMESPACE + "", profile_num);
	}

	public int imgUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + "", vo);
	}

	public int contentUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + "", vo);
	}

	public int msgUpdate(MemberProfileVO vo) {
		return sqlSession.update(NAMESPACE + "", vo);
	}
}
