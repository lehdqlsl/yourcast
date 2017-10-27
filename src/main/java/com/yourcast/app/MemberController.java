package com.yourcast.app;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourcast.app.service.BroadcastService;
import com.yourcast.app.service.BuyService;
import com.yourcast.app.service.GenreService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.PayService;
import com.yourcast.app.vo.BroadcastVO;
import com.yourcast.app.vo.BuyVO;
import com.yourcast.app.vo.GenreVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.PayVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService mservice;
	@Autowired
	private BuyService b_service;
	@Autowired
	private BroadcastService bro_service;
	@Autowired
	private PayService p_service;
	@Autowired
	private GenreService g_service;

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

	// 약관
	@RequestMapping(value = "/member/service", method = RequestMethod.GET)
	public String service(Locale locale, Model model) {
		return ".member.join.service";
	}

	// 로그인
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		if(id.equals("admin")) {
			return "redirect:/admin/profit/list";
		}else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);
			boolean r = mservice.isMembers(map);
			if (r) {
				HttpSession session = request.getSession();;
				session.setAttribute("id", id);
				// 로그인 후 이전페이지가지게
				return "redirect:/";
			} else {
				request.setAttribute("errMsg", "아이디 혹은 비밀번호가 맞지않습니다");
				return ".member.join.login";
			}
		}
	}
	//update
	@RequestMapping(value="/member/join/update",method=RequestMethod.GET)
	public String getinfo(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		MemberVO vo = mservice.getInfo(id);
		model.addAttribute("vo", vo);
		return ".member.join.update";
	}
	
	@RequestMapping(value="/member/join/update",method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		MemberVO vo1 = mservice.getInfo(id);
		
		MemberVO vo = new MemberVO(vo1.getM_num(), id, pwd, name, null, 0, null, 0, 0, 0);
		
		int n = mservice.update(vo);
		if(n>0) {
			return "redirect:/";
		} else {
			return ".main";
		}
	}

	// 회원가입
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
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}

	// 아이디 중복
	@RequestMapping(value = "/usingid/json", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String usingId(String id) {
		MemberVO vo = mservice.getInfo(id);
		JSONObject json = new JSONObject();
		if (vo != null) {
			json.put("using", true);
		} else {
			json.put("using", false);
		}
		return json.toString();
	}
	//닉네임 중복
	@RequestMapping(value = "/usingname/json", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String usingNick(String name) {
		MemberVO vo = mservice.chkNic(name);
		JSONObject json = new JSONObject();
		if (vo != null) {
			json.put("user", true);
		} else {
			json.put("user", false);
		}
		return json.toString();
	}

	@RequestMapping(value = "/member/charge/star", method = RequestMethod.GET)
	public String star() {
		return ".member.charge.star";
	}

	@RequestMapping(value = "/member/charge/buyStar", method = RequestMethod.POST)
	public String buyStar(int buy_ea1, int buy_ea2, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);

		int m_num = mvo.getM_num();
		int buy_ea = buy_ea1 * buy_ea2;
		int star_candy = mvo.getStar_candy() + buy_ea;
		int money = -(buy_ea * 110);

		// mservice.moneyUpdate(new MemberVO(m_num, money, 0));
		// mservice.starcandyUpdate(new MemberVO(m_num, 0, star_candy));

		mservice.buyStar(new MemberVO(m_num, money, 0), new MemberVO(m_num, 0, star_candy));

		b_service.insert(new BuyVO(0, null, buy_ea, m_num));

		model.addAttribute("exit", "exit");

		return "/member/charge/starCharge";
	}

	@RequestMapping(value = "/member/charge/starCharge", method = RequestMethod.GET)
	public String buyStar1(int ea, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		DecimalFormat df = new DecimalFormat("#,##0");
		String money = df.format(mvo.getMoney());
		model.addAttribute("ea", ea);
		model.addAttribute("money", money);
		model.addAttribute("money1", mvo.getMoney());
		return "/member/charge/starCharge";
	}

	@RequestMapping(value = "/member/charge/money", method = RequestMethod.GET)
	public String money(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);

		List<PayVO> plist = p_service.getInfo();
		model.addAttribute("plist", plist);
		model.addAttribute("mvo", mvo);
		return "/member/charge/money";
	}

	@RequestMapping(value = "/member/charge/moneyCharge", method = RequestMethod.POST)
	public String moneyCharge(int pay, int moneyC, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);

		System.out.println("페이:"+pay);
		System.out.println("돈:"+moneyC);
		// mservice.moneyUpdate(new MemberVO(mvo.getM_num(), mvo.getMoney() + moneyC,
		// 0));
		mservice.chargeMoney(moneyC, new MemberVO(mvo.getM_num(), moneyC, 0));
		p_service.insert(new PayVO(0, moneyC, null, mvo.getM_num(), pay, null));

		model.addAttribute("exit", "exit");

		return "/member/charge/money";
	}

	@RequestMapping(value = "/member/broadcast", method = RequestMethod.GET)
	public String broadcast(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		List<GenreVO> glist = g_service.getList();
		int m_num = mvo.getM_num();
		BroadcastVO bvo = bro_service.getInfo(m_num);

		model.addAttribute("bvo", bvo);
		model.addAttribute("glist", glist);
		return ".member.broadcast.broadcast";
	}

	@RequestMapping(value = "/member/broadcast/update", method = RequestMethod.POST)
	public String broadcastUpdate(HttpSession session, Model model, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		MemberVO mvo = mservice.getInfo(id);
		int m_num = mvo.getM_num();

		String broadcast_title = request.getParameter("broadcast_title");
		String genre_num = request.getParameter("genre_num");
		String frmAdult = request.getParameter("frmAdult");
		String frmAccess = request.getParameter("frmAccess");
		String frmAccessCode = null;

		BroadcastVO bvo = new BroadcastVO();
		bvo.setBroadcast_title(broadcast_title);
		bvo.setGenre_num(Integer.parseInt(genre_num));
		bvo.setM_num(m_num);
		if (frmAdult == null) {
			bvo.setAge_grade_num(1);
		} else {
			bvo.setAge_grade_num(2);
		}

		if (frmAccess == null) {
			bvo.setBroadcast_pwd(null);
		} else {
			frmAccessCode = request.getParameter("frmAccessCode");
			bvo.setBroadcast_pwd(frmAccessCode);
		}

		bro_service.update(bvo);

		return "redirect:/member/broadcast";
	}
	@RequestMapping(value="/adult/check",produces="application/json;charset=utf-8")
	@ResponseBody
	public String adultCheck(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		MemberVO mvo=mservice.getInfo(id);
		
		Date birth= mvo.getBirth();
		
		Calendar c1=Calendar.getInstance();
		c1.setTimeInMillis(birth.getTime());
		int birthyear=c1.get(Calendar.YEAR);
		
		Calendar c2=Calendar.getInstance();
		int year=c2.get(Calendar.YEAR);
		
		JSONObject json=new JSONObject();
		if(year-birthyear>=19) {
			json.put("result", true);
		}else {
			json.put("result", false);
		}
		return json.toString();
	}
}
