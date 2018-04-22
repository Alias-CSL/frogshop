package cn.barathrum.frogshop.test;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;

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

import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.config.RootConfig;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.dao.SkuMapper;
import cn.barathrum.frogshop.dao.UserMapper;
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
	@Autowired
	EvaluateMapper evaluateMapper;
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
		//System.out.println(good.get);
		//List<Evaluate> evaluates = good.getEvaluates();
		//System.out.println(good.getEnteringPerson().getUserName());
		assertNotNull(good);
		//引入分页插件，查询前设置好分页参数
		//PageHelper.startPage(1, 5);
		List<Evaluate> evaluates = evaluateMapper.selectEvaluatesByGoodId(1);
		assertNotNull(evaluates);
		System.out.println(evaluates.size());
		System.out.println(evaluates.get(0).getUser().getUserName());
		//PageInfo pageInfo  = new PageInfo(evaluates,5);
		//}else{
		//	pageInfo = null;
		//}
		//System.out.println(pageInfo.getPages());
		/*PageHelper.startPage(1, 10);
		List<Sku> skus = good.getSkus();
		PageInfo pageInfo = new PageInfo(skus,10);
		System.out.println(pageInfo.getPages());
		List<Attribute> strs = AttributeUtil.getSaleAttribute(skus);
		assertNotNull(strs);
		System.out.println(strs.get(0).getName());
		System.out.println(strs.get(0).getAttributes().get(1));*/
		
	/*	List<DescPicture> descPictures = good.getDescPictures();
		System.out.println(descPictures.size());
		List<DetailPicture> detailPicture = good.getDetailPictures();
		System.out.println(detailPicture.size());
		List<Sku> skus = good.getSkus();
		System.out.println(skus.size());
		User userCreate = good.getUpdatePerson();
		System.out.println(userCreate.getUserName());*/
		
	}
	
	@Autowired 
	GoodService goodService;
	@Autowired
	UserMapper userMapper;

	@Test
	public void goodDaoTest(){
		//int i = userService.insertUserByPhone("lowang1", "13257617382", "admin", "038bdaf98f2037b31f1e75b5b4c9b26e");
		//System.out.println(i);
		User user = userService.findByUsername("lisi");
		/*User user = userMapper.selectByPrimaryKey(1);
		assertNotNull(user);
		System.out.println(user.getUserName());*/
		//System.out.println(user.get);
/*		List<Good> goods = goodService.getGoodByCategoryId(64);
		Category category = goodService.getCategoryById(64);
		List<AttributeName> attributeNames = category.getAttributeNames();
		assertNotNull(goods);
		assertNotNull(category);
		System.out.println(category.toString());
		System.out.println(goods.size());
		System.out.println(attributeNames.size());*/
		//List<String> attr = new ArrayList<String>();
		//attr.add("'%\"品牌\":[%\"花花公子\"%]%'");
		//attr.add("'%\"尺码\":[%\"均码\",%]%'");
		//List<Good> goods = goodService.getGoodByAttributes(64,attr);	
		//assertNotNull(goods);
		//System.out.println(goods.size());
		//String str = goodService.getProductAttributes(1);
		//System.out.println(str);
	}
	/*@Test
	public void userLoginTest(){
		UsernamePasswordToken token = new UsernamePasswordToken("lisi","123456");
		Subject subject = SecurityUtils.getSubject();
		subject.login(token);//验证登录
	}*/
	
	@Autowired
	SkuMapper skuMapper;
	@Test
	public void testSkuMapper() {
		Sku sku = skuMapper.selectByAttributes(1, "{\"颜色\":\"黑色\",\"尺码\":\"M\"}");
		assertNotNull(sku);
		System.out.println(sku.getAttributes());
	}
	
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
