package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.ExchangeDAO;
import com.yourcast.app.vo.ExchangeVO;

@Service
public class ExchangeService {
	@Autowired
	private ExchangeDAO dao;

	public void setDao(ExchangeDAO dao) {
		this.dao = dao;
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
	
	public int getexEa(int m_num) {
		return dao.getexEa(m_num);
	}
	
	public int getexMoney(int m_num) {
		return dao.getexMoney(m_num);
	}
}
