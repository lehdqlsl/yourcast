package com.yourcast.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.VideoUpVO;

@Repository
public class VideoUpDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.VideoUpMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(VideoUpVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int v_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", v_num);
	}
	public VideoUpVO check(VideoUpVO vo) {
		return sqlSession.selectOne(NAMESPACE+".check",vo);
	}
}
