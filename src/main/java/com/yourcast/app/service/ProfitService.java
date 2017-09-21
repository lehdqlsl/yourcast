package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.ProfitDAO;
import com.yourcast.app.vo.ProfitVO;

@Service
public class ProfitService {
	@Autowired private ProfitDAO dao;
	public void setDao(ProfitDAO dao) {
		this.dao = dao;
	}
	public int insert(ProfitVO vo) {
		return dao.insert(vo);
	}
	public List<ProfitVO> getList(){
		return dao.getList();
	}
	public int getCount(HashMap<String, Integer> map) {
		return dao.getCount(map);
	}
}
