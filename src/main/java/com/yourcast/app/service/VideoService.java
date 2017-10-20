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
	public int getCount(HashMap<String, Object> map) {
		return dao.getCount(map);
	}
	
	public List<VideoVO> getMemberList(HashMap<String, Object> map){
		return dao.getMemberList(map);
	}
	public List<VideoVO> getGenreList(HashMap<String, Object> map){
		return dao.getGenreList(map);
	}
	public List<VideoVO> allList(HashMap<String, Object> map){
		return dao.allList(map);
	}
	public int allCount() {
		return dao.allCount();
	}
	public List<VideoVO> getBookmarkList(int m_num){
		return dao.getBookmarkList(m_num);
	}
	public List<VideoVO> mainVideoList(int m_num){
		return dao.mainVideoList(m_num);
	}
}
