package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import com.yourcast.app.vo.VideoReplyVO;
@Repository
public class VideoReplyDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(VideoReplyVO vo) {
		return sqlSession.insert(NAMESPACE+"",vo);
	}
	public int delete(int vr_num) {
		return sqlSession.delete(NAMESPACE+"",vr_num);
	}
	public int update(VideoReplyVO vo) {
		return sqlSession.update(NAMESPACE+"",vo);
	}
	public VideoReplyVO getInfo(int vr_num) {
		return sqlSession.selectOne(NAMESPACE+"",vr_num);
	}
	public List<VideoReplyVO> getList(){
		return sqlSession.selectList(NAMESPACE+"");
	}
}
