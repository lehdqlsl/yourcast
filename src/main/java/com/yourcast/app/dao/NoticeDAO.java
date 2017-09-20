package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(NoticeVO vo) {
		return sqlSession.insert(NAMESPACE + "", vo);
	}

	public NoticeVO getInfo(int n_num) {
		return sqlSession.selectOne(NAMESPACE + "", n_num);
	}

	public List<NoticeVO> getList() {
		return sqlSession.selectList(NAMESPACE + "");
	}

	public int getCount() {
		return sqlSession.selectOne(NAMESPACE + "");
	}
}
