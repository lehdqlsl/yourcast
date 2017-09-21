package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.PayDAO;
import com.yourcast.app.vo.PayVO;

@Service
public class PayService {

	@Autowired private PayDAO dao;
	public void setDao(PayDAO dao) {
		this.dao = dao;
	}
	
	public int insert(PayVO vo) {
		return dao.insert(vo);
	}
	
	public List<PayVO> getList(int m_num){
		return dao.getList(m_num);
	}
	
	public int getCount(int m_num) {
		return dao.getCount(m_num);
	}
}
