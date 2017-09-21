package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.SubscribeDAO;
import com.yourcast.app.vo.SubscribeVO;

@Service
public class SubscribeService {
	@Autowired
	private SubscribeDAO dao;

	public void setDao(SubscribeDAO dao) {
		this.dao = dao;
	}

	public int delete(SubscribeVO vo) {
		return dao.delete(vo);
	}

	public int insert(SubscribeVO vo) {
		return dao.insert(vo);
	}

	public List<SubscribeVO> getList(int m_num) {
		return dao.getList(m_num);
	}
}
