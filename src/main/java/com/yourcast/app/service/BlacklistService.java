package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BlacklistDAO;
import com.yourcast.app.vo.BlacklistVO;

@Service
public class BlacklistService {

	@Autowired private BlacklistDAO dao;
	public void setDao(BlacklistDAO dao) {
		this.dao = dao;
	}
	
	public int insert(BlacklistVO vo) {
		return dao.insert(vo);
	}
	
	public int delete(BlacklistVO vo) {
		return dao.delete(vo);
	}
	
	public List<BlacklistVO> getList(int bj_num){
		return dao.getList(bj_num);
	}
	
	public int getCount(int bj_num) {
		return dao.getCount(bj_num);
	}

}
