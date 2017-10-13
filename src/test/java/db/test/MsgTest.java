package db.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.MsgDAO;
import com.yourcast.app.vo.MsgVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class MsgTest {
	@Autowired
	private MsgDAO dao;

	@Test
	public void insert() {
		int n = dao.insert(new MsgVO(0, "test", "dbtest", null, 0, 0, 0, 1, 2));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void getSendList() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("m_numS", 64);
		map.put("startRow",1);
		map.put("endRow", 10);
		List<MsgVO> list = dao.getSendList(map);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void getRecvList() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("m_numR", 64);
		map.put("startRow",1);
		map.put("endRow", 10);
		List<MsgVO> list = dao.getRecvList(map);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void viewDate() {
		int n = dao.viewDate(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void sendDelete() {
		int n = dao.sendDelete(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void recvDelete() {
		int n = dao.recvDelete(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void sendCount() {
		int n = dao.sendCount(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void recvCount() {
		int n = dao.recvCount(2);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
}
