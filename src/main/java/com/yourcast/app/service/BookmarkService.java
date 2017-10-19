package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.BookmarkDAO;
import com.yourcast.app.vo.BookmarkVO;


@Service
public class BookmarkService {
	@Autowired private BookmarkDAO dao;
	public void setDao(BookmarkDAO dao) {
		this.dao = dao;
	}
	public int insert(BookmarkVO vo) {
		return dao.insert(vo);
	}
	public List<BookmarkVO> getList(int m_num){
		return dao.getList(m_num);
	}
	public int delete(HashMap<String, Object> map) {
		return dao.delete(map);
	}
	public BookmarkVO check(HashMap<String, Object> map) {
		return dao.check(map);
	}
}
