package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReplyReportDAO;
import com.yourcast.app.vo.VideoReplyReportVO;
import com.yourcast.app.vo.VideoReplyVO;

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
	public VideoReplyReportVO check(VideoReplyReportVO vo) {
		return dao.check(vo);
	}
	
	public List<VideoReplyVO> getListAdmin(HashMap<String, Object> map){
		return dao.getListAdmin(map);
	}
	
	public int getCountAdmin() {
		return dao.getCountAdmin();
	}
}
