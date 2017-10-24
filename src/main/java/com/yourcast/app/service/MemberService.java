package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yourcast.app.dao.MemberDAO;
import com.yourcast.app.vo.MemberVO;

@Service
public class MemberService {
	@Autowired private MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	public MemberVO getInfo(String id) {
		return dao.getInfo(id);
	}
	public MemberVO getInfo(int m_num) {
		return dao.getInfo(m_num);
	}
	public MemberVO chkNic(String name) {
		return dao.chkNic(name);
	}
	
	public List<MemberVO> getList(HashMap<String, Object> map) {
		return dao.getList(map);
	}
	
	public int getCount(HashMap<String, Object> map) {
		return dao.getCount(map);
	}

	public int moneyUpdate(MemberVO vo) {
		return dao.moneyUpdate(vo);
	}

	public int limitUpdate(MemberVO vo) {
		return dao.limitUpdate(vo);
	}

	public int gradeUpdate(MemberVO vo) {
		return dao.gradeUpdate(vo);
	}

	public int starcandyUpdate(MemberVO vo) {
		return dao.starcandyUpdate(vo);
	}

	public boolean isMembers(HashMap<String, String> map) {
		MemberVO vo = dao.isMember(map);
		if (vo != null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Transactional
	public int buyStar(MemberVO voM, MemberVO voS) {
		dao.moneyUpdate(voM);
		dao.starcandyUpdate(voS);
		return 1;
	}
	
	@Transactional
	public int chargeMoney(int a_money, MemberVO voM) {
		dao.moneyUpdateAdmin(a_money);
		dao.moneyUpdate(voM);
		return 1;
	}

}
