package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BlacklistVO;
import org.apache.ibatis.session.SqlSession;

@Repository
public class BlacklistDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";
	
	public int insert(BlacklistVO vo) {
		return sqlSession.insert(NAMESPACE + ".",vo);		
	}
	
	public int delete(BlacklistVO vo) {
		return sqlSession.delete(NAMESPACE + ".",vo);
	}
	
	public List<BlacklistVO> getList(int bj_num) {
		return sqlSession.selectList(NAMESPACE + ".",bj_num);
	}
	
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".");
	}
}
