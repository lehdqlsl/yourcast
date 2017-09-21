package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import com.yourcast.app.vo.VideoVO;

@Repository
public class VideoDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.VideoMapper";

	public int hitUpdate(int v_num) {
		return sqlSession.update(NAMESPACE + ".hitUpdate", v_num);
	}

	public int update(VideoVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete", num);
	}

	public VideoVO getInfo(int num) {
		VideoVO vo = sqlSession.selectOne(NAMESPACE + ".getInfo", num);
		return vo;
	}

	public int insert(VideoVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<VideoVO> getList() {
		List<VideoVO> vlist = sqlSession.selectList(NAMESPACE + ".getList");
		return vlist;
	}
	public int getCount(HashMap<String, Integer>map) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",map);
	}
}
