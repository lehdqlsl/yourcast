package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BuyDAO;
import com.yourcast.app.vo.BuyVO;

@Service
public class BuyService {
	@Autowired private BuyDAO dao;
	public void setDao(BuyDAO dao) {
		this.dao = dao;
	}
	public int insert(BuyVO vo) {
		return dao.insert(vo);
	}
	public List<BuyVO> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	public int getCount(int m_num) {
		return dao.getCount(m_num);
	}
}
