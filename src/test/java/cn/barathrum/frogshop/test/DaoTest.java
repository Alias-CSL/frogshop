package cn.barathrum.frogshop.test;

import static org.junit.Assert.assertNotNull;

import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import cn.barathrum.frogshop.bean.Roles;
import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.config.RootConfig;
import cn.barathrum.frogshop.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes=RootConfig.class)
public class DaoTest {
	@Autowired
	private WebApplicationContext wac;
	
	@Autowired
	MockHttpSession session;
	
	@Autowired 
	MockHttpServletRequest request;
	
	private MockMvc mockMvc;
	
	
	
	@Autowired
	UserService userService;
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}
	
	@Test
	public void testUserDao(){
		Set<String> roleNames = userService.findRoles("lisi");
		assertNotNull(roleNames);
		System.out.println(roleNames.size());
		Set<String> permissions = userService.findPermissions("lisi");
		assertNotNull(roleNames);
		System.out.println(permissions.size());
		User user = userService.findByUsername("lisi");
		assertNotNull(user);
		Set<Roles> roles = user.getRoles();
		assertNotNull(roles);
		System.out.println(roles.size());
	}
	
	@Test
	public void userLoginTest(){
		UsernamePasswordToken token = new UsernamePasswordToken("lisi","123456");
		Subject subject = SecurityUtils.getSubject();
		subject.login(token);//验证登录
	}
}
