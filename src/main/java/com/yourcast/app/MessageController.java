package com.yourcast.app;

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

import com.util.page.PageUtil;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.MsgService;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.MsgVO;


@Controller
public class MessageController {
	@Autowired private MsgService msg_service;
	@Autowired private MemberService m_service;
	
	//쪽지 페이지로 이동
	@RequestMapping(value="/message/main")
	public String msgMain(@RequestParam(value="pageNumR",defaultValue="1") int pageNumR,@RequestParam(value="pageNumS",defaultValue="1") int pageNumS,@RequestParam(value="cate",defaultValue="1") int cate, Model model,HttpServletRequest request) {
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
		model.addAttribute("cate",cate);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist",slist);
		model.addAttribute("pur",pur);
		model.addAttribute("pus",pus);
		return ".member.message.msgmain";
	}
	//쪽지 전송 페이지로 이동
	@RequestMapping(value="/message/send",method=RequestMethod.GET)
	public String msgSendForm() {
		return "/member/message/send";
	}
	//쪽지 전송
	@RequestMapping(value="/message/send",method=RequestMethod.POST)
	public String msgSend(HttpServletRequest request) {
		String s_id=request.getParameter("s_id");//보낸 사람 아이디
		String r_id=request.getParameter("r_id");//받는 사람 아이디
		String msg_title=request.getParameter("msg_title");//제목
		String msg_content=request.getParameter("msg_content");//내용
	
		//회원 번호 얻어오기
		MemberVO mvo1=m_service.getInfo(s_id);
		MemberVO mvo2=m_service.getInfo(r_id);
		int m_numS=mvo1.getM_num();
		int m_numR=mvo2.getM_num();
	
		///////////존재하는 아이디인지 확인하는 작업/////////////
		
		////////////////////////////////////////////////
		
		MsgVO msgvo=new MsgVO(0, msg_title, msg_content, null, 0, 0, 0, m_numS, m_numR);
		msg_service.insert(msgvo);
		
		return ".personnel.board.success";
	}
	//받은 쪽지 조회
}
