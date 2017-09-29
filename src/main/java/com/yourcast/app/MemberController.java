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
import com.yourcast.app.vo.BuyVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.PayVO;

@Controller
public class MemberController {
	@Autowired private MemberService mservice;
	@Autowired private BuyService b_service; 

	public void setMservice(MemberService mservice) {
		this.mservice = mservice;
	}

	// ȸ������ ������ �̵�
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {
		return ".member";
	}

	// �α��� ������ �̵�
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		return ".member.join.login";
	}
	// ���
		@RequestMapping(value = "/member/service", method = RequestMethod.GET)
		public String service(Locale locale, Model model) {
			return ".member.join.service";
		}
	
	// �α���
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		boolean r = mservice.isMembers(map);
		if (r) {
			// �α��� ����
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			return ".main";
		} else {
			request.setAttribute("errMsg", "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return ".member.join.login";
		}
	}

	// ȸ������
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
	
	//�α׾ƿ�
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return ".main";
	}
	
	//���̵� �ߺ�
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
		
		mservice.moneyUpdate(new MemberVO(m_num, money, 0));
		mservice.starcandyUpdate(new MemberVO(m_num, 0, star_candy));
		
		b_service.insert(new BuyVO(0, null, buy_ea, m_num));
		
		model.addAttribute("mvo",mvo);
		
		return ".member.charge.star";
	}
	
	@RequestMapping(value = "/member/charge/money", method = RequestMethod.POST)
	public String money(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		int m_num = mvo.getM_num();
		
		model.addAttribute("mvo",mvo);
		
		return ".member.charge.money";
	}
}
