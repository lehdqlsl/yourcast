package db.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.BoardDAO;
import com.yourcast.app.vo.BoardVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class BoardTest {

	@Autowired
	private BoardDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new BoardVO(0, "test1", "test1234", null, 0, 0, 0, 1, 2, 1));
		boolean a = false;
		if(n>0) {
			a  = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void update() {
		int n=dao.update(new BoardVO(1, "test3", "test1111", null, 0, 0, 0, 1, 2, 1));
		boolean a = false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		BoardVO vo=dao.getInfo(1);
		Assert.assertNotNull(vo);
	}
	@Test//¿¡·¯
	public void getList() {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		List<BoardVO> blist = dao.getList(map);
		Assert.assertNotNull(blist);
	}
	@Test
	public void delete() {
		int n=dao.delete(1);
		boolean a = false;
		if(n>0) {
			a  = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void hitUpdate() {
		int n=dao.hitUpdate(5);
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
		map.put("category_num", 4);
		int n = dao.getCount(map);
		System.out.println(n);
	}
}
