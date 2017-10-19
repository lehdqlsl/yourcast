package com.yourcast.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourcast.app.vo.CategoryVO;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.jhta.mybatis.CategoryMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(CategoryVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int update(CategoryVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public int delete(CategoryVO vo) {
		return sqlSession.insert(NAMESPACE + ".delete", vo);
	}

	public CategoryVO getInfo(int category_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", category_num);
	}

	public List<CategoryVO> getList(int m_num) {
		return sqlSession.selectList(NAMESPACE + ".getlist", m_num);
	}
	
	public CategoryVO getCategory_num(CategoryVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".getCate_num", vo);
	}
}
