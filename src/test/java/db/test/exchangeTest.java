package db.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.ExchangeDAO;
import com.yourcast.app.vo.ExchangeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class exchangeTest {
	@Autowired
	private ExchangeDAO dao;

	@Test
	public void insert() {
		int count = 362;
		double e_ea = count*100*0.6;
		double e_ea = count*100*0.7;
		double e_ea = count*100*0.8;
		int n = dao.insert(new ExchangeVO(0, count, e_ea, null, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}
	
	@Test
	public void getcount() {
		int n = dao.getCount(1);
		System.out.println(n);
	}
	
	@Test
	public void getlist() {
		List<ExchangeVO> list = dao.getList(1);
		for(ExchangeVO vo : list) {
			System.out.println((int)vo.getE_ea());
		}
	}
}
