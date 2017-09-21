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
		int n = dao.insert(new VideoVO(0, "test2", "test.....", null, 0, "orgfile1", "savefile1", 0 , 1, 1, 1));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void update() {
		int n = dao.update(new VideoVO(2, "test2-2", "test2.....2", null, 0, "org111", "save222", 0, 1, 1, 1));
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
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", 1);
		int n = dao.getCount(map);
		System.out.println(n);
	}
	@Test
	public void getCount1() {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("m_num", 1);
		map.put("category_num", 2);
		int n = dao.getCount(map);
		System.out.println(n);
	}
}
