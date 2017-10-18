package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.page.PageUtil;
import com.yourcast.app.service.NoticeService;
import com.yourcast.app.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired private NoticeService n_service;
	
	
	///////////////////////////������ �������� ���� �κ�////////////////////////////////////
	//�������� ���
	@RequestMapping(value = "/admin/notice/list", method = RequestMethod.GET)
	public String noticeList(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model) {
		//����¡ ó��
		int totalRowCount=n_service.getCount();
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);
			
		System.out.println(pu.getStartRow());
		System.out.println(pu.getEndRow());
		//�ؽø� �����
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
			
		//����Ʈ ȣ���� ���
		List<NoticeVO> nlist=n_service.getList(map);
		model.addAttribute("nlist", nlist);
		model.addAttribute("pu", pu);
		return ".admin.notice.list";
	}
	//�������� �ۼ� �� ����
	@RequestMapping(value="/admin/notice/insert",method=RequestMethod.GET)
	public String noticeInsertForm() {
		return ".admin.notice.insert";
	}
	//�������� �߰��ϱ�
	@RequestMapping(value="/admin/notice/insert",method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request) {
		String n_title=request.getParameter("title");
		String n_content=request.getParameter("content");
			
		NoticeVO nvo=new NoticeVO(0, n_title, n_content, null, 1);
			
		n_service.insert(nvo);
		return "redirect:/admin/notice/list";
	};
	//�������� ��ȸ
	@RequestMapping(value="/admin/notice/getInfo",method=RequestMethod.GET)
	public String noticeGetInfo(int n_num,int pageNum,Model model) {
		NoticeVO nvo= n_service.getInfo(n_num);
		model.addAttribute("nvo", nvo);
		model.addAttribute("pageNum",pageNum);
		return ".admin.notice.getInfo";
	}
	
	//////////////////////////////ȸ�� �������� ���� �κ�//////////////////////////////////////
	//ȸ���� ��ü ���
	@RequestMapping(value="/member/notice/list",method=RequestMethod.GET)
	public String memberNoticeList(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model) {
		//����¡ ó��
		int totalRowCount=n_service.getCount();
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);
		
		//�ؽøʸ����
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//����Ʈ ���
		List<NoticeVO> nlist= n_service.getList(map);
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("pu",pu);
		return ".member.notice.list";
	}
	//ȸ���� ��ȸ
	@RequestMapping(value="/member/notice/getInfo",method=RequestMethod.GET)
	public String memberNoticeGetInfo(int n_num,int pageNum,Model model) {
		NoticeVO nvo= n_service.getInfo(n_num);
		model.addAttribute("nvo", nvo);
		model.addAttribute("pageNum", pageNum);
		return ".member.notice.getInfo";
	}
}
