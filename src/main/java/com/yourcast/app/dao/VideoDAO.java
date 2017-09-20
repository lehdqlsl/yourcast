package com.yourcast.app.dao;

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

	private final String NAMESPACE = "";

	public int hitUpdate() {
		return 1;
	}

	public int update() {
		return 1;
	}

	public int delete() {
		return 1;
	}

	public VideoVO getInfo() {
		return null;
	}

	public int insert() {
		return 1;
	}

	public List<VideoVO> getList() {
		return null;
	}

	public int getCount() {
		return 1;
	}
}
