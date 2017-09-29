package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.yourcast.app.service.BoardReplyService;
import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BoardReplyVO;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.MemberVO;

@Controller
public class BoardReplyController {
	@Autowired
	private CategoryService c_service;
	@Autowired private BoardService b_service;
	@Autowired private BoardReplyService br_service;
	@Autowired private MemberService m_serivce;
	//¥Ò±€ ¿€º∫
	@RequestMapping(value="/{id}/boardreply/insert",method=RequestMethod.POST)
	public String insert(@PathVariable(value="id") String id,HttpServletRequest request, Model model) {
		MemberVO mvo=m_serivce.getInfo(id);
		String br_content=request.getParameter("br_content");
		String bnum=request.getParameter("b_num");
		//System.out.println(br_content);
		int b_num=Integer.parseInt(bnum);
		BoardReplyVO brvo=new BoardReplyVO(0, br_content, null, 0, b_num, mvo.getM_num());
		br_service.insert(brvo);
		
		BoardVO bvo= b_service.getInfo(b_num);
		int category_num=bvo.getCategory_num();
		return "redirect:/personnel/board/getInfo?b_num="+b_num+"&category_num="+category_num;
	}
	//¥Ò±€ √‚∑¬
	@RequestMapping(value="/{id}/boardreply/list")
	@ResponseBody
	public BoardReplyList moreList(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@PathVariable(value="id") String id,int b_num,int category_num,Model model) {
		CategoryVO vo = c_service.getInfo(category_num);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", vo.getM_num());
		map.put("category_num",category_num);
		
		//∆‰¿Ã¬° √≥∏Æ
		int totalRowCount=br_service.getCount(b_num);
		PageUtil pu=new PageUtil(pageNum,5,1,totalRowCount);
		map.put("b_num", b_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardReplyVO> brlist= br_service.getList(map);
		
		BoardReplyList list= new BoardReplyList();
		list.setList(brlist);
		return list;
	}
	//¥Ò±€ ªË¡¶
	@RequestMapping(value="/{id}/boardreply/delete")
	public String delete(int br_num,int b_num,int category_num){
		br_service.delete(br_num);
		return "redirect:/personnel/board/getInfo?b_num="+b_num+"&category_num="+category_num;
	}
}
