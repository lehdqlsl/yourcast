package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yourcast.app.dao.FanDAO;
import com.yourcast.app.dao.MemberDAO;
import com.yourcast.app.dao.StarUseDAO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.StarUseVO;

@Service
public class StarUseService {

	@Autowired
	private StarUseDAO dao;
	@Autowired
	private MemberDAO m_dao;
	@Autowired
	private FanDAO f_dao;

	public void setDao(StarUseDAO dao) {
		this.dao = dao;
	}

	@Transactional
	public int insert(StarUseVO vo, MemberVO bjvo, MemberVO uvo) {
		dao.insert(vo);
		int bjstar = bjvo.getStar_candy();
		int userstar = uvo.getStar_candy();
		bjvo.setStar_candy((bjstar + vo.getUse_ea()));
		uvo.setStar_candy((userstar - vo.getUse_ea()));
		m_dao.starcandyUpdate(bjvo);
		m_dao.starcandyUpdate(uvo);
		return 1;
	}

	public List<StarUseVO> getSendList(HashMap<String, Object> map) {
		return dao.getSendList(map);
	}

	public List<StarUseVO> getRecvList(HashMap<String, Object> map) {
		return dao.getRecvList(map);
	}

	public int getSendCount(int m_num) {
		return dao.getSendCount(m_num);
	}

	public int getRecvCount(int bj_num) {
		return dao.getRecvCount(bj_num);
	}

	public int getSendEa(int m_num) {
		return dao.getSendEa(m_num);
	}

	public int getRecvEa(int bj_num) {
		return dao.getRecvEa(bj_num);
	}

	public List<StarUseVO> getHotfList(int bj_num) {
		return dao.getHotfList(bj_num);
	}
}