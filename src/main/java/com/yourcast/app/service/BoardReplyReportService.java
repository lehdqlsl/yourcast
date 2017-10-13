package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardReplyReportDAO;
import com.yourcast.app.vo.BoardReplyReportVO;
import com.yourcast.app.vo.BoardReplyVO;

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
	public BoardReplyReportVO isCheck(BoardReplyReportVO vo) {
		return dao.isCheck(vo);
	}
	
	public List<BoardReplyVO> getListAdmin(HashMap<String, Object> map){
		return dao.getListAdmin(map);
	}
	
	public int getCountAdmin() {
		return dao.getCountAdmin();
	}
	
	public List<BoardReplyReportVO> getList(int br_num){
		return dao.getList(br_num);
	}
}
