package db.test;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yourcast.app.dao.MemberDAO;
import com.yourcast.app.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class MemberTest {
	@Autowired
	private MemberDAO dao;
	
	@Test
	public void insert() {
		int n=dao.insert(new MemberVO(0, "db", "1234", "dongbin",null, 0, null, 0, 2, 2));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void getInfo() {
		MemberVO vo= dao.getInfo(1);
		Assert.assertNotNull(vo);	
	}
	@Test
	public void getList() {
		List<MemberVO> list=dao.getList();
		Assert.assertNotNull(list);
	}
	@Test
	public void update(){
		int n=dao.update(new MemberVO(1, "kang", "2222", "kmj",null, 0, null, 0, 0, 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void moneyUpdate() {
		int n=dao.moneyUpdate(new MemberVO(1, 10000, null, 0, 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void starcandyUpdate() {
		int n=dao.starcandyUpdate(new MemberVO(1, 0, null, 500, 0));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void gradeUpdate() {
		int n=dao.gradeUpdate(new MemberVO(1, 0, null, 0, 3));
		boolean a=false;
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
	}
	@Test
	public void limitUpdate() {
		//String day="2017-09-30";
		//SimpleDateFormat sd=new SimpleDateFormat("yyyy/mm/dd");
		//Date limit_date= (Date) sd.parse(day);
		//System.out.println(limit_date);
		//Date date=new Date(2017, 9, 30);
		int n=dao.limitUpdate(new MemberVO(1, 0, null, 0, 0));
		boolean a=false;
		
		if(n>0) {
			a=true;
		}
		Assert.assertTrue(a);
		
	}
}
