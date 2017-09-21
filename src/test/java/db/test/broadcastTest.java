package db.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.BroadcastDAO;
import com.yourcast.app.dao.CategoryDAO;
import com.yourcast.app.vo.BroadcastVO;
import com.yourcast.app.vo.CategoryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class broadcastTest {
	@Autowired
	private BroadcastDAO dao;

	@Test
	public void insert() {
		int n = dao.insert(new BroadcastVO("현재 방송중이 아닙니다.", "423414", 1, 1, 2, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}

	@Test
	public void update() {
		dao.update(new BroadcastVO("롤 방송!!", null, 1, 1, 2, 1));
	}

	@Test
	public void getlist() {
		List<BroadcastVO> list = dao.getList();
		
		for(BroadcastVO vo : list) {
			System.out.println(vo.getBroadcast_title());
		}
	}

	@Test
	public void getinfo() {
		BroadcastVO vo = dao.getInfo(1);
		System.out.println(vo.getBroadcast_title());
	}

	@Test
	public void getcount() {
		System.out.println(dao.getCount());
	}
}
