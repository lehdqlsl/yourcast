package com.yourcast.app.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public List<MemberVO> getList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}
	
	public int getCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".getCount",map);
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
	public MemberVO getInfo(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", id);
	}
	public MemberVO getInfo(int m_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo2", m_num);
	}
	public MemberVO chkNic(String name) {
		return sqlSession.selectOne(NAMESPACE + ".chkNic", name);
	}
	public MemberVO isMember(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE + ".isMember", map);
	}
	
	public int moneyUpdateAdmin(int a_money) {
		return sqlSession.update(NAMESPACE + ".moneyUpdateAdmin",a_money);
	}
}
