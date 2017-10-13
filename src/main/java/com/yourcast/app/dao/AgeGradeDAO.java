package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.AgeGradeVO;

@Repository
public class AgeGradeDAO {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.AgeGradeMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public AgeGradeVO getInfo(int age_grade_num) {
		return sqlSession.selectOne(NAMESPACE+".getInfo",age_grade_num);
	}
	public List<AgeGradeVO> getList(){
		return sqlSession.selectList(NAMESPACE+".getList");
	}
}
