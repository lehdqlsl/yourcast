package com.yourcast.app.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.yourcast.app.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.MemberMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(MemberVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	public int update(MemberVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}

	public MemberVO getInfo(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", m_num);
	}

	public List<MemberVO> getList() {
		return sqlSession.selectList(NAMESPACE + ".getList");
	}

	public int moneyUpdate(MemberVO vo) {
		return sqlSession.update(NAMESPACE + ".moneyUpdate", vo);
	}

	public int limitUpdate(MemberVO vo) {
		return sqlSession.update(NAMESPACE + ".limitUpdate", vo);
	}

	public int gradeUpdate(MemberVO vo) {
		return sqlSession.update(NAMESPACE + ".gradeUpdate", vo);
	}

	public int starcandyUpdate(MemberVO vo) {
		return sqlSession.update(NAMESPACE + ".starcandyUpdate", vo);
	}
}
