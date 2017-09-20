package com.yourcast.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.VideoReplyUpVO;

@Repository
public class VideoReplyUpDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(VideoReplyUpVO vo) {
		return sqlSession.insert(NAMESPACE + ".", vo);
	}

	public int getCount(int vr_num) {
		return sqlSession.selectOne(NAMESPACE + ".", vr_num);
	}

}
