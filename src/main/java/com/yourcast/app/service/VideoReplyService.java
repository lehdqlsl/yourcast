package com.yourcast.app.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.VideoReplyDAO;
import com.yourcast.app.vo.VideoReplyVO;

@Service
public class VideoReplyService {
	@Autowired private VideoReplyDAO dao;
	public void setDao(VideoReplyDAO dao) {
		this.dao = dao;
	}
	public int insert(VideoReplyVO vo) {
		return dao.insert(vo);
	}
	public int delete(int vr_num) {
		return dao.delete(vr_num);
	}
	public int update(VideoReplyVO vo) {
		return dao.update(vo);
	}
	public VideoReplyVO getInfo(int vr_num) {
		return dao.getInfo(vr_num);
	}
	public List<VideoReplyVO> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	public int getCount(int v_num) {
		return dao.getCount(v_num);
	}
	
}
