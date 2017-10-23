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
	public List<ProfitVO> getList(HashMap<String,Object> map){
		return dao.getList(map);
	}
	public int getCount(HashMap<String, Object> map) {
		return dao.getCount(map);
	}
	
	public List<ProfitVO> getRank(){
		return dao.getRank();
	}
	public List<ProfitVO> getProfit() {
		return dao.getProfit();
	}
}
