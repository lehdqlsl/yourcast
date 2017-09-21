package com.yourcast.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.MemberProfileDAO;
import com.yourcast.app.vo.MemberProfileVO;

@Service
public class MemberProfileService {
	@Autowired private MemberProfileDAO dao;
	public void setDao(MemberProfileDAO dao) {
		this.dao = dao;
	}
	public int insert(MemberProfileVO vo) {
		return dao.insert(vo);
	}
	public int imgUpdate(MemberProfileVO vo) {
		return dao.imgUpdate(vo);
	}
	public int contentUpdate(MemberProfileVO vo) {
		return dao.contentUpdate(vo);
	}
	public int msgUpdate(MemberProfileVO vo) {
		return dao.msgUpdate(vo);
	}
	public MemberProfileVO getInfo(int profile_num) {
		return dao.getInfo(profile_num);
	}
}
