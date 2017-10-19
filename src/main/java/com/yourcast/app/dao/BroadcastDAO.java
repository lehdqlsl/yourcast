package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BroadcastVO;

@Repository
public class BroadcastDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.BroadcastMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public BroadcastVO getInfo(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo", m_num);
	}

	public List<BroadcastVO> getList() {
		return sqlSession.selectList(NAMESPACE + ".getlist");
	}

	public int insert(BroadcastVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + ".getcount");
	}

	public int update(BroadcastVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public List<BroadcastVO> getList(int genre_num) {
		return sqlSession.selectList(NAMESPACE + ".getlist1",genre_num);
	}
}
