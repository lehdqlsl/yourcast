package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.GradeVO;

@Repository
public class GradeDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.GradeMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public GradeVO getInfo(int grade_num) {
		return sqlSession.selectOne(NAMESPACE+".getInfo",grade_num);
	}
	public List<GradeVO> getList(){
		return sqlSession.selectList(NAMESPACE+".getList");
	}
	
	public GradeVO getInfo1(String grade_name){
		return sqlSession.selectOne(NAMESPACE + ".getInfo1",grade_name);
	}
}
