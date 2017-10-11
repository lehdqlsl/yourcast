package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReportDAO;
import com.yourcast.app.vo.VideoReportVO;



@Service
public class VideoReportService {
	@Autowired private VideoReportDAO dao;
	public void setDao(VideoReportDAO dao) {
		this.dao = dao;
	}
	public int insert(VideoReportVO vo) {
		return dao.insert(vo);
	}
	public int getCount(int v_num) {
		return dao.getCount(v_num);
	}
	public VideoReportVO check(VideoReportVO vo) {
		return dao.check(vo);
	}
}
