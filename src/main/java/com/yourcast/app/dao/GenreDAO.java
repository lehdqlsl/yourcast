package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.GenreVO;

@Repository
public class GenreDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.GenreMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public GenreVO getInfo(int genre_num) {
		return sqlSession.selectOne(NAMESPACE+".getInfo",genre_num);
	}
	public List<GenreVO> getList(){
		return sqlSession.selectList(NAMESPACE+".getList");
	}
}
