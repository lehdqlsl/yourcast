package db.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.MemberProfileDAO;
import com.yourcast.app.vo.MemberProfileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class MemberProfileTest {
	@Autowired
	private MemberProfileDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new MemberProfileVO(0, "msg..1234", "profile_content", "profile_orgfilename", "profile_savefilename", 1));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		MemberProfileVO vo=dao.getInfo(1);
		Assert.assertNotNull(vo);
	}
	@Test
	public void imgUpdate() {
		int n=dao.imgUpdate(new MemberProfileVO(1, null,null, "org", "save", 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void msgUpdate() {
		int n=dao.msgUpdate(new MemberProfileVO(3, "changemsg111", null, null, null, 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void contentUpdate() {
		int n=dao.contentUpdate(new MemberProfileVO(3, null, "changeContent..111", null, null, 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
}
