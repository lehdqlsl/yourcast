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

import com.google.gson.JsonObject;
import com.sun.media.sound.ModelAbstractChannelMixer;
import com.yourcast.app.service.BookmarkService;
import com.yourcast.app.service.GenreService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoService;
import com.yourcast.app.vo.BookmarkVO;
import com.yourcast.app.vo.GenreVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoVO;

@Controller
public class BookmarkController {
	@Autowired private BookmarkService b_service;
	@Autowired private MemberService m_service;
	@Autowired private GenreService g_service;
	@Autowired private VideoService v_service;
	
	//즐겨찾기 등록
	@RequestMapping(value="/bookmark/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(HttpServletRequest request) {
		//정보 얻어오기
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		MemberVO mvo= m_service.getInfo(id);
		int m_num=mvo.getM_num();
		int v_num=Integer.parseInt(request.getParameter("v_num"));

		//북마크 추가 작업
		BookmarkVO bvo=new BookmarkVO(0, m_num, v_num);
		int n = b_service.insert(bvo);
		
		//json
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("result", true);
		}else {
			json.put("result", false);
		}
		
		return json.toString();
	}
	
	//즐겨찾기 삭제
	@RequestMapping(value="/bookmark/delete",produces="application/json;charset=utf-8")
	@ResponseBody
	public String delete(HttpServletRequest request) {
		//정보얻어오기
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		MemberVO mvo= m_service.getInfo(id);
		int m_num=mvo.getM_num();
		int v_num=Integer.parseInt(request.getParameter("v_num"));

		//북마크 삭제 작업
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("m_num", m_num);
		map.put("v_num", v_num);
		int n=b_service.delete(map);
		
		//json
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("result", true);
		}else {
			json.put("result", false);
		}
		
		return json.toString();
	}
	//북마크 동영상 목록
	@RequestMapping(value="/bookmark/list")
	public String bookmarkList(HttpServletRequest request,Model model) {
		//카테고리 담기
		List<GenreVO> glist= g_service.getList();
		
		//북마크 리스트 담기
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		MemberVO mvo= m_service.getInfo(id);
		int m_num=mvo.getM_num();
		List<VideoVO> vlist=v_service.getBookmarkList(m_num);
		
		model.addAttribute("glist", glist);
		model.addAttribute("vlist",vlist);
		return ".videomain.content.bookmark";
	}
}
