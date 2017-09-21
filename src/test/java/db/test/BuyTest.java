package db.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.BuyDAO;
import com.yourcast.app.vo.BuyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class BuyTest {
	@Autowired
	private BuyDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new BuyVO(0, null, 1000, 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getList() {
		List<BuyVO> list=dao.getList(1);
		Assert.assertNotNull(list);
	}
	@Test
	public void getCount() {
		int n=dao.getCount(1);
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
		
	}
}
