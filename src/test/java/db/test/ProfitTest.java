package db.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.ProfitDAO;
import com.yourcast.app.vo.ProfitVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class ProfitTest {
	@Autowired
	private ProfitDAO dao;
	
	@Test
	public void insert() {
		int n = dao.insert(new ProfitVO(0, 10, null, 1));
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getList() {
		List<ProfitVO> plist = dao.getList();
		Assert.assertNotNull(plist);
	}
	@Test
	public void getCount() {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("m_num", 1);
		int n = dao.getCount(map);
		System.out.println(n);
	}
}
