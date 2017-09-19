package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.ProfitVO;

@Repository
public class ProfitDAO {
	@Autowired private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	private final String NAMESPACE="";
	public int insert() {
		return 1;
	}
	public List<ProfitVO> getList() {
		return null;
	}
	public int getCount() {
		return 1;
	}
}
