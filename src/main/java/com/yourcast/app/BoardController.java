package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.page.PageUtil;
import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.MemberProfileService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.MemberProfileVO;
import com.yourcast.app.vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService b_service;
	@Autowired
	private CategoryService c_service;
	@Autowired private MemberService m_service;
	@Autowired private MemberProfileService mp_service;
	//insert : get
	@RequestMapping(value = "/{id}/board/insert", method = RequestMethod.GET)
	public String insertForm(@PathVariable(value="id") String id, Model model) {
		MemberVO vo=m_service.getInfo(id);
		List<CategoryVO> clist=c_service.getList(vo.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("voMP", voMP);		
		return ".personnel.board.insert";
	}
	//insert : post
	@RequestMapping(value="/{id}/board/insert",method=RequestMethod.POST)
	public String insert(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@PathVariable(value="id") String id,HttpServletRequest request, HttpSession session,Model model) {
		String sid=request.getParameter("sid");
		MemberVO vo1=m_service.getInfo(sid);
		int m_num=vo1.getM_num();
		MemberVO mvo=m_service.getInfo(id);
		int bj_num=mvo.getM_num();//bj������ ��ȣ
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String notice=request.getParameter("notice");
		String category=request.getParameter("cate_list");
		//�������� ����
		int category_num=Integer.parseInt(category);
		int a=0;
		if(notice==null) {
			a=0;
		}else {
			a=1;
		}
		//�߰� �۾�
		BoardVO bvo=new BoardVO(0,title,content,null, 0, a, 0, m_num, bj_num, category_num);
		b_service.insert(bvo);
	
		//ī�װ� ����Ʈ ����
		CategoryVO vo = c_service.getInfo(category_num);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", vo.getM_num());
		map.put("category_num",category_num);
		
		//����¡ ó��
		int totalRowCount=b_service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,15,5,totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//getListó��
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		List<BoardVO> blist = b_service.getList(map);
		
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("voMP", voMP);
		
		model.addAttribute("id", id);
		model.addAttribute("pu", pu);
		model.addAttribute("category_num", category_num);
		model.addAttribute("clist", clist);
		model.addAttribute("blist", blist);
		
		return ".personnel.board.list";
	}
	@RequestMapping(value="/{id}/board/delete")
	public String delete(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@PathVariable(value="id") String id,int b_num,int category_num,Model model) {
		b_service.delete(b_num);
		CategoryVO vo = c_service.getInfo(category_num);
		
		//ī�װ� ����Ʈ ����
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", vo.getM_num());
		map.put("category_num",category_num);
				
		//����¡ ó��
		int totalRowCount=b_service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,15,5,totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
				
		//getListó��
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		List<BoardVO> blist = b_service.getList(map);
				
		model.addAttribute("id", id);
		model.addAttribute("pu", pu);
		model.addAttribute("category_num", category_num);
		model.addAttribute("clist", clist);
		model.addAttribute("blist", blist);
		
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.board.list";
	}
	//update
	@RequestMapping(value="/{id}/board/update",method=RequestMethod.GET)
	public String updateForm(@PathVariable(value="id") String id, int b_num, int category_num,Model model) {
		BoardVO bvo=b_service.getInfo(b_num);

		CategoryVO cvo = c_service.getInfo(category_num);
		List<CategoryVO> clist = c_service.getList(cvo.getM_num());
		
		model.addAttribute("id", id);
		model.addAttribute("clist", clist);
		model.addAttribute("vo",bvo);
		
		MemberProfileVO voMP = mp_service.getInfo(cvo.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.board.update";
	}
	
	//updateOk
	@RequestMapping(value="/{id}/board/update",method=RequestMethod.POST)
	public String update(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@PathVariable(value="id") String id,HttpServletRequest request, HttpSession session,Model model) {
		String b_num=request.getParameter("b_num");
		int bnum=Integer.parseInt(b_num);
		String sid=request.getParameter("sid");
		MemberVO vo1=m_service.getInfo(sid);
		int m_num=vo1.getM_num();
		MemberVO mvo=m_service.getInfo(id);
		int bj_num=mvo.getM_num();//bj������ ��ȣ
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String notice=request.getParameter("notice");
		String category=request.getParameter("cate_list");
		
		System.out.println(title);
		System.out.println(content);
		
		//�������� ����
		int category_num=Integer.parseInt(category);
		int a=0;
		if(notice==null) {
			a=0;
		}else {
			a=1;
		}
		//���� �۾�
		BoardVO bvo=new BoardVO(bnum,title,content,null, 0, a, 0, m_num, bj_num, category_num);
		b_service.update(bvo);
		
		
		//ī�װ� ����Ʈ ����
		CategoryVO vo = c_service.getInfo(category_num);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", vo.getM_num());
		map.put("category_num",category_num);
				
		//����¡ ó��
		int totalRowCount=b_service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,15,5,totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
				
		//getListó��
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		List<BoardVO> blist = b_service.getList(map);
		model.addAttribute("id", id);
		model.addAttribute("pu", pu);
		model.addAttribute("category_num", category_num);
		model.addAttribute("clist", clist);
		model.addAttribute("blist", blist);
		
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.board.list";
	}
	//getInfo
	@RequestMapping(value="/{id}/board/getInfo",method=RequestMethod.GET)
	public String getInfo(@PathVariable(value="id") String id,int b_num,int category_num, Model model) {
		BoardVO bvo=b_service.getInfo(b_num);

		CategoryVO cvo = c_service.getInfo(category_num);
		List<CategoryVO> clist = c_service.getList(cvo.getM_num());
		//List<BoardVO> blist = b_service.getList(category_num);
		model.addAttribute("id", id);
		model.addAttribute("clist", clist);
		//model.addAttribute("blist", blist);
		model.addAttribute("vo",bvo);
		
		MemberProfileVO voMP = mp_service.getInfo(cvo.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.board.getInfo";
	}
	//getList
	@RequestMapping(value = "/{id}/board/list", method = RequestMethod.GET)
	public String list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@PathVariable(value="id") String id,int category_num, Model model) {
		CategoryVO vo = c_service.getInfo(category_num);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", vo.getM_num());
		map.put("category_num",category_num);
		
		//����¡ ó��
		int totalRowCount=b_service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,15,5,totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//getListó��
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		List<BoardVO> blist = b_service.getList(map);
		model.addAttribute("id", id);
		model.addAttribute("pu", pu);
		model.addAttribute("category_num", category_num);
		model.addAttribute("clist", clist);
		model.addAttribute("blist", blist);
		
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.board.list";
	}
}
