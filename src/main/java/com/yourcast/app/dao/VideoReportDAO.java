package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.VideoReportVO;
import com.yourcast.app.vo.VideoVO;

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
	public VideoReportVO check(VideoReportVO vo) {
		return sqlSession.selectOne(NAMESPACE+".check",vo);
	}
	
	public List<VideoVO> getListAdmin(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getListAdmin",map);
	}
	
	public int getCountAdmin() {
		return sqlSession.selectOne(NAMESPACE + ".getCountAdmin");
	}
	
	public List<VideoReportVO> getList(int v_num){
		return sqlSession.selectList(NAMESPACE + ".getList",v_num);
	}
}

