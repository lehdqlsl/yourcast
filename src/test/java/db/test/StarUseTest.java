package db.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.StarUseDAO;
import com.yourcast.app.vo.StarUseVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class StarUseTest {
	@Autowired
	private StarUseDAO dao;

	@Test
	public void insert() {
		int n = dao.insert(new StarUseVO(0,null,1,1,2));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void getSendList() {
		List<StarUseVO> list = dao.getSendList(1);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void getRecvList() {
		List<StarUseVO> list = dao.getRecvList(1);
		Assert.assertNotNull(list);
	}
	
	@Test
	public void getSendCount() {
		int n = dao.getSendCount(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	
	@Test
	public void getRecvCount() {
		int n = dao.getRecvCount(2);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
}
