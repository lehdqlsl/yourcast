package com.yourcast.app.service;

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

	public List<ExchangeVO> getList(int m_num) {
		return dao.getList(m_num);
	}

	public int getCount(int m_num) {
		return dao.getCount(m_num);
	}

	public int insert(ExchangeVO vo) {
		return dao.insert(vo);
	}
}
