package db.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.FanDAO;
import com.yourcast.app.vo.FanVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class FanTest {
	
	@Autowired
	private FanDAO dao;
	
	@Test
	public void insert() {
		int n = dao.insert(new FanVO(0,2,1));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
}
