package com.yourcast.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.util.page.PageUtil;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.MemberProfileService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.VideoService;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.MemberProfileVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.VideoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class VideoController {
	@Autowired private VideoService v_service;
	@Autowired private MemberService m_service;
	@Autowired private CategoryService c_service;
	@Autowired private MemberProfileService mp_service;
	
	@RequestMapping(value = "/{id}/video/detail", method = RequestMethod.GET)
	public String videoDetail(@PathVariable(value = "id") String id, Model model, int v_num) {
		v_service.hitUpdate(v_num);
		VideoVO vo = v_service.getInfo(v_num);
		MemberVO voM = m_service.getInfo(id);
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		model.addAttribute("vo",vo);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.video.detail";
	}
	
	@RequestMapping(value = "/{id}/video/list", method = RequestMethod.GET)
	public String videoList(@PathVariable(value = "id") String id, Model model,
									@RequestParam(value="pageNum",defaultValue="1")  int pageNum) {
		MemberVO voM = m_service.getInfo(id);
		
		System.out.println(voM.getM_num());
		
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", voM.getM_num());
		int totalRowCount=v_service.getCount(map);	
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);	
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<VideoVO> list = v_service.getMemberList(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.video.list";
	}
	
	@RequestMapping(value = "/{id}/video/delete", method = RequestMethod.GET)
	public String videoDelete(@PathVariable(value = "id") String id, Model model, int v_num, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/upload");
		MemberVO voM = m_service.getInfo(id);
		VideoVO vo = v_service.getInfo(v_num);
		
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		new File(path + "//" + vo.getV_savefilename()).delete();
		new File(path + "//" + vo.getV_savethumbnail()).delete();
		
		int n = v_service.delete(v_num);
		if(n>0) {
			return "redirect:/{id}/video/list";
		}else {
			model.addAttribute("result","동영상 삭제실패");
		}
		return ".personnel.video.result";
	}
	
	@RequestMapping(value = "/{id}/video/delete", method = RequestMethod.POST)
	public String videoDeleteC(@PathVariable(value = "id") String id, Model model, int[] chk, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/upload");
		MemberVO voM = m_service.getInfo(id);
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		int n = 0;
		for(int i=0;i<chk.length;i++) {
			VideoVO v = v_service.getInfo(chk[i]);
			new File(path + "//" + v.getV_savefilename()).delete();
			new File(path + "//" + v.getV_savethumbnail()).delete();
			
			n = v_service.delete(chk[i]);
		}
		if(n>0) {
			return "redirect:/{id}/video/list";
		}else {
			model.addAttribute("result","동영상 삭제실패");
		}
		return ".personnel.video.result";
	}
	
	@RequestMapping(value = "/{id}/video/update", method = RequestMethod.GET)
	public String videoUpdate(@PathVariable(value = "id") String id, Model model,int v_num) {
		VideoVO vo = v_service.getInfo(v_num);
		MemberVO voM = m_service.getInfo(id);
		
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		model.addAttribute("vo", vo);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.video.update";
	}
	
	@RequestMapping(value = "/{id}/video/update", method = RequestMethod.POST)
	public String videoUpdateOk(@PathVariable(value = "id") String id, Model model,int v_num,
										String genre,String v_title,String v_content, String age_grade,
										MultipartFile vfile,MultipartFile imgfile,HttpSession session) {
		try {
			MemberVO voM = m_service.getInfo(id);
			VideoVO vo = v_service.getInfo(v_num);
			
			List<CategoryVO> clist=c_service.getList(voM.getM_num());
			model.addAttribute("clist", clist);
			model.addAttribute("id",id);
			
			MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
			model.addAttribute("voMP", voMP);
			
			String path = session.getServletContext().getRealPath("/resources/upload");
			String orgfilename = vfile.getOriginalFilename();
			String savefilename = UUID.randomUUID() + "_" + orgfilename;
			String orgthumbnail = imgfile.getOriginalFilename();
			String savethumbnail = UUID.randomUUID() + "_" + orgthumbnail;
			if(orgfilename==null || orgfilename.equals("")) {
				orgfilename = vo.getV_orgfilename();
				savefilename = vo.getV_savefilename();
			}else {
				new File(path + "//" + vo.getV_savefilename()).delete();
				try {
					// 동영상 업로드
					FileCopyUtils.copy(vfile.getInputStream(), new FileOutputStream(path + "\\" + savefilename));
					
					System.out.println(path + "\\" + savefilename + "[업로드 성공]");
				
				}catch(IOException ie) {
					System.out.println(ie.getMessage());
					model.addAttribute("result","에러로 인한 실패");
					return ".personnel.video.result";
				}
			}
			if(orgthumbnail==null || orgthumbnail.equals("")) {
				orgthumbnail = vo.getV_orgthumbnail();
				savethumbnail = vo.getV_savethumbnail();
			}else {
				new File(path + "//" + vo.getV_savethumbnail()).delete();
				try {
					// 썸네일 업로드
					FileCopyUtils.copy(imgfile.getInputStream(), new FileOutputStream(path + "\\" + savethumbnail));
					System.out.println(path + "\\" + savethumbnail + "[업로드 성공]");
				}catch(IOException ie) {
					System.out.println(ie.getMessage());
					model.addAttribute("result","에러로 인한 실패");
					return ".personnel.video.result";
				}
			}
			// DB작업
			int genre_num = Integer.parseInt(genre);
			int age_grade_num = Integer.parseInt(age_grade);
			int n = v_service.update(new VideoVO(v_num, v_title, v_content, null, 0, orgfilename, savefilename, orgthumbnail, savethumbnail, 0, genre_num, age_grade_num, vo.getM_num()));
			if(n>0) {
				return "redirect:/{id}/video/list";
			}else {
				model.addAttribute("result","동영상 수정 실패");
			}
			return ".personnel.video.result";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("result","영상 및 썸네일이미지의 업로드가 필요합니다.");
			return ".personnel.video.result";
		}
	}
	
	@RequestMapping(value = "/{id}/video/insert", method = RequestMethod.GET)
	public String videoInsert(@PathVariable(value = "id") String id, Model model) {
		MemberVO voM = m_service.getInfo(id);
		
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		return ".personnel.video.insert";
	}
	
	@RequestMapping(value = "/{id}/video/insert", method = RequestMethod.POST)
	public String videoInsertOk(@PathVariable(value = "id") String id,  Model model,
										String genre,String v_title,String v_content,
										String age_grade,
										MultipartFile vfile,MultipartFile imgfile,HttpSession session) {
		MemberVO voM = m_service.getInfo(id);
		List<CategoryVO> clist=c_service.getList(voM.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id",id);
		
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		model.addAttribute("voMP", voMP);
		
		String path = session.getServletContext().getRealPath("/resources/upload");
		String orgfilename = vfile.getOriginalFilename();
		String savefilename = UUID.randomUUID() + "_" + orgfilename;
		String orgthumbnail = imgfile.getOriginalFilename();
		String savethumbnail = UUID.randomUUID() + "_" + orgthumbnail;
		
		try {
			// 동영상 업로드
			InputStream vis = vfile.getInputStream();
			FileOutputStream vfos = new FileOutputStream(path + "\\" + savefilename);
			FileCopyUtils.copy(vis, vfos);
			
			// 썸네일 업로드
			InputStream imgis = imgfile.getInputStream();
			FileOutputStream imgfos = new FileOutputStream(path + "\\" + savethumbnail);
			FileCopyUtils.copy(imgis, imgfos);
			vis.close();
			vfos.close();
			imgis.close();
			imgfos.close();
			System.out.println(path + "\\" + savefilename + "[업로드 성공]");
			System.out.println(path + "\\" + savethumbnail + "[업로드 성공]");
			
			// DB작업
			int genre_num = Integer.parseInt(genre);
			int age_grade_num = Integer.parseInt(age_grade);
			int n = v_service.insert(new VideoVO(0, v_title, v_content, null, 0, orgfilename, savefilename, orgthumbnail, savethumbnail, 0, genre_num, age_grade_num,null,null,voM.getM_num()));
			if(n>0) {
				return "redirect:/{id}/video/list";
			}else {
				model.addAttribute("result","동영상 업로드실패");
			}
			return ".personnel.video.result";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			model.addAttribute("result","에러로 인한 실패");
			return ".personnel.video.result";
		}
	}
}

