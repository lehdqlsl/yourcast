package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReportDAO;
import com.yourcast.app.vo.VideoReportVO;
import com.yourcast.app.vo.VideoVO;



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
	
	public List<VideoVO> getListAdmin(HashMap<String, Object> map){
		return dao.getListAdmin(map);
	}
	
	public int getCountAdmin() {
		return dao.getCountAdmin();
	}
	
	public List<VideoReportVO> getList(int v_num){
		return dao.getList(v_num);
	}
}
