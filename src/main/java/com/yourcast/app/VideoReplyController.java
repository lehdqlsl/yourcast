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
	
	//������ ��� �߰�
	@RequestMapping(value="/{id}/videoreply/insert")
	@ResponseBody
	/*public int insert(@PathVariable(value="id") String id,String sid,String vr_content,String v_num) {
		//������ �޾ƿ���
		MemberVO mvo=m_service.getInfo(sid);
		System.out.println("video : "+sid);//�α����� ���̵�
		System.out.println("video : "+vr_content);
		System.out.println("video : "+v_num);
		System.out.println("video : "+mvo.getM_num());//�α����� ȸ����ȣ
		
		//��� �߰�
		VideoReplyVO vrvo=new VideoReplyVO(0, vr_content, null, 0, Integer.parseInt(v_num), mvo.getM_num());
		int n=vr_service.insert(vrvo);
		return n;
	}*/
	public VideoReplyList insert(@PathVariable(value="id") String id,String sid,String vr_content,String v_num) {
		//������ �޾ƿ���
		MemberVO mvo=m_service.getInfo(sid);
		int vnum=Integer.parseInt(v_num);
		//��� �߰�
		VideoReplyVO vrvo=new VideoReplyVO(0, vr_content, null, 0, vnum, mvo.getM_num());
		vr_service.insert(vrvo);
		
		
		//����¡ ó��
		int totalRowCount=vr_service.getCount(vnum);
		PageUtil pu=new PageUtil(1, 5, 1, totalRowCount);
				
		//�ؽø� �����
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("v_num", vnum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//����Ʈ�� ���
		List<VideoReplyVO> vrlist=vr_service.getList(map);
		VideoReplyList list=new VideoReplyList();
		list.setList(vrlist);
		return list;
	}
	
	//������ ��� ����Ʈ ���
	@RequestMapping(value="/videoreply/list")
	@ResponseBody
	public VideoReplyList getList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int v_num) {
		//����¡ ó��
		int totalRowCount=vr_service.getCount(v_num);
		PageUtil pu=new PageUtil(pageNum, 5, 1, totalRowCount);
		
		//�ؽø� �����
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("v_num", v_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//����Ʈ�� ���
		List<VideoReplyVO> vrlist=vr_service.getList(map);
		VideoReplyList list=new VideoReplyList();
		list.setList(vrlist);
		return list;
	}
	//������ ��� ����
	@RequestMapping(value="/videoreply/delete")
	public String delete(int vr_num, int v_num) {
		vr_service.delete(vr_num);
		return "redirect:/videomain/getInfo?v_num="+v_num;
	}
	//������ ��� �� �޾ƿ���
	@RequestMapping(value="/videoreply/vrcount")
	@ResponseBody
	public int vrCount(int v_num) {
		int n=vr_service.getCount(v_num);
		return n;
	}
}
