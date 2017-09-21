package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private final String NAMESPACE = "com.jhta.mybatis.BoardMapper";

	public int insert(BoardVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int update(BoardVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public BoardVO getInfo(int num) {
		BoardVO vo = sqlSession.selectOne(NAMESPACE + ".getinfo", num);
		return vo;
	}

	public List<BoardVO> getList() {
		List<BoardVO> blist = sqlSession.selectList(NAMESPACE + ".getlist");
		return blist;
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete", num);
	}

	public int hitUpdate(int  b_num) {
		return sqlSession.update(NAMESPACE + ".hitUpdate", b_num);
	}

	public int getCount(HashMap<String, Integer>map) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",map);
	}
}
