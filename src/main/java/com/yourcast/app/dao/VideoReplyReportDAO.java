package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.VideoReplyReportVO;
import com.yourcast.app.vo.VideoReplyVO;

@Repository
public class VideoReplyReportDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.VideoReplyReportMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(VideoReplyReportVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount(int vr_num) {
		return sqlSession.selectOne(NAMESPACE + ".getcount", vr_num);
	}
	public VideoReplyReportVO check(VideoReplyReportVO vo) {
		return sqlSession.selectOne(NAMESPACE+".check",vo);
	}
	
	public List<VideoReplyVO> getListAdmin(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getListAdmin",map);
	}
	
	public int getCountAdmin() {
		return sqlSession.selectOne(NAMESPACE + ".getCountAdmin");
	}
}
