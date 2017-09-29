package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.GenreDAO;
import com.yourcast.app.vo.GenreVO;

@Service
public class GenreService {
	@Autowired private GenreDAO dao;
	public void setDao(GenreDAO dao) {
		this.dao = dao;
	}
	public GenreVO getInfo(int genre_num) {
		return dao.getInfo(genre_num);
	}
	public List<GenreVO> getList(){
		return dao.getList();
	}
}
