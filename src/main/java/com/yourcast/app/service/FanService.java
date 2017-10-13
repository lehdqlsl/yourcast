package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.FanDAO;
import com.yourcast.app.vo.FanVO;

@Service
public class FanService {
	@Autowired private FanDAO dao;
	public void setDao(FanDAO dao) {
		this.dao = dao;
	}
	public int insert(FanVO vo) {
		return dao.insert(vo);
	}
	
	public List<FanVO> getList(HashMap<String, Integer> map){
		return dao.getList(map);
	}
	
	public int getCount(int bj_num) {
		return dao.getCount(bj_num);
	}
	
	public boolean isFan(HashMap<String, Integer> map) {
		if(dao.isFan(map) != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int fanCount(int bj_num) {
		return dao.fanCount(bj_num);
	}
}
