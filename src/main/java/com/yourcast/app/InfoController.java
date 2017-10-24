package com.yourcast.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.util.page.PageUtil;
import com.yourcast.app.service.BlacklistService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.FanService;
import com.yourcast.app.service.MemberProfileService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.StarUseService;
import com.yourcast.app.vo.BlacklistVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.StarUseVO;
import com.yourcast.app.vo.FanVO;
import com.yourcast.app.vo.MemberProfileVO;
import com.yourcast.app.vo.MemberVO;

@Controller
public class InfoController {
	@Autowired
	private CategoryService c_service;
	@Autowired
	private MemberService m_sevice;
	@Autowired
	private MemberProfileService mp_service;
	@Autowired
	private FanService f_service;
	@Autowired
	private BlacklistService b_service;
	@Autowired
	private StarUseService u_service;

	@RequestMapping(value = "/{id}/setting/info", method = RequestMethod.GET)
	public String infoSetting(@PathVariable(value = "id") String id, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());

		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		String profile_msg1 = voMP.getProfile_msg();
		voMP.setProfile_msg(voMP.getProfile_msg().replace("<br>","\r\n"));
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("bj_num", voM.getM_num());
		int totalRowCount = f_service.getCount(voM.getM_num());
		PageUtil pu = new PageUtil(pageNum, 10, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<FanVO> listF = f_service.getList(map);
		List<BlacklistVO> listB = b_service.getList(voM.getM_num());
		// List<MemberVO> listM = m_sevice.getList();
		
		model.addAttribute("profile_msg1",profile_msg1);
		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);
		model.addAttribute("listF", listF);
		model.addAttribute("pu", pu);
		model.addAttribute("listB", listB);
		// model.addAttribute("listM", listM);
		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);

		return ".personnel.setting.info";
	}

	@RequestMapping(value = "/{id}/setting/category", method = RequestMethod.GET)
	public String categorySetting(@PathVariable(value = "id") String id, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());

		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("bj_num", voM.getM_num());
		int totalRowCount = f_service.getCount(voM.getM_num());
		PageUtil pu = new PageUtil(pageNum, 10, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<FanVO> listF = f_service.getList(map);
		List<BlacklistVO> listB = b_service.getList(voM.getM_num());

		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);
		model.addAttribute("listF", listF);
		model.addAttribute("pu", pu);
		model.addAttribute("listB", listB);
		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);
		return ".personnel.setting.category";
	}

	@RequestMapping(value = "/{id}/setting/main", method = RequestMethod.GET)
	public String mainSetting(@PathVariable(value = "id") String id, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());

		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);

		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);
		return ".personnel.setting.main";
	}

	@RequestMapping(value = "/{id}/setting/fanlist", method = RequestMethod.GET)
	public String fanlistSetting(@PathVariable(value = "id") String id, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());

		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("bj_num", voM.getM_num());
		int totalRowCount = f_service.getCount(voM.getM_num());
		PageUtil pu = new PageUtil(pageNum, 10, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<FanVO> listF = f_service.getList(map);
		List<BlacklistVO> listB = b_service.getList(voM.getM_num());

		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);
		model.addAttribute("listF", listF);
		model.addAttribute("pu", pu);
		model.addAttribute("listB", listB);
		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);
		if (listF.isEmpty()) {
			model.addAttribute("err", "팬 정보가 존재하지 않습니다.");
		}
		return ".personnel.setting.fanlist";
	}

	@RequestMapping(value = "/{id}/setting/blacklist", method = RequestMethod.GET)
	public String blacklistSetting(@PathVariable(value = "id") String id, Model model,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());

		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("bj_num", voM.getM_num());
		int totalRowCount = f_service.getCount(voM.getM_num());
		PageUtil pu = new PageUtil(pageNum, 10, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<FanVO> listF = f_service.getList(map);
		List<BlacklistVO> listB = b_service.getList(voM.getM_num());

		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);
		model.addAttribute("listF", listF);
		model.addAttribute("pu", pu);
		model.addAttribute("listB", listB);
		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);
		return ".personnel.setting.blacklist";
	}

	@RequestMapping(value = "/{id}/setting/main", method = RequestMethod.POST)
	public String mainUpdate(@PathVariable(value = "id") String id, Model model,String content) {
		MemberVO voM = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(voM.getM_num());
		MemberProfileVO voMP = mp_service.getInfo(voM.getM_num());
		voMP.setProfile_content(content);
		mp_service.contentUpdate(voMP);
		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		model.addAttribute("voMP", voMP);

		List<StarUseVO> flist = u_service.getHotfList(voM.getM_num());
		model.addAttribute("flist", flist);
		return ".personnel.setting.main";
	}
	
	@RequestMapping(value = "/{id}/setting/baseinfo_update", method = RequestMethod.POST)
	public String baseInfoUpdate(@PathVariable(value = "id") String id, Model model, String profile_msg, String profile_title, MultipartFile profileImg, HttpSession session) {

		MemberVO vo = m_sevice.getInfo(id);
		List<CategoryVO> clist = c_service.getList(vo.getM_num());
		MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
		model.addAttribute("clist", clist);
		model.addAttribute("id", id);
		profile_msg = profile_msg.replace("\r\n","<br>");
		String path = session.getServletContext().getRealPath("/resources/upload");
		String profile_orgfilename = profileImg.getOriginalFilename();
		String profile_savefilename = UUID.randomUUID() + "_" + profile_orgfilename;

		if (profile_orgfilename == null || profile_orgfilename.equals("")) {
			profile_orgfilename = voMP.getProfile_orgfilename();
			profile_savefilename = voMP.getProfile_savefilename();
		} else {
			new File(path + "//" + voMP.getProfile_savefilename()).delete();
			try {
				FileCopyUtils.copy(profileImg.getInputStream(),
						new FileOutputStream(path + "\\" + profile_savefilename));
				System.out.println(path + "\\" + profile_savefilename + "프로필 이미지 업로드 완료");

			} catch (IOException ie) {
				System.out.println(ie.getMessage());
				model.addAttribute("result", "오류로 인해 파일의 업로드가 실패하였습니다.");
				return ".personnel.setting.result";
			}
		}

		int n = mp_service.update(new MemberProfileVO(voMP.getProfile_num(), profile_msg, null,
				profile_orgfilename, profile_savefilename, vo.getM_num(), profile_title));
		if (n > 0) {
			model.addAttribute("result", "방송국 기본정보의 수정이 완료되었습니다.");
		} else {
			model.addAttribute("result", "오류로 인해 실패하였습니다.");
		}

		return ".personnel.setting.result";
	}

	@RequestMapping(value = "/{id}/setting/blacklistI", method = RequestMethod.GET)
	@ResponseBody
	public int blacklistInsert(@PathVariable(value = "id") String id, String option) {
		int bj_num = m_sevice.getInfo(id).getM_num();
		int m_num = m_sevice.getInfo(option).getM_num();
		BlacklistVO vo = new BlacklistVO(0, m_num, bj_num);
		if (b_service.check(vo) == false) {
			b_service.insert(vo);
			return m_num;
		} else {
			return 0;
		}
	}

	@RequestMapping(value = "/{id}/setting/blacklistD", method = RequestMethod.GET)
	@ResponseBody
	public int blacklistDelete(@PathVariable(value = "id") String id, int option) {
		int bj_num = m_sevice.getInfo(id).getM_num();
		BlacklistVO vo = new BlacklistVO(0, option, bj_num);
		int n = b_service.delete(vo);
		return n;
	}

	@RequestMapping(value = "/{id}/setting/category_delete", method = RequestMethod.GET)
	@ResponseBody
	public int category_Delete(int option) {
		int n = c_service.delete(new CategoryVO(option, null, 0, 0));
		return n;
	}

	@RequestMapping(value = "/{id}/setting/category_insert", method = RequestMethod.GET)
	@ResponseBody
	public int category_Insert(@PathVariable(value = "id") String id, String keyword) {
		int bj_num = m_sevice.getInfo(id).getM_num();
		if(c_service.isCategory(new CategoryVO(0, keyword, 0, bj_num))) {
			return 0;
		}else {
			c_service.insert(new CategoryVO(0, keyword, 0 ,bj_num));
			CategoryVO vo = c_service.getCategory_num(new CategoryVO(0, keyword, 0, bj_num));
			return vo.getCategory_num();
		}
	}
}
