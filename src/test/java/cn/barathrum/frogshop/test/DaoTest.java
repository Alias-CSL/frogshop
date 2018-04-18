package cn.barathrum.frogshop.test;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.PropertyConfigurator;
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
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import cn.barathrum.frogshop.bean.AttributeName;
import cn.barathrum.frogshop.bean.Category;
import cn.barathrum.frogshop.bean.DescPicture;
import cn.barathrum.frogshop.bean.DetailPicture;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.config.RootConfig;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.service.GoodService;
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
	GoodMapper goodMapper;
	
	@Autowired
	UserService userService;
	@Before
	public void setup() {
		//PropertyConfigurator.configure("classpath:log4j.properties");  
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}
	
	@Test
	public void testUserDao(){
/*		Set<String> roleNames = userService.findRoles("lisi");
		assertNotNull(roleNames);
		System.out.println(roleNames.size());
		Set<String> permissions = userService.findPermissions("lisi");
		assertNotNull(roleNames);
		System.out.println(permissions.size());
		User user = userService.findByUsername("lisi");
		assertNotNull(user);
		Set<Roles> roles = user.getRoles();
		assertNotNull(roles);
		System.out.println(roles.size());*/
		Good good = goodMapper.selectByPrimaryKey(1);
		assertNotNull(good);
		List<DescPicture> descPictures = good.getDescPictures();
		System.out.println(descPictures.size());
		List<DetailPicture> detailPicture = good.getDetailPictures();
		System.out.println(detailPicture.size());
		List<Sku> skus = good.getSkus();
		System.out.println(skus.size());
		User userCreate = good.getUpdatePerson();
		System.out.println(userCreate.getUserName());
	}
	
	@Autowired 
	GoodService goodService;
	
	@Test
	public void goodDaoTest(){
/*		List<Good> goods = goodService.getGoodByCategoryId(64);
		Category category = goodService.getCategoryById(64);
		List<AttributeName> attributeNames = category.getAttributeNames();
		assertNotNull(goods);
		assertNotNull(category);
		System.out.println(category.toString());
		System.out.println(goods.size());
		System.out.println(attributeNames.size());*/
		List<String> attr = new ArrayList<String>();
		//attr.add("'%\"品牌\":[%\"花花公子\"%]%'");
		attr.add("'%\"尺码\":[%\"均码\"%]%'");
		List<Good> goods = goodService.getGoodByAttributes(64,attr);	
		assertNotNull(goods);
		System.out.println(goods.size());
	}
	/*@Test
	public void userLoginTest(){
		UsernamePasswordToken token = new UsernamePasswordToken("lisi","123456");
		Subject subject = SecurityUtils.getSubject();
		subject.login(token);//验证登录
	}*/
	@Test
	public void testManGoodController() {
		 MvcResult result;
		try {
			result = mockMvc.perform(get("http://localhost:8080/frogshop/man/coat/64"))
			.andExpect(MockMvcResultMatchers.view().name("search"))  
			.andExpect(MockMvcResultMatchers.model().attributeExists("goods"))  
			.andDo(MockMvcResultHandlers.print())  
			.andReturn();
			assertNotNull(result.getModelAndView().getModel().get("goods"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
  
	}
}
