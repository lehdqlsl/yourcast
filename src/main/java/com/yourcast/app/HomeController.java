package com.yourcast.app;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourcast.app.service.BoardReplyService;
import com.yourcast.app.service.BoardService;
import com.yourcast.app.service.BroadcastService;
import com.yourcast.app.service.CategoryService;
import com.yourcast.app.service.GenreService;
import com.yourcast.app.service.MemberProfileService;
import com.yourcast.app.service.MemberService;
import com.yourcast.app.service.StarUseService;
import com.yourcast.app.service.VideoReplyService;
import com.yourcast.app.service.VideoService;
import com.yourcast.app.vo.BoardVO;
import com.yourcast.app.vo.BroadcastVO;
import com.yourcast.app.vo.CategoryVO;
import com.yourcast.app.vo.GenreVO;
import com.yourcast.app.vo.MemberProfileVO;
import com.yourcast.app.vo.MemberVO;
import com.yourcast.app.vo.StarUseVO;
import com.yourcast.app.vo.VideoVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private VideoReplyService vr_service;
	
	@Autowired
	private VideoService v_service;
	
	@Autowired
	private BoardService board_service;
	
	@Autowired
	private BoardReplyService br_service;
	
	@Autowired
	private CategoryService service;

	@Autowired
	private MemberService m_sevice;

	@Autowired
	private MemberProfileService mp_service;

	@Autowired
	private BroadcastService b_service;

	@Autowired
	private StarUseService u_service;

	@Autowired
	private GenreService g_service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(value = "genre_num", defaultValue = "0") int genre_num, Model model) {
		List<BroadcastVO> blist = null;
		if (genre_num == 0) {
			blist = b_service.getList();
		} else {
			blist = b_service.getList(genre_num);
		}

		int cnt = (int) Math.ceil(blist.size() / 4.0);

		List<GenreVO> glist = g_service.getList();
		model.addAttribute("glist", glist);
		model.addAttribute("blist", blist);
		model.addAttribute("genre_num", genre_num);
		model.addAttribute("cnt", cnt);
		model.addAttribute("end", blist.size() - 1);

		return ".main";
	}


	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String personnel(@PathVariable(value = "id") String id, Model model) {
		MemberVO vo = m_sevice.getInfo(id);
		if (vo != null) {
			List<CategoryVO> clist = service.getList(vo.getM_num());
			MemberProfileVO voMP = mp_service.getInfo(vo.getM_num());
			List<StarUseVO> flist = u_service.getHotfList(vo.getM_num());
			
			//메인 화면 목록
			List<BoardVO> nlist=board_service.mainNoticeList(vo.getM_num());
			List<BoardVO> blist=board_service.mainBoardList(vo.getM_num());
			List<VideoVO> vlist=v_service.mainVideoList(vo.getM_num());
			//메인 화면 댓글 수
			int cnt1=0;
			int cnt2=0;
			int cnt3=0;
			for(BoardVO bvo:nlist) {
				cnt1=br_service.getCount(bvo.getB_num());
				bvo.setBrcnt(cnt1);
			}
			for(BoardVO bvo: blist) {
				cnt2=br_service.getCount(bvo.getB_num());
				bvo.setBrcnt(cnt2);
			}
			for(VideoVO vvo:vlist) {
				cnt3=vr_service.getCount(vvo.getV_num());
				vvo.setVrcnt(cnt3);
			}
			
			
			model.addAttribute("vlist", vlist);
			model.addAttribute("blist",blist);
			model.addAttribute("nlist", nlist);
			model.addAttribute("flist", flist);
			model.addAttribute("clist", clist);
			model.addAttribute("id", id);
			model.addAttribute("voMP", voMP);
			return ".personnel";
		} else {
			return ".personnel.board.nomember";
		}
	}
}
