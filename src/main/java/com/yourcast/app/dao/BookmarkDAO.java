package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.BookmarkVO;

@Repository
public class BookmarkDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.BookmarkMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(BookmarkVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public List<BookmarkVO> getList(int m_num) {
		List<BookmarkVO> mlist = sqlSession.selectList(NAMESPACE + ".getList",m_num);
		return mlist;
	}

	public int delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE + ".delete", map);
	}
	public BookmarkVO check(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".check",map);
	}
}
