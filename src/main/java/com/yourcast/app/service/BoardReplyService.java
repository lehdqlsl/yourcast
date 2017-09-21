package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardReplyDAO;
import com.yourcast.app.vo.BoardReplyVO;

@Service
public class BoardReplyService {
	@Autowired private BoardReplyDAO dao;
	public void setDao(BoardReplyDAO dao) {
		this.dao = dao;
	}
	public int insert(BoardReplyVO vo) {
		return dao.insert(vo);
	}
	public int delete(int br_num) {
		return dao.delete(br_num);
	}
	public int update(BoardReplyVO vo) {
		return dao.update(vo);
	}
	public BoardReplyVO getInfo(int br_num) {
		return dao.getInfo(br_num);
	}
	public List<BoardReplyVO> getList(int b_num){
		return dao.getList(b_num);
	}
}
