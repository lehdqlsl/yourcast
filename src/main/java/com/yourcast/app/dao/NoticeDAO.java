package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.NoticeMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(NoticeVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public NoticeVO getInfo(int n_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", n_num);
	}

	public List<NoticeVO> getList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}

	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".getCount");
	}
	public int hit(int n_num) {
		return sqlSession.update(NAMESPACE+".hit",n_num);
	}
}
