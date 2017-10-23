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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourcast.app.dao.MemberProfileDAO;
import com.yourcast.app.service.BlacklistService;
import com.yourcast.app.service.BroadcastService;
import com.yourcast.app.service.FanService;
import com.yourcast.app.service.MemberProfileService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.StarUseService;
import com.yourcast.app.service.SubscribeService;
import com.yourcast.app.vo.BlacklistVO;
import com.yourcast.app.vo.BroadcastVO;
import com.yourcast.app.vo.FanVO;
import com.yourcast.app.vo.MemberProfileVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.StarUseVO;
import com.yourcast.app.vo.SubscribeVO;

@Controller
public class BroadcastController {
	@Autowired
	private BroadcastService bservice;

	@Autowired
	private MemberService mservice;

	@Autowired
	private StarUseService sservice;

	@Autowired
	private StarUseService star_service;

	@Autowired
	private FanService f_service;

	@Autowired
	private MemberProfileService profile_service;

	@Autowired
	private BlacklistService black_service;

	@Autowired
	private SubscribeService sub_service;

	@RequestMapping(value = "/bs/{id}", method = RequestMethod.GET)
	public String home(@PathVariable(value = "id") String id, Model model, HttpServletRequest request) {
		
		MemberVO bjvo = mservice.getInfo(id);
		if(bjvo!=null) {
			MemberProfileVO provo = profile_service.getInfo(bjvo.getM_num());
			BroadcastVO bvo = bservice.getInfo(bjvo.getM_num());
			String stream_key = bservice.getInfo(bjvo.getM_num()).getStream_key();
			String url = "rtmp://192.168.0.31:3535/myapp/" + stream_key;

			HttpSession session = request.getSession();
			String uid = (String) session.getAttribute("id");
			model.addAttribute("black", "false");
			MemberVO vo = null;
			if (uid != null) {
				vo = mservice.getInfo(uid);
				model.addAttribute("vo", vo);

				// ¿­Ç÷ÆÒ ¸®½ºÆ®
				List<StarUseVO> list = star_service.getHotfList(bjvo.getM_num());

				// ÆÒ °Ë»ö
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("m_num", vo.getM_num());
				map.put("bj_num", bjvo.getM_num());
				System.out.println("ÁñÃ£:"+sub_service.isBookmark(new SubscribeVO(vo.getM_num(), bjvo.getM_num())));
				model.addAttribute("bookmark", sub_service.isBookmark(new SubscribeVO(vo.getM_num(), bjvo.getM_num())));
				boolean isFan = f_service.isFan(map);
				
				// ÆÒµî±Þ°Ë»ö
				if (id.equals(uid)) {
					// bj
					model.addAttribute("grade", "bj");
				} else if (isFan) {
					model.addAttribute("grade", "fan");
					// ¿­Ç÷ÆÒ È®ÀÎ
					for (StarUseVO svo : list) {
						if (svo.getM_num() == vo.getM_num()) {
							model.addAttribute("grade", "hot");
							break;
						}
					}
				} else {
					model.addAttribute("grade", "user");
				}
				
				//ºí·¢¸®½ºÆ® È®ÀÎ
				boolean black = black_service.check(new BlacklistVO(0, vo.getM_num(), bjvo.getM_num()));
				if(black) {
					model.addAttribute("black", "true");
				}
				
			}

			
			model.addAttribute("url", url);
			model.addAttribute("bj_num", bjvo.getM_num());
			model.addAttribute("bjvo", bjvo);
			model.addAttribute("bvo", bvo);
			model.addAttribute("voMP", provo);
			
			return ".broadcast";
		}else {
			return ".member.nopage";
		}
		
	}

	@RequestMapping(value = "/broadcast/starcandy", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insert(int cnt, String bjid, String uid) {
		JSONObject json = new JSONObject();
		try {
			MemberVO bjvo = mservice.getInfo(bjid);
			MemberVO uvo = mservice.getInfo(uid);

			// ÆÒ °Ë»ö
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			int m_num = uvo.getM_num();
			int bj_num = bjvo.getM_num();
			map.put("m_num", m_num);
			map.put("bj_num", bj_num);
			boolean isFan = f_service.isFan(map);

			if (!isFan) {
				f_service.insert(new FanVO(0, m_num, bj_num));
			}

			json.put("result", uvo.getStar_candy() - cnt);
			json.put("fancnt", null);
			
		
			StarUseVO star = new StarUseVO(0, null, cnt, uvo.getM_num(), bjvo.getM_num());

			sservice.insert(star, bjvo, uvo);

			// ¿­Ç÷ÆÒ ¸®½ºÆ®
			List<StarUseVO> list = star_service.getHotfList(bjvo.getM_num());

			// ÆÒµî±Þ°Ë»ö
			if (isFan) {
				json.put("grade", "fan");
				// ¿­Ç÷ÆÒ È®ÀÎ
				for (StarUseVO svo : list) {
					if (svo.getM_num() == uvo.getM_num()) {
						json.put("grade", "hot");
						break;
					}
				}
			} else {
				int fancount = f_service.fanCount(bjvo.getM_num());
				json.put("grade", "fan");
				// ¿­Ç÷ÆÒ È®ÀÎ
				for (StarUseVO svo : list) {
					if (svo.getM_num() == uvo.getM_num()) {
						json.put("grade", "hot");
						break;
					}
				}
				json.put("fancnt", fancount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	@RequestMapping(value = "/broadcast/password", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String password(String bjid, String pwd) {
		JSONObject json = new JSONObject();
		try {
			MemberVO bjvo = mservice.getInfo(bjid);
			BroadcastVO bvo = bservice.getInfo(bjvo.getM_num());
			if (pwd.equals(bvo.getBroadcast_pwd())) {
				json.put("result", true);
			} else {
				json.put("result", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}

	@RequestMapping(value = "/broadcast/bookmark/insert", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String bookmarkInsert(String bjid, HttpServletRequest request) {
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("id");
		MemberVO user = mservice.getInfo(uid);
		MemberVO bj = mservice.getInfo(bjid);
		try {
			sub_service.insert(new SubscribeVO(user.getM_num(), bj.getM_num()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/broadcast/bookmark/delete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String bookmarkDelete(String bjid,HttpServletRequest request) {
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("id");
		MemberVO user = mservice.getInfo(uid);
		MemberVO bj = mservice.getInfo(bjid);
		
		try {
			sub_service.delete(new SubscribeVO(user.getM_num(), bj.getM_num()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}
}
