package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.page.BoardReplyList;
import com.util.page.PageUtil;
import com.util.page.VideoReplyList;
import com.yourcast.app.service.BoardReplyReportService;
import com.yourcast.app.service.BoardReplyService;
import com.yourcast.app.service.BoardReplyUpService;
import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BoardReplyReportVO;
import com.yourcast.app.vo.BoardReplyUpVO;
import com.yourcast.app.vo.BoardReplyVO;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoReplyVO;

@Controller
public class BoardReplyController {
	@Autowired
	private CategoryService c_service;

	@Autowired private BoardService b_service;
	@Autowired private BoardReplyService br_service;
	@Autowired private MemberService m_serivce;
	@Autowired private BoardReplyUpService bru_service;
	@Autowired private BoardReplyReportService brr_service;
	
	//게시판 댓글 작성
	@RequestMapping(value="/{id}/boardreply/insert")
	@ResponseBody
	public BoardReplyList insert(@PathVariable(value="id") String id,HttpServletRequest request, Model model) {
		//데이터 받아오기
		HttpSession session=request.getSession();
		String s_id=(String)session.getAttribute("id");
		String br_content=request.getParameter("br_content");
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		MemberVO mvo=m_serivce.getInfo(s_id);
		BoardReplyVO brvo=new BoardReplyVO(0, br_content, null, 0, b_num, mvo.getM_num());
		
		//댓글 추가
		br_service.insert(brvo);
		
		//페이징 처리
		int totalRowCount=br_service.getCount(b_num);
		PageUtil pu=new PageUtil(1, 5, 1, totalRowCount);
						
		//해시맵 만들기
		HashMap<String, Integer> map =new HashMap<String, Integer>();
		map.put("b_num", b_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
				
		//리스트에 담기
		List<BoardReplyVO> brlist=br_service.getList(map);
		BoardReplyList list=new BoardReplyList();
		list.setList(brlist);
		return list;
	}
	// 게시판 댓글 목록
	@RequestMapping(value = "/{id}/boardreply/list")
	@ResponseBody
	public BoardReplyList moreList(@RequestParam(value="pageNum",defaultValue="1") @PathVariable(value="id")String id, int pageNum, int b_num,int category_num) {
		CategoryVO cvo = c_service.getInfo(category_num);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", cvo.getM_num());
		map.put("category_num",category_num);
		//페이징
		int totalRowCount=br_service.getCount(b_num);
		PageUtil pu=new PageUtil(pageNum,5,1,totalRowCount);

		map.put("b_num", b_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardReplyVO> brlist = br_service.getList(map);

		BoardReplyList list = new BoardReplyList();
		list.setList(brlist);
		return list;
	}

	// 게시판 댓글 삭제
	@RequestMapping(value = "/{id}/boardreply/delete")
	@ResponseBody
	public BoardReplyList delete(@PathVariable(value = "id") String id,int br_num) {
		br_service.delete(br_num);
		BoardReplyVO brvo=br_service.getInfo(br_num);
		int b_num=brvo.getB_num();
		//페이징 처리
		int totalRowCount=br_service.getCount(b_num);
		PageUtil pu=new PageUtil(1, 5, 1, totalRowCount);
								
		//해시맵 만들기
		HashMap<String, Integer> map =new HashMap<String, Integer>();
		map.put("b_num", b_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
						
		//리스트에 담기
		List<BoardReplyVO> brlist=br_service.getList(map);
		BoardReplyList list=new BoardReplyList();
		list.setList(brlist);
		return list;
	}
	
	// 게시판 댓글 신고
	@RequestMapping(value="/replyreport/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(int br_num, String m_num) {
		MemberVO mvo = m_serivce.getInfo(m_num);
		BoardReplyReportVO vo = new BoardReplyReportVO(br_num,mvo.getM_num());
		BoardReplyReportVO brr1= brr_service.isCheck(vo);
		
		JSONObject json = new JSONObject();
		
		if(brr1!=null) { 
			json.put("result", "true");
		}else { 
			brr_service.insert(vo);
			json.put("result", "false");
		}
		return json.toString();
	}
	// 게시판 댓글 추천
	@RequestMapping(value="/replyup/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String up_insert(String m_num,int br_num) {
		MemberVO mvo = m_serivce.getInfo(m_num);
		BoardReplyUpVO vo = new BoardReplyUpVO(mvo.getM_num(),br_num);
		BoardReplyUpVO bru1 = bru_service.isCheck(vo);
		int brucount = bru_service.getCount(br_num);
		JSONObject json = new JSONObject();
		//System.out.println("�뙎湲�異붿쿇媛��닔:" + bru_service.getCount(br_num));
		//model.addAttribute("getCount",bru_service.getCount(br_num));
		if(bru1!=null) { 
			json.put("result", "true");
		}else { 
			bru_service.insert(vo);
			json.put("result", "false");
			json.put("replygetCount", bru_service.getCount(br_num));
		}
		return json.toString();
	}
	//게시판 댓글 수 받아오기
	@RequestMapping(value="/boardreply/brcount")
	@ResponseBody
	public int brCount(int b_num) {
		int n=br_service.getCount(b_num);
		return n;
	}
}
