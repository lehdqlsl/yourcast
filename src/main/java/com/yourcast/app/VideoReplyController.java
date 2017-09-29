package com.yourcast.app;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoReplyService;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoReplyVO;

@Controller
public class VideoReplyController {
	@Autowired private VideoReplyService v_service;
	@Autowired private MemberService m_service;
	@RequestMapping(value="/{id}/videoreply/insert",method=RequestMethod.GET)
	public String insert(@PathVariable(value="id") String id,HttpServletRequest request) {
		//데이터 받아오기
		String sid=request.getParameter("sid");//로그인한 아이디
		MemberVO mvo=m_service.getInfo(sid);
		String vr_content=request.getParameter("vr_content");
		String vnum=request.getParameter("v_num");
		int v_num=Integer.parseInt(vnum);
		String param=request.getParameter("params");
		System.out.println("");
		
		
		System.out.println("video : "+sid);
		System.out.println("video : "+vr_content);
		System.out.println("video : "+v_num);
		System.out.println("video : "+mvo.getM_num());
		
		
		//댓글 추가
		VideoReplyVO vrvo=new VideoReplyVO(0, vr_content, null, 0, v_num, mvo.getM_num());
		v_service.insert(vrvo);
		return "redirect:/videomain/getInfo?v_num="+v_num;
	}
}
