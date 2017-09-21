package db.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.CategoryDAO;
import com.yourcast.app.vo.CategoryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class categoryTest {
	@Autowired
	private CategoryDAO dao;

	@Test
	public void insert() {
		int n = dao.insert(new CategoryVO(0, "자유게시판", 0, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}

	@Test
	public void update() {
		int n = dao.update(new CategoryVO(3, "질문게시판", 0, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}

	@Test
	public void delete() {
		int n = dao.delete(new CategoryVO(4, "판", 1, 1));
		boolean b = false;
		if (n > 0) {
			b = true;
		}
		assertTrue(b);
	}

	@Test
	public void getInfo() {
		CategoryVO vo = dao.getInfo(3);
		System.out.println(vo.getCategory_name());
		System.out.println(vo.getCategory_num());
		System.out.println(vo.getCategory_delete());
	}

	@Test
	public void getList() {
		List<CategoryVO> list = dao.getList(1);
		for (CategoryVO vo : list) {
			System.out.println(vo.getCategory_name());
			System.out.println(vo.getCategory_num());
			System.out.println(vo.getCategory_delete());
		}
	}
}
