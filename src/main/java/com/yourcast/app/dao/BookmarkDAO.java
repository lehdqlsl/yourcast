package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
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

	public List<BookmarkVO> getList() {
		List<BookmarkVO> mlist = sqlSession.selectList(NAMESPACE + ".getList");
		return mlist;
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete", num);
	}
}
