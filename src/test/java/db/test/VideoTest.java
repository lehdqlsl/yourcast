package db.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.VideoDAO;
import com.yourcast.app.vo.VideoVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class VideoTest {
	
	@Autowired
	private VideoDAO dao;
	
	@Test
	public void insert() {
		int n = dao.insert(new VideoVO(0, "제목test", "내용test", null, 0, "원본파일이름", "저장파일이름", "원본썸네일이름", "저장썸네일이름", 0, 1, 1,null,null, 1));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void update() {
		int n = dao.update(new VideoVO(42, "test2-2", "test2.....2", null, 0, "org111", "save222","orgimg1","saveimg22222", 0, 1, 1,null,null, 1));
		boolean a = false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		VideoVO vo = dao.getInfo(2);
		Assert.assertNotNull(vo);
	}
	@Test
	public void getList() {
		List<VideoVO> vlist = dao.getList();
		Assert.assertNotNull(vlist);
	}
	@Test
	public void delete() {
		int n = dao.delete(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void hitUpdate() {
		int n=dao.hitUpdate(1);
		boolean a = false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getCount() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", 1);
		int n = dao.getCount(map);
		System.out.println(n);
	}
	@Test
	public void getCount1() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_num", 1);
		map.put("category_num", 2);
		int n = dao.getCount(map);
		System.out.println(n);
	}
	
	@Test
	public void getMemberList() {
		List<VideoVO> list = dao.getMemberList(3);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void getGenreList() {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("genre_num", 1);
		map.put("startRow",1);
		map.put("endRow", 5);
		List<VideoVO> list = dao.getGenreList(map);
		Assert.assertNotNull(list);
	}
	@Test
	public void allList() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 5);
		List<VideoVO> list=dao.allList(map);
		Assert.assertNotNull(list);
	}
	@Test
	public void allCount() {
		int n=dao.allCount();
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
}
