package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yourcast.app.dao.ExchangeDAO;
import com.yourcast.app.dao.MemberDAO;
import com.yourcast.app.dao.ProfitDAO;
import com.yourcast.app.vo.ExchangeVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.ProfitVO;

@Service
public class ExchangeService {
	@Autowired
	private ExchangeDAO dao;
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private ProfitDAO pdao;

	public void setDao(ExchangeDAO dao) {
		this.dao = dao;
	}

	public MemberDAO getMdao() {
		return mdao;
	}

	public ProfitDAO getPdao() {
		return pdao;
	}

	public ExchangeDAO getDao() {
		return dao;
	}

	public List<ExchangeVO> getList(HashMap<String, Object> map) {
		return dao.getList(map);
	}

	public int getCount(int m_num) {
		return dao.getCount(m_num);
	}

	public int insert(ExchangeVO vo) {
		return dao.insert(vo);
	}

	@Transactional
	public void insert(int fee, MemberVO vo) {
		ExchangeVO evo = new ExchangeVO(0, vo.getStar_candy(), (double) fee, null, vo.getM_num());
		dao.insert(evo);
		pdao.insert(new ProfitVO(0, (fee * vo.getStar_candy()), null, vo.getM_num()));
		MemberVO update_vo = new MemberVO(vo.getM_num(), ((100-fee) * vo.getStar_candy()), 0);
		mdao.moneyUpdate(update_vo);
		mdao.starcandyUpdate(update_vo);
	}

	public int getexEa(int m_num) {
		return dao.getexEa(m_num);
	}

	public int getexMoney(int m_num) {
		return dao.getexMoney(m_num);
	}
}
