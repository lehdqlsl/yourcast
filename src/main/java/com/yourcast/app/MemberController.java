package com.yourcast.app;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.util.page.PageUtil;
import com.yourcast.app.service.BuyService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.PayService;
import com.yourcast.app.vo.BuyVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.PayVO;

@Controller
public class MemberController {
	@Autowired private MemberService mservice;
	@Autowired private BuyService b_service; 
	@Autowired private PayService p_service;

	public void setMservice(MemberService mservice) {
		this.mservice = mservice;
	}

	// �쉶�썝媛��엯 �럹�씠吏� �씠�룞
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {
		return ".member";
	}

	// 濡쒓렇�씤 �럹�씠吏� �씠�룞
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		return ".member.join.login";
	}
	// �빟愿�
		@RequestMapping(value = "/member/service", method = RequestMethod.GET)
		public String service(Locale locale, Model model) {
			return ".member.join.service";
		}
	
	// 濡쒓렇�씤
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		boolean r = mservice.isMembers(map);
		if (r) {
			// 濡쒓렇�씤 �꽦怨�
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			//濡쒓렇�씤 �썑 �씠�쟾�럹�씠吏�濡� 媛�吏�寃�
			return ".main";
		} else {
			request.setAttribute("errMsg", "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
			return ".member.join.login";
		}
	}

	// �쉶�썝媛��엯
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String join(Model model, HttpServletRequest request) {
		String email = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");

		SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");

		try {
			Date to = transFormat.parse(birth);
			MemberVO vo = new MemberVO(0, email, pwd, name, to, 0, null, 0, Integer.parseInt(gender), 1);
			mservice.insert(vo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ".main";
	}
	
	//濡쒓렇�븘�썐
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return ".main";
	}
	
	//�븘�씠�뵒 以묐났
	@RequestMapping(value="/usingid/json",produces="application/json;charset=utf-8")
	@ResponseBody
	public String usingId(String id) {
		MemberVO vo=mservice.getInfo(id);
		JSONObject json=new JSONObject();
		if(vo!=null) {
			json.put("using",true);
		}else {
			json.put("using", false);
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/member/charge/star", method = RequestMethod.GET)
	public String star() {		
		return ".member.charge.star";
	}
	
	@RequestMapping(value = "/member/charge/buyStar", method = RequestMethod.POST)
	public String buyStar(int buy_ea1,int buy_ea2,HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		
		int m_num = mvo.getM_num();
		int buy_ea = buy_ea1*buy_ea2;
		int star_candy = mvo.getStar_candy() + buy_ea;
		int money = mvo.getMoney() - (buy_ea*110);
		
//		mservice.moneyUpdate(new MemberVO(m_num, money, 0));
//		mservice.starcandyUpdate(new MemberVO(m_num, 0, star_candy));
		
		mservice.buyStar(new MemberVO(m_num, money, 0), new MemberVO(m_num, 0, star_candy));
		
		b_service.insert(new BuyVO(0, null, buy_ea, m_num));
		
		model.addAttribute("exit","exit");
		
		return "/member/charge/starCharge";
	}
	
	@RequestMapping(value = "/member/charge/starCharge", method = RequestMethod.GET)
	public String buyStar1(int ea, HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		
		model.addAttribute("ea",ea);
		model.addAttribute("money",mvo.getMoney());
		return "/member/charge/starCharge";
	}
	
	@RequestMapping(value = "/member/charge/money", method = RequestMethod.GET)
	public String money(HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		
		List<PayVO> plist = p_service.getInfo();
		model.addAttribute("plist",plist);
		model.addAttribute("mvo",mvo);
		return "/member/charge/money";
	}
	
	@RequestMapping(value = "/member/charge/moneyCharge", method = RequestMethod.POST)
	public String moneyCharge(int pay, int moneyC, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		
//		mservice.moneyUpdate(new MemberVO(mvo.getM_num(), mvo.getMoney() + moneyC, 0));
		mservice.chargeMoney(moneyC, new MemberVO(mvo.getM_num(), mvo.getMoney() + moneyC, 0));
		p_service.insert(new PayVO(0, moneyC, null, mvo.getM_num(), pay, null));
		
		model.addAttribute("exit","exit");
		
		return "/member/charge/money";
	}
}
