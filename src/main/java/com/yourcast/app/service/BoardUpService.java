package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardUpDAO;
import com.yourcast.app.vo.BoardUpVO;

@Service
public class BoardUpService {
	@Autowired
	private BoardUpDAO dao;

	public void setDao(BoardUpDAO dao) {
		this.dao = dao;
	}

	public int insert(BoardUpVO vo) {
		return dao.insert(vo);
	}

	public int getCount(int b_num) {
		return dao.getCount(b_num);
	}
	public BoardUpVO isCheck(BoardUpVO vo) {
		return dao.isCheck(vo);
	}
}
