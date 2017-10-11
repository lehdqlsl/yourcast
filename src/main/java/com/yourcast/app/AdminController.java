package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.page.PageUtil;
import com.yourcast.app.service.BoardReplyReportService;
import com.yourcast.app.service.BoardReportService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BoardReplyVO;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoVO;


@Controller
public class AdminController {
	
	@Autowired private MemberService m_service;
	@Autowired private BoardReportService br_service;
	@Autowired private BoardReplyReportService brr_service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		
		return ".admin";
	}
	
	@RequestMapping(value = "/admin/member/list", method = RequestMethod.GET)
	public String memberList(Model model, @RequestParam(value="pageNum",defaultValue="1")  int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount=m_service.getCount(map);	
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());

		List<MemberVO> mlist = m_service.getList(map);
		model.addAttribute("mlist",mlist);
		model.addAttribute("pu",pu);
		
		return ".admin.member.list";
	}
	
	@RequestMapping(value = "/admin/member/listFind", method = RequestMethod.GET)
	public String memberListFind(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											@RequestParam(value="name",defaultValue="")  String name,
											@RequestParam(value="id",defaultValue="")  String id,
											@RequestParam(value="sum",defaultValue="")  String sum,
											@RequestParam(value="option",defaultValue="")  String option,
											@RequestParam(value="keyword",defaultValue="")  String keyword,
											Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("id", id);
		map.put("sum", sum);
		map.put("keyword", keyword);
		
		int totalRowCount=m_service.getCount(map);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<MemberVO> mlist = m_service.getList(map);
		model.addAttribute("mlist",mlist);
		model.addAttribute("pu",pu);
		model.addAttribute("keyword",keyword);
		
		return ".admin.member.list";
	}
	
	@RequestMapping(value = "/admin/report/board", method = RequestMethod.GET)
	public String boardReport(Model model, @RequestParam(value="pageNum",defaultValue="1")  int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount=br_service.getCountAdmin();	
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<BoardVO> blist = br_service.getListAdmin(map);
		model.addAttribute("blist",blist);
		model.addAttribute("pu",pu);
		
		return ".admin.report.board";
	}
	
	@RequestMapping(value = "/admin/report/reply", method = RequestMethod.GET)
	public String replyReport(Model model, @RequestParam(value="pageNum",defaultValue="1")  int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount=brr_service.getCountAdmin();	
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<BoardReplyVO> brrlist = brr_service.getListAdmin(map);
		model.addAttribute("brrlist",brrlist);
		model.addAttribute("pu",pu);
		
		return ".admin.report.reply";
	}
}