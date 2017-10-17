package com.yourcast.app;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.util.page.PageUtil;
import com.util.page.VideoReplyList;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoReplyService;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoReplyVO;

@Controller
public class VideoReplyController {
	@Autowired private VideoReplyService vr_service;
	@Autowired private MemberService m_service;
	
	//동영상 댓글 추가
	@RequestMapping(value="/{id}/videoreply/insert")
	@ResponseBody
	public VideoReplyList insert(@PathVariable(value="id") String id,String sid,String vr_content,String v_num) {
		//데이터 받아오기
		MemberVO mvo=m_service.getInfo(sid);
		int vnum=Integer.parseInt(v_num);
		//댓글 추가
		VideoReplyVO vrvo=new VideoReplyVO(0, vr_content, null, 0, vnum, mvo.getM_num());
		vr_service.insert(vrvo);
		
		//페이징 처리
		int totalRowCount=vr_service.getCount(vnum);
		PageUtil pu=new PageUtil(1, 5, 1, totalRowCount);
				
		//해시맵 만들기
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("v_num", vnum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//리스트에 담기
		List<VideoReplyVO> vrlist=vr_service.getList(map);
		VideoReplyList list=new VideoReplyList();
		list.setList(vrlist);
		return list;
	}
	//동영상 댓글 삭제
	@RequestMapping(value="/videoreply/delete")
	@ResponseBody
	public VideoReplyList delete(int vr_num, int v_num) {
		//댓글 삭제
		vr_service.delete(vr_num);
		//페이징 처리
		int totalRowCount=vr_service.getCount(v_num);
		PageUtil pu=new PageUtil(1, 5, 1, totalRowCount);
						
		//해시맵 만들기
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("v_num", v_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//리스트에 담기
		List<VideoReplyVO> vrlist=vr_service.getList(map);
		VideoReplyList list=new VideoReplyList();
		list.setList(vrlist);
		return list;
	}
	
	//동영상 댓글 리스트 출력
	@RequestMapping(value="/videoreply/list")
	@ResponseBody
	public VideoReplyList getList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int v_num) {
		//페이징 처리
		int totalRowCount=vr_service.getCount(v_num);
		PageUtil pu=new PageUtil(pageNum, 5, 1, totalRowCount);
		
		//해시맵 만들기
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("v_num", v_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//리스트에 담기
		List<VideoReplyVO> vrlist=vr_service.getList(map);
		for(VideoReplyVO vo : vrlist) {
			System.out.println(vo.getVr_content());
		}
		VideoReplyList list=new VideoReplyList();
		list.setList(vrlist);
		return list;
	}
	
	//동영상 댓글 수 받아오기
	@RequestMapping(value="/videoreply/vrcount")
	@ResponseBody
	public int vrCount(int v_num) {
		int n=vr_service.getCount(v_num);
		return n;
	}
}
