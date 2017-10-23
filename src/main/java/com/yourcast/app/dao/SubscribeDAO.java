package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.SubscribeVO;

@Repository
public class SubscribeDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.SubscribeMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int delete(SubscribeVO vo) {
		return sqlSession.delete(NAMESPACE + ".delete", vo);
	}

	public int insert(SubscribeVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<SubscribeVO> getList(int m_num) {
		return sqlSession.selectList(NAMESPACE + ".getlist", m_num);
	}
	
	public SubscribeVO isBookMark(SubscribeVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".isBookmark", vo);
	}
}
