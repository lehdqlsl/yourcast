package com.yourcast.app;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yourcast.app.service.BroadcastService;

@Controller
public class BroadcastController {
	@Autowired
	private BroadcastService bservice;

	@RequestMapping(value = "/bs/{id}", method = RequestMethod.GET)
	public String home(@PathVariable(value = "id") String id, Model model) {
		String stream_key = bservice.getInfo(Integer.parseInt(id)).getStream_key();
		String url = "rtmp://192.168.0.31:3535/myapp/" + stream_key;
		model.addAttribute("url", url);
		return ".broadcast";
	}
}
