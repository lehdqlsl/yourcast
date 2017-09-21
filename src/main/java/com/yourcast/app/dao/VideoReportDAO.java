package com.yourcast.app.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.VideoReportVO;

@Repository
public class VideoReportDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.VideoReportMapper";

	public int insert(VideoReportVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int v_num) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",v_num);
	}
}
