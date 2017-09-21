package db.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.SubscribeDAO;
import com.yourcast.app.vo.SubscribeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class SubscribeTest {
	@Autowired
	SubscribeDAO dao;

	@Test
	public void insert() {
		dao.insert(new SubscribeVO(2, 2));
	}

	@Test
	public void delete() {
		dao.delete(new SubscribeVO(1, 2));
	}

	@Test
	public void getlist() {
		List<SubscribeVO> list = dao.getList(2);
		
		for(SubscribeVO vo : list) {
			System.out.println(vo.getM_num());
			System.out.println(vo.getBj_num());
		}
	}
}
