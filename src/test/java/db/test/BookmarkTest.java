package db.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.BookmarkDAO;
import com.yourcast.app.vo.BookmarkVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class BookmarkTest {

	@Autowired
	private BookmarkDAO dao;
	
	@Test
	public void insert() {
		int n = dao.insert(new BookmarkVO(0, 1, 1));
		boolean a = false;
		if(n>0) {
			a  = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void delete() {
		int n = dao.delete(1);
		boolean a = false;
		if(n>0) {
			a = true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getList() {
		List<BookmarkVO> mlist=dao.getList();
		Assert.assertNotNull(mlist);
	}
}
