package com.yourcast.app;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService b_service;
	@Autowired
	private CategoryService c_service;
	@Autowired private MemberService m_service;
	
	@RequestMapping(value = "/board/insert", method = RequestMethod.GET)
	public String insertForm(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		MemberVO vo=m_service.getInfo(id);
		List<CategoryVO> clist=c_service.getList(vo.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		return ".personnel.board.insert";
	}
	@RequestMapping(value="/board/insert",method=RequestMethod.POST)
	public String insert(HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");//접속해 있는 페이지의 아이디(bj_id)
		MemberVO mvo=m_service.getInfo(id);
		int bj_num=mvo.getM_num();//접속해 있는 페이지의 회원 번호(bj_num)
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		//추가 작업
		//BoardVO bvo=new BoardVO(0,title,content,null, 0, b_notice, 0, 1, bj_num, category_num);
		
		//b_service.insert(vo);
	
		return null;
	}

	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,int category_num, Model model) {
		String id=request.getParameter("id");
		CategoryVO vo = c_service.getInfo(category_num);
		
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		model.addAttribute("id", id);
		model.addAttribute("clist", clist);
		
		List<BoardVO> blist = b_service.getList(category_num);
		model.addAttribute("blist", blist);
		return ".personnel.board.list";
	}
}
