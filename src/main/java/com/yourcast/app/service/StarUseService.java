package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.StarUseDAO;
import com.yourcast.app.vo.StarUseVO;

@Service
public class StarUseService {

	@Autowired private StarUseDAO dao;
	public void setDao(StarUseDAO dao) {
		this.dao = dao;
	}
	
	public int insert(StarUseVO vo) {
		return dao.insert(vo);
	}
	
	public List<StarUseVO> getSendList(HashMap<String, Object> map){
		return dao.getSendList(map);
	}
	
	public List<StarUseVO> getRecvList(HashMap<String, Object> map){
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
}
