package db.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.BlacklistDAO;
import com.yourcast.app.dao.BoardUpDAO;
import com.yourcast.app.vo.BlacklistVO;
import com.yourcast.app.vo.BoardUpVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class boardupTest {
	@Autowired
	private BoardUpDAO dao;

	@Test
	public void getcount() {
		int n = dao.getCount(1);
		System.out.println("°á°ú:"+n);
	}

	@Test
	public void insert() {
		int n = dao.insert(new BoardUpVO(1, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}
}
