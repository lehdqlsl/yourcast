package db.test;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.VideoReplyDAO;
import com.yourcast.app.vo.VideoReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class VideoReplyTest {
	@Autowired
	private VideoReplyDAO dao;
	@Test
	public void insert() {
		int n=dao.insert(new VideoReplyVO(0, "testvr1", null, 0, 1,1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void delete() {
		int n=dao.delete(2);
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void update() {
		int n=dao.update(new VideoReplyVO(2, "change", null, 0, 1, 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		VideoReplyVO vo=dao.getInfo(2);
		Assert.assertNotNull(vo);
	}
	@Test
	public void getList() {
		List<VideoReplyVO> list=dao.getList(1);
		Assert.assertNotNull(list);
	}
}
