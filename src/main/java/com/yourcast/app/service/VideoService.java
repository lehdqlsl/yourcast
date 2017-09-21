package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoDAO;
import com.yourcast.app.vo.VideoVO;

@Service
public class VideoService {
	@Autowired private VideoDAO dao;
	public void setDao(VideoDAO dao) {
		this.dao = dao;
	}
	public int hitUpdate(int v_num) {
		return dao.hitUpdate(v_num);
	}
	public int update(VideoVO vo) {
		return dao.update(vo);
	}
	public int delete(int num) {
		return dao.delete(num);
	}
	public VideoVO getInfo(int num) {
		return dao.getInfo(num);
	}
	public int insert(VideoVO vo) {
		return dao.insert(vo);
	}
	public List<VideoVO> getList(){
		return dao.getList();
	}
	public int getCount(HashMap<String, Integer> map) {
		return dao.getCount(map);
	}
}
