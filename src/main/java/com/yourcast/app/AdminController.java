package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.page.PageUtil;
import com.yourcast.app.service.BoardReplyReportService;
import com.yourcast.app.service.BoardReplyService;
import com.yourcast.app.service.BoardReportService;
import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoReplyReportService;
import com.yourcast.app.service.VideoReplyService;
import com.yourcast.app.service.VideoReportService;
import com.yourcast.app.service.VideoService;
import com.yourcast.app.vo.BoardReplyReportVO;
import com.yourcast.app.vo.BoardReplyVO;
import com.yourcast.app.vo.BoardReportVO;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.PagingVO;
import com.yourcast.app.vo.VideoReplyReportVO;
import com.yourcast.app.vo.VideoReplyVO;
import com.yourcast.app.vo.VideoReportVO;
import com.yourcast.app.vo.VideoVO;


@Controller
public class AdminController {
	
	@Autowired private MemberService m_service;
	@Autowired private BoardService b_service;
	@Autowired private BoardReplyService brp_service;
	@Autowired private BoardReportService br_service;
	@Autowired private BoardReplyReportService brr_service;
	@Autowired private VideoService v_service;
	@Autowired private VideoReplyService vrp_service;
	@Autowired private VideoReportService vr_service;
	@Autowired private VideoReplyReportService vrr_service;

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
											@RequestParam(value="keyword",defaultValue="")  String keyword,
											Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("id", id);
		map.put("keyword", keyword);
		
		int totalRowCount=m_service.getCount(map);	
		PageUtil pu=new PageUtil(pageNum, 15, 5, totalRowCount);	
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
	
	@RequestMapping(value = "/admin/report/video", method = RequestMethod.GET)
	public String videoReport(Model model, @RequestParam(value="pageNum",defaultValue="1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = vr_service.getCountAdmin();
		PageUtil pu = new PageUtil(pageNum, 15, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<VideoVO> vlist = vr_service.getListAdmin(map);
		model.addAttribute("vlist",vlist);
		model.addAttribute("pu",pu);
		
		return ".admin.report.video";
	}
	
	@RequestMapping(value = "/admin/report/videoReply", method = RequestMethod.GET)
	public String videoReplyReport(Model model, @RequestParam(value="pageNum",defaultValue="1") int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = vrr_service.getCountAdmin();
		PageUtil pu = new PageUtil(pageNum, 15, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<VideoReplyVO> vrrlist = vrr_service.getListAdmin(map);
		model.addAttribute("vrrlist",vrrlist);
		model.addAttribute("pu",pu);
		
		return ".admin.report.videoReply";
	}
	
	@RequestMapping(value = "/admin/report/boardDelete", method = RequestMethod.GET)
	public String boardDelete(Model model, int arr[]) {
		for(int i=0;i<arr.length;i++) {
			b_service.delete(arr[i]);
		}
		return "redirect:/admin/report/board";
	}
	
	@RequestMapping(value = "/admin/report/boardReplyDelete", method = RequestMethod.GET)
	public String boardReplyDelete(Model model, int arr[]) {
		for(int i=0;i<arr.length;i++) {
			brp_service.delete(arr[i]);
		}
		return "redirect:/admin/report/reply";
	}
	
	@RequestMapping(value = "/admin/report/videoDelete", method = RequestMethod.GET)
	public String videoDelete(Model model, int arr[]) {
		for(int i=0;i<arr.length;i++) {
			v_service.delete(arr[i]);
		}
		return "redirect:/admin/report/video";
	}
	
	@RequestMapping(value = "/admin/report/videoReplyDelete", method = RequestMethod.GET)
	public String videoReplyDelete(Model model, int arr[]) {
		for(int i=0;i<arr.length;i++) {
			vrp_service.delete(arr[i]);
		}
		return "redirect:/admin/report/videoReply";
	}
	
	@RequestMapping(value = "/admin/report/boardReport", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO boardReportCheck(Model model, int b_num) {
		
		List<BoardReportVO> list = br_service.getList(b_num);
		PagingVO bplist = new PagingVO();
		bplist.setBplist(list);
		
		return bplist;
	}
	
	@RequestMapping(value = "/admin/report/boardReplyReport", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO boardReplyReportCheck(Model model, int br_num) {
		
		List<BoardReplyReportVO> list = brr_service.getList(br_num);
		PagingVO brplist = new PagingVO();
		brplist.setBrplist(list);
		
		return brplist;
	}
	
	@RequestMapping(value = "/admin/report/videoReport", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO videoReportCheck(Model model, int v_num) {
		
		List<VideoReportVO> list = vr_service.getList(v_num);
		PagingVO vplist = new PagingVO();
		vplist.setVplist(list);
		
		return vplist;
	}
	
	@RequestMapping(value = "/admin/report/videoReplyReport", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO videoReplyReportCheck(Model model, int vr_num) {
		
		List<VideoReplyReportVO> list = vrr_service.getList(vr_num);
		PagingVO vrplist = new PagingVO();
		vrplist.setVrplist(list);
		
		return vrplist;
	}

}















