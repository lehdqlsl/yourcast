package com.yourcast.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		
		return ".admin";
	}
	
	@RequestMapping(value = "/admin/member/list", method = RequestMethod.GET)
	public String memberList() {
		
		return ".admin.member.list";
	}
}