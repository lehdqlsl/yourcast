package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardReplyUpDAO;
import com.yourcast.app.vo.BoardReplyUpVO;

@Service
public class BoardReplyUpService {

	@Autowired private BoardReplyUpDAO dao;
	public void setDao(BoardReplyUpDAO dao) {
		this.dao = dao;
	}
	
	public int insert(BoardReplyUpVO vo) {
		return dao.insert(vo);
	}
	
	public int getCount(int br_num) {
		return dao.getCount(br_num);
	}
}
