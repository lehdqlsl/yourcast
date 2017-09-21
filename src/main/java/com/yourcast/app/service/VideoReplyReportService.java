package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReplyReportDAO;
import com.yourcast.app.vo.VideoReplyReportVO;

@Service
public class VideoReplyReportService {

	@Autowired private VideoReplyReportDAO dao;
	public void setDao(VideoReplyReportDAO dao) {
		this.dao = dao;
	}
	
	public int insert(VideoReplyReportVO vo) {
		return dao.insert(vo);
	}
	
	public int getCount(int vr_num) {
		return dao.getCount(vr_num);
	}
}
