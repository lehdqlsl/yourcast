package com.yourcast.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.page.PageUtil;
import com.yourcast.app.service.BuyService;
import com.yourcast.app.service.ExchangeService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.PayService;
import com.yourcast.app.service.StarUseService;
import com.yourcast.app.vo.BuyVO;
import com.yourcast.app.vo.ExchangeVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.PagingVO;
import com.yourcast.app.vo.PayVO;
import com.yourcast.app.vo.StarUseVO;

@Controller
public class HistoryController {

	@Autowired private MemberService m_sevice;
	@Autowired private PayService p_service;
	@Autowired private BuyService buy_service;
	@Autowired private StarUseService use_service;
	@Autowired private ExchangeService ex_service;

	@RequestMapping(value = "/member/history/pay", method = RequestMethod.GET)
	public String pay(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
								HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = m_sevice.getInfo(id);
		int m_num = mvo.getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=p_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<PayVO> plist = p_service.getList(map);

		model.addAttribute("plist",plist);
		model.addAttribute("pu",pu);
		model.addAttribute("mvo",mvo);
		
		if(plist.isEmpty()) {
			model.addAttribute("err","결제내역이 존재하지 않습니다.");
		}
		
		return ".member.history.pay";
	}
	
	@RequestMapping(value = "/member/history/buy", method = RequestMethod.GET)
	public String buy(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
								HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = m_sevice.getInfo(id);
		int m_num = mvo.getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=buy_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<BuyVO> buylist = buy_service.getList(map);
		
		model.addAttribute("buylist",buylist);
		model.addAttribute("pu",pu);
		model.addAttribute("mvo",mvo);
		
		if(buylist.isEmpty()) {
			model.addAttribute("err","구매내역이 존재하지 않습니다.");
		}
				
		return ".member.history.buy";
	}
	
	@RequestMapping(value = "/member/history/useStar", method = RequestMethod.GET)
	public String useStar(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
								HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = m_sevice.getInfo(id);
		int m_num = mvo.getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=use_service.getSendCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<StarUseVO> uselist = use_service.getSendList(map);

		model.addAttribute("uselist",uselist);
		model.addAttribute("pu",pu);
		model.addAttribute("mvo",mvo);
		
		int total_send_ea = use_service.getSendEa(m_num);
		model.addAttribute("total_send_ea",total_send_ea);
		
		if(uselist.isEmpty()) {
			model.addAttribute("err","선물한 별사탕내역이 존재하지 않습니다.");
		}
		
		return ".member.history.useStar";
	}
	
	@RequestMapping(value = "/member/history/recvStar", method = RequestMethod.GET)
	public String recvStar(HttpSession session, Model model) {

		int pageNum = 1;
		String id = (String)session.getAttribute("id");
		MemberVO mvo = m_sevice.getInfo(id);
		int bj_num = mvo.getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bj_num", bj_num);
		int totalRowCount=use_service.getRecvCount(bj_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<StarUseVO> recvlist = use_service.getRecvList(map);

		model.addAttribute("recvlist",recvlist);
		model.addAttribute("pu",pu);
		
		HashMap<String, Object> mapEx = new HashMap<String, Object>();
		mapEx.put("m_num", bj_num);
		int totalRowCountEx=ex_service.getCount(bj_num);	
		PageUtil puEx=new PageUtil(pageNum, 5, 5, totalRowCountEx);	
		mapEx.put("startRow",puEx.getStartRow());
		mapEx.put("endRow",puEx.getEndRow());
		
		List<ExchangeVO> exlist = ex_service.getList(mapEx);

		model.addAttribute("exlist",exlist);
		model.addAttribute("puEx",puEx);
		model.addAttribute("mvo",mvo);

		model.addAttribute("total_recv_ea",use_service.getRecvEa(bj_num));
		model.addAttribute("total_ex_ea",ex_service.getexEa(bj_num));
		model.addAttribute("total_ex_money",ex_service.getexMoney(bj_num));
		
		if(exlist.isEmpty()) {
			model.addAttribute("errr","환전내역이 존재하지 않습니다.");
		}
		if(recvlist.isEmpty()) {
			model.addAttribute("err","선물받은 별사탕내역이 존재하지 않습니다.");
		}
		
		return ".member.history.recvStar";
	}
	
	@RequestMapping(value = "/member/history/ex", method = RequestMethod.GET)
	public String exchange(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
								HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		int m_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=ex_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<ExchangeVO> exlist = ex_service.getList(map);

		model.addAttribute("exlist",exlist);
		model.addAttribute("pu",pu);
		
		return ".member.history.exchange";
	}
	
	@RequestMapping(value = "/member/history/recvStarPaging", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO recvStarPaging(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int bj_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bj_num", bj_num);
		int totalRowCount=use_service.getRecvCount(bj_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<StarUseVO> recvlist = use_service.getRecvList(map);
		PagingVO listp = new PagingVO();
		listp.setRecvlist(recvlist);

		return listp;
	}
	
	@RequestMapping(value = "/member/history/recvStarPagingPre", method = RequestMethod.GET)
	@ResponseBody
	public int recvStarPagingPre(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int bj_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bj_num", bj_num);
		int totalRowCount=use_service.getRecvCount(bj_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		
		int endPageNum = pu.getEndPageNum();

		return endPageNum;
	}
	
	@RequestMapping(value = "/member/history/recvStarPagingNext", method = RequestMethod.GET)
	@ResponseBody
	public int recvStarPagingNext(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int bj_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bj_num", bj_num);
		int totalRowCount=use_service.getRecvCount(bj_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		
		int endPageNum = pu.getEndPageNum();

		return endPageNum;
	}
	
	@RequestMapping(value = "/member/history/exStarPagingNext", method = RequestMethod.GET)
	@ResponseBody
	public int exStarPagingNext(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int m_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=ex_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		
		int endPageNum = pu.getEndPageNum();

		return endPageNum;
	}
	
	@RequestMapping(value = "/member/history/exStarPagingPre", method = RequestMethod.GET)
	@ResponseBody
	public int exStarPagingPre(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int m_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=ex_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		
		int endPageNum = pu.getEndPageNum();

		return endPageNum;
	}
	
	@RequestMapping(value = "/member/history/exStarPaging", method = RequestMethod.GET)
	@ResponseBody
	public PagingVO exStarPaging(@RequestParam(value="pageNum",defaultValue="1")  int pageNum,
											HttpSession session) {
		String id = (String)session.getAttribute("id");
		int m_num = m_sevice.getInfo(id).getM_num();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", m_num);
		int totalRowCount=ex_service.getCount(m_num);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<ExchangeVO> exlist = ex_service.getList(map);
		PagingVO listp = new PagingVO();
		listp.setExlist(exlist);

		return listp;
	}
	
	@RequestMapping(value = "/member/history/exchange", method = RequestMethod.GET)
	public String exStarPaging(HttpSession session) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = m_sevice.getInfo(id);
		int m_num = mvo.getM_num();
		
		int grade = mvo.getGrade_num();
		if(grade == 1) {
			ex_service.insert(40,mvo);
		}else if(grade == 2) {
			ex_service.insert(30,mvo);
		}else if(grade ==3) {
			ex_service.insert(20,mvo);
		}
			


		return "redirect:/member/history/recvStar";
	}
}
