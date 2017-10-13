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
	
	//���� �������� �̵�
	@RequestMapping(value="/message/main")
	public String msgMain(@RequestParam(value="pageNumR",defaultValue="1") int pageNumR,@RequestParam(value="pageNumS",defaultValue="1") int pageNumS,@RequestParam(value="cate",defaultValue="1") int cate, Model model,HttpServletRequest request) {
		//�α����� ȸ����ȣ ������
		HttpSession session =request.getSession();
		String id = (String) session.getAttribute("id");
		MemberVO mvo=m_service.getInfo(id);
		int m_num=mvo.getM_num();
		
		/////////////////////���� ������////////////////////////
		//������ Ŭ����
		int totalRowCountR=msg_service.recvCount(m_num);
		PageUtil pur=new PageUtil(pageNumR, 15, 5, totalRowCountR);
		
		//���� ������ map
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("m_numR", m_num);
		map1.put("startRow", pur.getStartRow());
		map1.put("endRow", pur.getEndRow());
		
		//���� ���� ����Ʈ ������
		List<MsgVO> rlist=msg_service.getRecvList(map1);
		///////////////////////////////////////////////////////
		////////////////////���� ������///////////////////////////
		//������ Ŭ����
		int totalRowCountS=msg_service.sendCount(m_num);
		PageUtil pus=new PageUtil(pageNumS, 15, 5, totalRowCountS);
		
		//���� ������ map
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("m_numS", m_num);
		map2.put("startRow", pus.getStartRow());
		map2.put("endRow", pus.getEndRow());
		
		//���� ���� ����Ʈ ������
		List<MsgVO> slist=msg_service.getSendList(map2);
		///////////////////////////////////////////////////////
		model.addAttribute("cate",cate);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist",slist);
		model.addAttribute("pur",pur);
		model.addAttribute("pus",pus);
		return ".member.message.msgmain";
	}
	//���� ���� �������� �̵�
	@RequestMapping(value="/message/send",method=RequestMethod.GET)
	public String msgSendForm() {
		return "/member/message/send";
	}
	//���� ����
	@RequestMapping(value="/message/send",method=RequestMethod.POST)
	public String msgSend(HttpServletRequest request) {
		String s_id=request.getParameter("s_id");//���� ��� ���̵�
		String r_id=request.getParameter("r_id");//�޴� ��� ���̵�
		String msg_title=request.getParameter("msg_title");//����
		String msg_content=request.getParameter("msg_content");//����
	
		//ȸ�� ��ȣ ������
		MemberVO mvo1=m_service.getInfo(s_id);
		MemberVO mvo2=m_service.getInfo(r_id);
		int m_numS=mvo1.getM_num();
		int m_numR=mvo2.getM_num();
	
		///////////�����ϴ� ���̵����� Ȯ���ϴ� �۾�/////////////
		
		////////////////////////////////////////////////
		
		MsgVO msgvo=new MsgVO(0, msg_title, msg_content, null, 0, 0, 0, m_numS, m_numR);
		msg_service.insert(msgvo);
		
		return ".personnel.board.success";
	}
	//���� ���� ��ȸ
}
