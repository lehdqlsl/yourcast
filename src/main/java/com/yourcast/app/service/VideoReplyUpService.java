package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReplyUpDAO;
import com.yourcast.app.vo.VideoReplyUpVO;

@Service
public class VideoReplyUpService {

	@Autowired private VideoReplyUpDAO dao;
	public void setDao(VideoReplyUpDAO dao) {
		this.dao = dao;
	}
	
	public int insert(VideoReplyUpVO vo) {
		return dao.insert(vo);
	}
	
	public int getCount(int vr_num) {
		return dao.getCount(vr_num);
	}
}
