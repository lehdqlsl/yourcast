package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.GradeDAO;
import com.yourcast.app.vo.GradeVO;

@Service
public class GradeService {
	@Autowired private GradeDAO dao;
	public void setDao(GradeDAO dao) {
		this.dao = dao;
	}
	public GradeVO getInfo(int grade_num) {
		return dao.getInfo(grade_num);
	}
	public List<GradeVO> getList(){
		return dao.getList();
	}
	
	public GradeVO getInfo1(String grade_name) {
		return dao.getInfo1(grade_name);
	}
}
