package com.yourcast.app;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BroadcastController {

	@RequestMapping(value = "/bs/{id}", method = RequestMethod.GET)
	public String home(@PathVariable(value="id") String id, Model model) {
		String url = "rtmp://192.168.0.31:3535/myapp/"+id;
		model.addAttribute("url",url);
		return ".broadcast";
	}
}
