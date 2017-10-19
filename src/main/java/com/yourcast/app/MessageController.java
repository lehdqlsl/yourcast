package com.yourcast.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.xml.internal.ws.config.management.policy.ManagementPolicyValidator;
import com.util.page.PageUtil;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.MsgService;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.MsgVO;


@Controller
public class MessageController {
	@Autowired private MsgService msg_service;
	@Autowired private MemberService m_service;
	
	//받은 쪽지함
	@RequestMapping(value="/message/recv/list")
	public String recvList(@RequestParam(value="pageNumR",defaultValue="1") int pageNumR,Model model,HttpServletRequest request) {
		//로그인한 회원번호 얻어오기
		HttpSession session =request.getSession();
		String id = (String) session.getAttribute("id");
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		/////////////////////받은 쪽지함////////////////////////
		//페이지 클래스
		int totalRowCountR=msg_service.recvCount(m_num);
		PageUtil pur=new PageUtil(pageNumR, 15, 5, totalRowCountR);
		
		//받은 쪽지함 map
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("m_numR", m_num);
		map1.put("startRow", pur.getStartRow());
		map1.put("endRow", pur.getEndRow());
		
		//받은 쪽지 리스트 얻어오기
		List<MsgVO> rlist=msg_service.getRecvList(map1);
		///////////////////////////////////////////////////////
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("pur",pur);
		return ".member.message.recvmsglist";
	}
	//보낸 쪽지함
	@RequestMapping(value="/message/send/list")
	public String sendList(@RequestParam(value="pageNumS",defaultValue="1") int pageNumS, Model model,HttpServletRequest request) {
		//로그인한 회원번호 얻어오기
		HttpSession session =request.getSession();
		String id = (String) session.getAttribute("id");
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		////////////////////보낸 쪽지함///////////////////////////
		//페이지 클래스
		int totalRowCountS=msg_service.sendCount(m_num);
		PageUtil pus=new PageUtil(pageNumS, 15, 5, totalRowCountS);
		
		//보낸 쪽지함 map
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("m_numS", m_num);
		map2.put("startRow", pus.getStartRow());
		map2.put("endRow", pus.getEndRow());
		
		//보낸 쪽지 리스트 얻어오기
		List<MsgVO> slist=msg_service.getSendList(map2);
		///////////////////////////////////////////////////////
		model.addAttribute("slist",slist);
		model.addAttribute("pus",pus);
		return ".member.message.sendmsglist";
	}
	//쪽지 전송 페이지로 이동
	@RequestMapping(value="/message/send",method=RequestMethod.GET)
	public String msgSendForm(Model model, String id) {
		model.addAttribute("id",id);
		return "/member/message/send";
	}
	//쪽지 전송
	@RequestMapping(value="/message/send",method=RequestMethod.POST)
	public String msgSend(HttpServletRequest request) {
		String s_id=request.getParameter("s_id");//보낸 사람 아이디
		String r_id=request.getParameter("recv_id");//받는 사람 아이디
		String msg_title=request.getParameter("msg_title");//제목
		String msg_content=request.getParameter("content");//내용
		
		//회원 번호 얻어오기
		MemberVO mvo1=m_service.getInfo(s_id);
		MemberVO mvo2=m_service.getInfo(r_id);
		
		///////////존재하는 아이디인지 확인하는 작업/////////////
	
		if(mvo2==null) {//존재하지 않는 아이디
			return "/member/message/sendfail";
		}else {//존재하는 아이디
			int m_numS=mvo1.getM_num();
			int m_numR=mvo2.getM_num();
			MsgVO msgvo=new MsgVO(0, msg_title, msg_content, null, 0, 0, 0, m_numS, m_numR);
			msg_service.insert(msgvo);
			return "/member/message/sendsuccess";
		}
		////////////////////////////////////////////////	
	}
	//받은 쪽지 조회
	@RequestMapping(value="/message/recv/getInfo",method=RequestMethod.GET)
	public String recvMsg(HttpServletRequest request,Model model) {
		int msg_num=Integer.parseInt(request.getParameter("msg_num"));
		MsgVO msgvo= msg_service.recvmsg(msg_num);
		
		//조회수 올리기
		msg_service.viewDate(msg_num);
		
		model.addAttribute("msgvo",msgvo);
		return "/member/message/recvmsg";
	}
	//보낸 쪽지 조회
	@RequestMapping(value="/message/send/getInfo")
	public String sendMsg(HttpServletRequest request, Model model) {
		int msg_num=Integer.parseInt(request.getParameter("msg_num"));
		MsgVO msgvo=msg_service.sendmsg(msg_num);
		
		model.addAttribute("msgvo",msgvo);
		return "/member/message/sendmsg";
	}
	//받은 쪽지 한 개 삭제
	@RequestMapping(value="/message/recv/deleteOne")
	public String recvDeleteOne(HttpServletRequest request) {
		int msg_num=Integer.parseInt(request.getParameter("msg_num"));
		msg_service.recvDelete(msg_num);
		return "/member/message/recvdelete";
	}
	//보낸 쪽지 한 개 삭제
	@RequestMapping(value="/message/send/deleteOne")
	public String sendDeleteOne(HttpServletRequest request) {
		int msg_num=Integer.parseInt(request.getParameter("msg_num"));
		msg_service.sendDelete(msg_num);
		return "/member/message/senddelete";
	}
	//받은 쪽지 목록 삭제
	@RequestMapping(value="/message/recv/deleteList")
	public String recvDeleteList(int [] arr) {
		for(int i=0;i<arr.length;i++) {
			//System.out.println(arr[i]);
			msg_service.recvDelete(arr[i]);
		}
		return "redirect:/message/recv/list";
	}
	//보낸 쪽지 목록 삭제
	@RequestMapping(value="/message/send/deleteList")
	public String sendDeleteList(int [] arr) {
		for(int i=0;i<arr.length;i++) {
			//System.out.println(arr[i]);
			msg_service.sendDelete(arr[i]);
		}
		return "redirect:/message/send/list";
	}
}
