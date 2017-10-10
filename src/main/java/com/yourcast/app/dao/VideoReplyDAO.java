package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.VideoReplyVO;

@Repository
public class VideoReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.VideoReplyMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(VideoReplyVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int delete(int vr_num) {
		return sqlSession.delete(NAMESPACE + ".delete", vr_num);
	}

	public int update(VideoReplyVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public VideoReplyVO getInfo(int vr_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", vr_num);
	}

	public List<VideoReplyVO> getList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}
	public int getCount(int v_num) {
		return sqlSession.selectOne(NAMESPACE+".getCount",v_num);
	}
}
