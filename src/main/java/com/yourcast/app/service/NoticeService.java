package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.NoticeDAO;
import com.yourcast.app.vo.NoticeVO;

@Service
public class NoticeService {
	@Autowired private NoticeDAO dao;
	public void setDao(NoticeDAO dao) {
		this.dao = dao;
	}
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	}
	public NoticeVO getInfo(int n_num) {
		return dao.getInfo(n_num);
	}
	public List<NoticeVO> getList(){
		return dao.getList();
	}
	public int getCount() {
		return dao.getCount();
	}
}
