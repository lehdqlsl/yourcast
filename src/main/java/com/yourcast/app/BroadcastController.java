package com.yourcast.app;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yourcast.app.service.BroadcastService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.vo.BroadcastVO;
import com.yourcast.app.vo.MemberVO;

@Controller
public class BroadcastController {
	@Autowired
	private BroadcastService bservice;

	@Autowired
	private MemberService mservice;

	@RequestMapping(value = "/bs/{id}", method = RequestMethod.GET)
	public String home(@PathVariable(value = "id") String id, Model model, HttpServletRequest request) {
		MemberVO bjvo = mservice.getInfo(id);
		BroadcastVO bvo = bservice.getInfo(bjvo.getM_num());
		String stream_key = bservice.getInfo(bjvo.getM_num()).getStream_key();
		String url = "rtmp://192.168.0.31:3535/myapp/" + stream_key;

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("id");

		MemberVO vo = null;


		if (uid != null) {
			vo = mservice.getInfo(uid);
			model.addAttribute("vo", vo);
		}

		model.addAttribute("url", url);
		model.addAttribute("bj_num", bjvo.getM_num());
		model.addAttribute("bjvo", bjvo);
		model.addAttribute("bvo", bvo);
		return ".broadcast";
	}
}
