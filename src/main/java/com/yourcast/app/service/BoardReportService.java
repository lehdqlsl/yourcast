package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardReportDAO;
import com.yourcast.app.vo.BoardReportVO;

@Service
public class BoardReportService {
	@Autowired private BoardReportDAO dao;
	public void setDao(BoardReportDAO dao) {
		this.dao = dao;
	}
	public int insert(BoardReportVO vo) {
		return dao.insert(vo);
	}
	public int getCount(int b_num) {
		return dao.getCount(b_num);
	}
	public BoardReportVO isCheck(BoardReportVO vo) {
		return dao.isCheck(vo);
	}
}
