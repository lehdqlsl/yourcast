package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BoardDAO;
import com.yourcast.app.vo.BoardVO;

@Service
public class BoardService {
	@Autowired private BoardDAO dao;
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	public int insert(BoardVO vo) {
		return dao.insert(vo);
	}
	public int update(BoardVO vo) {
		return dao.update(vo);
	}
	public BoardVO getInfo(int num) {
		return dao.getInfo(num);
	}
	public List<BoardVO> getList(HashMap<String, Integer> map){
		return dao.getList(map);
	}
	public int delete(int num) {
		return dao.delete(num);
	}
	public int hitUpdate(int b_num) {
		return dao.hitUpdate(b_num);
	}
	public int getCount(HashMap<String, Integer> map) {
		return dao.getCount(map);
	}
}
