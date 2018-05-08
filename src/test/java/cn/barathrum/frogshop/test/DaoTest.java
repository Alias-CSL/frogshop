package cn.barathrum.frogshop.test;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import cn.barathrum.frogshop.bean.Address;
import cn.barathrum.frogshop.bean.AttributeGood;
import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.bean.DescPicture;
import cn.barathrum.frogshop.bean.District;
import cn.barathrum.frogshop.bean.Evaluate;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Message;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.bean.Sku;
import cn.barathrum.frogshop.config.RootConfig;
import cn.barathrum.frogshop.dao.AddressMapper;
import cn.barathrum.frogshop.dao.AttributeGoodMapper;
import cn.barathrum.frogshop.dao.CartMapper;
import cn.barathrum.frogshop.dao.CollectionMapper;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.dao.OrderMapper;
import cn.barathrum.frogshop.dao.ProvinceMapper;
import cn.barathrum.frogshop.dao.SkuMapper;
import cn.barathrum.frogshop.dao.UserMapper;
import cn.barathrum.frogshop.service.AddressService;
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
	@Autowired
	AddressService addressService;
	@Test
	public void testAddressDao(){
		Address newAddress = new Address();
		newAddress.setId(435);
		newAddress.setUserId(3);
		newAddress.setContacterName("你好啊");
		newAddress.setPhone("13257363636");
		newAddress.setProvince("广东省");
		newAddress.setCity("广州市");
		newAddress.setDistricts("白云区");
		newAddress.setAddress( "仲恺农业工程学院");
		newAddress.setStatus((byte) 2);
		//Address address = userService.addNewAddress(newAddress);
		//assertNotNull(address);
		//System.out.println(address.getId());
		addressService.modifyAddress(newAddress);
		System.out.println(newAddress.getContacterName());
	}
	@Test
	public void goodDaoTest(){
		//int i = userService.insertUserByPhone("lowang1", "13257617382", "admin", "038bdaf98f2037b31f1e75b5b4c9b26e");
		//System.out.println(i);
		//User user = userService.findByUsername("lisi");
		String goodName = goodService.getGoodNameBySkuId(1);
		System.out.println(goodName);
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
/*		String str = "{\"颜色\":\"黑色\",\"尺码\":\"M\"}";
		String result = str.replaceAll("\"", "").replaceAll("\\{", "").replaceAll("\\}", "");
		System.out.println(result);*/
/*		Sku sku = skuMapper.selectByAttributes(1, "{\"颜色\":\"黑色\",\"尺码\":\"M\"}");
		assertNotNull(sku);
		System.out.println(sku.getAttributes());
		BigDecimal price = new BigDecimal(333);
		BigDecimal originalPrice = new BigDecimal(444);
		Sku sku1 = new Sku();
		sku1.setId(1);
		sku1.setOriginalPrice(originalPrice);
		sku1.setPrice(price);
		sku1.setResource(751);
		BigDecimal price2 = new BigDecimal(331);
		BigDecimal originalPrice2 = new BigDecimal(441);
		Sku sku2 = new Sku();
		sku2.setId(2);
		sku2.setOriginalPrice(originalPrice2);
		sku2.setPrice(price2);
		sku2.setResource(759);
		BigDecimal price3 = new BigDecimal(332);
		BigDecimal originalPrice3 = new BigDecimal(442);
		Sku sku3 = new Sku();
		sku3.setId(3);
		sku3.setOriginalPrice(originalPrice3);
		sku3.setPrice(price3);
		sku3.setResource(753);
		List<Sku> skus = new ArrayList<>();
		skus.add(sku3);
		skus.add(sku2);
		skus.add(sku1);
		//int result = goodService.updateSkus(skus);
		int result = goodService.updateSku(sku1);
		System.out.println(sku1.getGoodId());
		System.out.println(result);*/
		/*int stocks = skuMapper.selectStocksByGoodId(94);
		System.out.println(stocks);*/
		List<Cart> carts = userService.selectAllCartGoods(2);
		System.out.println(carts.size());
	}
	
	@Autowired
	private CartMapper cartMapper;
	
	@Test
	public void testCartMapper() {
		// i = cartMapper.insertSelective(3, 2, 1,new Date(),"dasa");
		//System.out.println(i);
		//Cart cart = cartMapper.selectById(34514, 2,"花花公子男士外套春秋2018春季新款男装休闲夹克男青年修身棒球服");
		//System.out.println(cart== null );
//		int s = cartMapper.updateByCartNum(10,2);
//		System.out.println(s);
		Integer[] ids = new Integer[]{4,5,6,9,10};
		List<Cart> carts = goodService.selectCartByIds(ids);
		System.out.println(carts.size());
	}
	
	@Autowired
	AddressMapper addressMapper;
	
	@Test
	public void testAddressMapper(){
		//<Address> addresses1 = addressMapper.selectByUserId(2);
		//List<Address> addresses = userService.getAllAddress(2);
		//System.out.println(addresses1.size());
		//System.out.println(addresses.size());
		//int i = userService.updateGoodData(2, 3453);
		int j = goodMapper.updateGoodData(3453,2);
		System.out.println(j);
	}
	@Autowired
	ProvinceMapper provinceMapper;
	
	@Test
	public void testProvinceMapper(){
/*		List<Province> provinces = userService.getAllProvince();
		System.out.println(provinces.size());
		List<City> cities = userService.getCitiesByProvinceId(14);
		System.out.println(cities.size());
		List<District> district = userService.getDistrictByCityId(1);
		System.out.println(district.size());*/
		List<District> district = addressService.getDistByCityName("广州市");
		System.out.println(district.size());
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
	@Autowired
	OrderMapper orderMapper;
	@Test
	public void testOrderMaper() {
//		int result = userService.createOrderGood(1762,3453,1,"花花公子男士外套春秋2018春季新款男装休闲夹克男青年修身棒球服");
//		System.out.println(result);
		int i = skuMapper.updateSkuData(1, 780);
		System.out.println(i);
/*		Order order = new Order();
		order.setUserId(2);
		order.setAddressId(441);
		order.setExpressName("韵达");
		order.setGoodNum(1);
		order.setOrderNum("201804261121107172");
		Order newOrder = userService.addOrder(order);
//		Address address= orderMapper.selectByPrimaryKey(1722).getAddress();
		Order newOrder1 = userService.getOrderByPrimaryKey(newOrder.getId()); 
		assertNotNull(newOrder1.getAddress());
		System.out.println(newOrder1.getAddress().getAddress());*/
/*		Order order = orderMapper.selectByPrimaryKey(1762);
		List<OrderGood> orderGoods = order.getOrderGoods();
		System.out.println(orderGoods.size());
		System.out.println(orderGoods.get(0).getSku().getResource());*/
//		List<Order> orders = orderMapper.selectByUserId(2);
//		System.out.println(orders.size());
	}
	@Test
	public void testBatchUpdate() {
		List<Map<String,Object>> data = new ArrayList<>();
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("id", 431);
		map1.put("status", 2);
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("id", 441);
		map2.put("status", 1);
		data.add(map1);
		data.add(map2);
		int result = addressMapper.updateDefaultAddressByMap(data);
		System.out.println(result);
	}
	@Autowired
	CollectionMapper collectionMapper;
	@Test
	public void testGoodsMapper() {
		List<Good> goods = goodService.getGoodByCategoryId(64);
		System.out.println(goods.size());
	}
	@Test
	public void testCollectionMapper() {
	//	int hasCollected = collectionMapper.selectByAllKeys(1,1);
	//	System.out.println(hasCollected);
	//int i =	userService.insertCollectionRecord(1, 1);
	//System.out.println(i);
	//int result = userService.insertNewComment(1, "201804281914148193", "201804281914148193201804281914148193201804281914148193", "1");
	//int result = userService.updateOrderStatus(1766, 6);
	//System.out.println(result);
	List<Good> goods = goodMapper.selectByCategoryId(64);
	Message.success().add("goods", goods);
	System.out.println(goods.size());
	}
	@Test 
	public void testGoodMapper() {
		/*BigDecimal price = new BigDecimal(300);
		BigDecimal originalPrice = new BigDecimal(700);
		
		int code = goodService.insertGoodSku(94,price,originalPrice,700,"http://p7bhzmlhi.bkt.clouddn.com/goodImage/goodDesc/1/475417a7-10.jpg","{\"颜色\":\"卡其色\",\"尺码\":\"4XL\"}");
		System.out.println(code);*/
/*		Good good = new Good();
		good.setGoodName("sdfsafasf");
		good.setEnteringTime(new Date());
		good.setEnteringPersonId(2);
		good.setStocks(100);
		BigDecimal originalPrice = new BigDecimal(100);
		good.setOriginalPrice(originalPrice);
		//Integer goodId = goodMapper.insertGood(good);
		int goodId = goodService.insertGood(good);
		System.out.println(goodId);
		System.out.println(good.getId());*/
		List<Good> goods = goodMapper.selectAllGoods();
		assertNotNull(goods);
	}
	@Autowired
	private AttributeGoodMapper attributeGoodMapper;
	@Test
	public void testAttributeGoodMapper() {
		AttributeGood attributeGood = new AttributeGood();
		attributeGood.setCategoryId(64);
		attributeGood.setCreateTime(new Date());
		attributeGood.setGoodId(267);
		attributeGood.setAttributes("1222222");
		//int result = attributeGoodMapper.insertSelective(attributeGood);
		int result =goodService.insertAttributeGood(attributeGood);
		System.out.println(result);
	}
	@Test
	public void testDescMapper() {
		DescPicture record = new DescPicture();
		record.setDescPicture("dsfafasf");
		record.setGoodId(280);
		int result = goodService.insertGoodDescPic(94, "dsafsfs");
		System.out.println(result);
	}
	
	@Test
	public void testOther() {
		String str = "282,283,284,285";
		String[] sIds = str.split(",");
		Integer[] ids = new Integer[sIds.length];
		for(int i = 0 ; i < sIds.length;i++) {
			ids[i] = Integer.parseInt(sIds[i]);
		}
		int result = goodMapper.deleteByGoodIds(ids);
		System.out.println(result);
	}
	@Test
	public void testPayOrderMethod() {
		Order order = userService.payTheOrder(1755);
		System.out.println(order.getPaidDate());
	}
}
