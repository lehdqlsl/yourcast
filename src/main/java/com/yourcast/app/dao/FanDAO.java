package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.FanVO;

@Repository
public class FanDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.FanMapper";

	public int insert(FanVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	public List<FanVO> getList(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}
	
	public int getCount(int bj_num) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",bj_num);
	}
	
	public FanVO isFan(HashMap<String, Integer> map) {
		return sqlSession.selectOne(NAMESPACE + ".isFan",map);
	}
	
	public int fanCount(int bj_num) {
		return sqlSession.selectOne(NAMESPACE + ".fanCount",bj_num);
	}
}
