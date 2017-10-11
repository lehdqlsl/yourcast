package com.yourcast.app;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoReplyReportService;
import com.yourcast.app.service.VideoReplyUpService;
import com.yourcast.app.service.VideoReportService;
import com.yourcast.app.service.VideoUpService;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoReplyReportVO;
import com.yourcast.app.vo.VideoReplyUpVO;
import com.yourcast.app.vo.VideoReportVO;
import com.yourcast.app.vo.VideoUpVO;

@Controller
public class VideoReportUpController {
	@Autowired private VideoReportService vr_service;
	@Autowired private MemberService m_service;
	@Autowired private VideoUpService vu_service;
	@Autowired private VideoReplyReportService vrr_service;
	@Autowired private VideoReplyUpService vru_service;
	
	//동영상 신고
	@RequestMapping(value="/video/report",produces="application/json;charset=utf-8")
	@ResponseBody
	public String videoReport(int v_num, String id) {
		//아이디로 m_num추출
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		//기존에 신고 기록이 있는지 확인
		VideoReportVO vrvo1=new VideoReportVO(v_num, m_num);
		VideoReportVO vrvo2=vr_service.check(vrvo1);
		
		JSONObject json=new JSONObject();
		if(vrvo2==null) {//처음 신고한 글
			vr_service.insert(vrvo1);//신고 작업
			json.put("result", true);
		}else {//이미 신고할 글
			json.put("result", false);
		}
		return json.toString();
	}
	//동영상 추천
	@RequestMapping(value="/video/up",produces="application/json;charset=utf-8")
	@ResponseBody
	public String videoUp(int v_num, String id) {
		//아이디로 m_num추출
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		//기존에 추천 기록이 있는지 확인
		VideoUpVO vuvo1=new VideoUpVO(m_num, v_num);
		VideoUpVO vuvo2=vu_service.check(vuvo1);
		
		//추천 수 받아오기
		int vucount=0;
		JSONObject json=new JSONObject();
		if(vuvo2==null) {//처음 추천한 글
			vu_service.insert(vuvo1);//추천 작업
			vucount=vu_service.getCount(v_num);
			json.put("result", true);
			json.put("vucount",vucount);
		}else {//이미 추천한 글
			json.put("result", false);
		}
		return json.toString();
	}
	//동영상 댓글 신고
	@RequestMapping(value="/video/reply/report",produces="application/json;charset=utf-8")
	@ResponseBody
	public String videoReplyReport(int vr_num, String id) {
		//아이디로 m_num추출
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		//기존에 신고 기록이 있는지 확인
		VideoReplyReportVO vrrvo1=new VideoReplyReportVO(m_num, vr_num);
		VideoReplyReportVO vrrvo2=vrr_service.check(vrrvo1);
		
		JSONObject json=new JSONObject();
		if(vrrvo2==null) {//처음 신고한 댓글
			vrr_service.insert(vrrvo1);//신고 작업
			json.put("result", true);
		}else {//이미 신고한 댓글
			json.put("result", false);
		}
		return json.toString();
	}
	//동영상 댓글 추천
	@RequestMapping(value="/video/reply/up",produces="application/json;charset=utf-8")
	@ResponseBody
	public String videoReplyUp(int vr_num, String id) {
		//아이디로 m_num추출
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		//기존에 추천 기록이 있는지 확인
		VideoReplyUpVO vruvo1=new VideoReplyUpVO(m_num, vr_num);
		VideoReplyUpVO vruvo2=vru_service.check(vruvo1);
		
		//댓글 추천 수 담기
		int vrucount=0;
		JSONObject json=new JSONObject();
		if(vruvo2==null) {//처음 추천한 댓글
			vru_service.insert(vruvo1);
			vrucount=vru_service.getCount(vr_num);
			json.put("result", true);
			json.put("vrucount", vrucount);
		}else {
			json.put("result", false);
		}
		return json.toString();
	}
}
