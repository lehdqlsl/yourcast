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
	
	
	///////////////////////////관리자 공지사항 관련 부분////////////////////////////////////
	//공지사항 목록
	@RequestMapping(value = "/admin/notice/list", method = RequestMethod.GET)
	public String noticeList(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model) {
		//페이징 처리
		int totalRowCount=n_service.getCount();
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);
			
		System.out.println(pu.getStartRow());
		System.out.println(pu.getEndRow());
		//해시맵 만들기
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
			
		//리스트 호출해 담기
		List<NoticeVO> nlist=n_service.getList(map);
		model.addAttribute("nlist", nlist);
		model.addAttribute("pu", pu);
		return ".admin.notice.list";
	}
	//공지사항 작성 폼 가기
	@RequestMapping(value="/admin/notice/insert",method=RequestMethod.GET)
	public String noticeInsertForm() {
		return ".admin.notice.insert";
	}
	//공지사항 추가하기
	@RequestMapping(value="/admin/notice/insert",method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request) {
		String n_title=request.getParameter("title");
		String n_content=request.getParameter("content");
			
		NoticeVO nvo=new NoticeVO(0, n_title, n_content, null, 1);
			
		n_service.insert(nvo);
		return "redirect:/admin/notice/list";
	};
	//공지사항 조회
	@RequestMapping(value="/admin/notice/getInfo",method=RequestMethod.GET)
	public String noticeGetInfo(int n_num,int pageNum,Model model) {
		NoticeVO nvo= n_service.getInfo(n_num);
		model.addAttribute("nvo", nvo);
		model.addAttribute("pageNum",pageNum);
		return ".admin.notice.getInfo";
	}
	
	//////////////////////////////회원 공지사항 관리 부분//////////////////////////////////////
	//회원용 전체 출력
	@RequestMapping(value="/member/notice/list",method=RequestMethod.GET)
	public String memberNoticeList(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model) {
		//페이징 처리
		int totalRowCount=n_service.getCount();
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);
		
		//해시맵만들기
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//리스트 출력
		List<NoticeVO> nlist= n_service.getList(map);
		
		model.addAttribute("nlist",nlist);
		model.addAttribute("pu",pu);
		return ".member.notice.list";
	}
	//회원용 조회
	@RequestMapping(value="/member/notice/getInfo",method=RequestMethod.GET)
	public String memberNoticeGetInfo(int n_num,int pageNum,Model model) {
		NoticeVO nvo= n_service.getInfo(n_num);
		model.addAttribute("nvo", nvo);
		model.addAttribute("pageNum", pageNum);
		return ".member.notice.getInfo";
	}
}
