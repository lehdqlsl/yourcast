package com.yourcast.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yourcast.app.service.VideoService;
import com.yourcast.app.vo.VideoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class VideoController {
	@Autowired private VideoService service;
	
	@RequestMapping(value = "/id/detail", method = RequestMethod.GET)
	public String videoDetail(Locale locale, Model model, int v_num) {
		service.hitUpdate(v_num);
		VideoVO vo = service.getInfo(v_num);
		model.addAttribute("vo",vo);
		return ".personnel.video.detail";
	}
	
	@RequestMapping(value = "/id/list", method = RequestMethod.GET)
	public String videoList(Locale locale, Model model) {
		List<VideoVO> list = service.getMemberList(1);
		
		model.addAttribute("list",list);
		return ".personnel.video.list";
	}
	
	@RequestMapping(value = "/id/delete", method = RequestMethod.GET)
	public String videoDelete(Locale locale, Model model, int v_num, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/upload");
		VideoVO vo = service.getInfo(v_num);
		new File(path + "//" + vo.getV_savefilename()).delete();
		new File(path + "//" + vo.getV_savethumbnail()).delete();
		
		int n = service.delete(v_num);
		if(n>0) {
			model.addAttribute("result","동영상 삭제성공");
		}else {
			model.addAttribute("result","동영상 삭제실패");
		}
		return ".personnel.video.result";
	}
	
	@RequestMapping(value = "/id/delete", method = RequestMethod.POST)
	public String videoDeleteC(Locale locale, Model model, int[] chk, HttpSession session) {
		String path = session.getServletContext().getRealPath("/resources/upload");
		int n = 0;
		for(int i=0;i<chk.length;i++) {
			VideoVO vo = service.getInfo(chk[i]);
			new File(path + "//" + vo.getV_savefilename()).delete();
			new File(path + "//" + vo.getV_savethumbnail()).delete();
			
			n = service.delete(chk[i]);
		}
		if(n>0) {
			model.addAttribute("result","동영상 삭제성공");
		}else {
			model.addAttribute("result","동영상 삭제실패");
		}
		return ".personnel.video.result";
	}
	
	@RequestMapping(value = "/id/update", method = RequestMethod.GET)
	public String videoUpdate(Locale locale, Model model,int v_num) {
		VideoVO vo = service.getInfo(v_num);
		model.addAttribute("vo", vo);
		return ".personnel.video.update";
	}
	
	@RequestMapping(value = "/id/update", method = RequestMethod.POST)
	public String videoUpdateOk(Locale locale, Model model,String v_num,
										String genre,String v_title,String v_content,
										String age_grade,
										MultipartFile vfile,MultipartFile imgfile,HttpSession session) {
		VideoVO vo = service.getInfo(Integer.parseInt(v_num));
		String path = session.getServletContext().getRealPath("/resources/upload");
		String orgfilename = vfile.getOriginalFilename();
		String savefilename = UUID.randomUUID() + "_" + orgfilename;
		String orgthumbnail = imgfile.getOriginalFilename();
		String savethumbnail = UUID.randomUUID() + "_" + orgthumbnail;
		if(orgfilename==null) {
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
		if(orgthumbnail==null) {
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
		int n = service.update(new VideoVO(0, v_title, v_content, null, 0, orgfilename, savefilename, orgthumbnail, savethumbnail, 0, genre_num, age_grade_num,null,null, 1));
		if(n>0) {
			model.addAttribute("result","동영상 수정 성공");
		}else {
			model.addAttribute("result","동영상 수정 실패");
		}
		return ".personnel.video.result";
	}
	
	@RequestMapping(value = "/id/insert", method = RequestMethod.GET)
	public String videoInsert(Locale locale, Model model) {
		return ".personnel.video.insert";
	}
	
	@RequestMapping(value = "/id/insert", method = RequestMethod.POST)
	public String videoInsertOk(Locale locale, Model model,
										String genre,String v_title,String v_content,
										String age_grade,
										MultipartFile vfile,MultipartFile imgfile,HttpSession session) {
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
			System.out.println(genre_num);
			System.out.println(age_grade_num);
			int n = service.insert(new VideoVO(0, v_title, v_content, null, 0, orgfilename, savefilename, orgthumbnail, savethumbnail, 0, genre_num, age_grade_num,null,null, 1));
			if(n>0) {
				model.addAttribute("result","동영상 업로드성공");
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

