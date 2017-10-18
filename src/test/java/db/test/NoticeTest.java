package db.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.NoticeDAO;
import com.yourcast.app.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class NoticeTest {
	@Autowired
	private NoticeDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new NoticeVO(0, "notice1", "notice_content..1", null, 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		NoticeVO vo=dao.getInfo(1);
		Assert.assertNotNull(vo);
	}
	@Test
	public void getList() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 2);
		List<NoticeVO> list=dao.getList(map);
		Assert.assertNotNull(list);
	}
	@Test
	public void getCount() {
		int n=dao.getCount();
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
}
