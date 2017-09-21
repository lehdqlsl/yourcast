package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.ProfitVO;

@Repository
public class ProfitDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.ProfitMapper";

	public int insert(ProfitVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<ProfitVO> getList() {
		List<ProfitVO> plist = sqlSession.selectList(NAMESPACE + ".getList");
		return plist;
	}

	public int getCount(HashMap<String, Integer> map) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",map);
	}
}
