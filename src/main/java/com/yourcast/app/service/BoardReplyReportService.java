package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardReplyReportDAO;
import com.yourcast.app.vo.BoardReplyReportVO;

@Service
public class BoardReplyReportService {

	@Autowired
	private BoardReplyReportDAO dao;

	public void setDao(BoardReplyReportDAO dao) {
		this.dao = dao;
	}

	public int insert(BoardReplyReportVO vo) {
		return dao.insert(vo);
	}

	public int getCount(int br_num) {
		return dao.getCount(br_num);
	}
}
