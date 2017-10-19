package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BroadcastDAO;
import com.yourcast.app.vo.BroadcastVO;

@Service
public class BroadcastService {
	@Autowired
	private BroadcastDAO dao;

	public void setDao(BroadcastDAO dao) {
		this.dao = dao;
	}

	public BroadcastVO getInfo(int m_num) {
		return dao.getInfo(m_num);
	}

	public List<BroadcastVO> getList() {
		return dao.getList();
	}
	
	public List<BroadcastVO> getList(int genre_num) {
		return dao.getList(genre_num);
	}

	public int insert(BroadcastVO vo) {
		return dao.insert(vo);
	}

	public int getCount() {
		return dao.getCount();
	}

	public int update(BroadcastVO vo) {
		return dao.update(vo);
	}
}
