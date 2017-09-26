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

import com.yourcast.app.dao.BoardReplyDAO;
import com.yourcast.app.vo.BoardReplyVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class BoardReplyTest {
	@Autowired
	private BoardReplyDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new BoardReplyVO(0, "test", null, 0, 1, 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void delete() {
		int n=dao.delete(1);
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void update() {
		int n=dao.update(new BoardReplyVO(3, "abcde", null, 0, 1, 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		BoardReplyVO vo=dao.getInfo(1);
		Assert.assertNotNull(vo);
	}
	@Test//에러(sql문은 맞음)
	public void getList() {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("b_num", 65);
		map.put("rnum", 1);
		map.put("rnum", 5);
		List<BoardReplyVO> list=dao.getList(map);
		Assert.assertNotNull(list);
	}
}
