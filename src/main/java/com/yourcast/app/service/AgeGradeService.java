package com.yourcast.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourcast.app.dao.AgeGradeDAO;
import com.yourcast.app.dao.GenreDAO;
import com.yourcast.app.vo.AgeGradeVO;
import com.yourcast.app.vo.GenreVO;

@Service
public class AgeGradeService {
	@Autowired private AgeGradeDAO dao;
	public void setDao(AgeGradeDAO dao) {
		this.dao = dao;
	}
	public AgeGradeVO getInfo(int age_grade_num) {
		return dao.getInfo(age_grade_num);
	}
	public List<AgeGradeVO> getList(){
		return dao.getList();
	}
}
