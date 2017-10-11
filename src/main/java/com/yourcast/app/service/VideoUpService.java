package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoUpDAO;
import com.yourcast.app.vo.VideoUpVO;

@Service
public class VideoUpService {
	@Autowired
	private VideoUpDAO dao;

	public void setDao(VideoUpDAO dao) {
		this.dao = dao;
	}

	public int insert(VideoUpVO vo) {
		return dao.insert(vo);
	}

	public int getCount(int v_num) {
		return dao.getCount(v_num);
	}
	public VideoUpVO check(VideoUpVO vo) {
		return dao.check(vo);
	}
}
