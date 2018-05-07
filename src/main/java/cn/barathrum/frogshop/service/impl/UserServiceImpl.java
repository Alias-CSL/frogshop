package cn.barathrum.frogshop.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.barathrum.frogshop.bean.Cart;
import cn.barathrum.frogshop.bean.Good;
import cn.barathrum.frogshop.bean.Order;
import cn.barathrum.frogshop.bean.User;
import cn.barathrum.frogshop.dao.CartMapper;
import cn.barathrum.frogshop.dao.CollectionMapper;
import cn.barathrum.frogshop.dao.EvaluateMapper;
import cn.barathrum.frogshop.dao.GoodMapper;
import cn.barathrum.frogshop.dao.OrderGoodMapper;
import cn.barathrum.frogshop.dao.OrderMapper;
import cn.barathrum.frogshop.dao.PermissionsMapper;
import cn.barathrum.frogshop.dao.RolesMapper;
import cn.barathrum.frogshop.dao.SkuMapper;
import cn.barathrum.frogshop.dao.UserMapper;
import cn.barathrum.frogshop.service.UserService;
import cn.barathrum.frogshop.utils.DigitalCodeUtil;

@Service
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserMapper userDao;
	@Autowired
	private CartMapper cartMapper;
	// 注入RolesDao
	@Autowired
	private RolesMapper rolesDao;
	// 注入PermissionsDao
	@Autowired
	private PermissionsMapper permissionDao;

	// 注入SkuMapper
	@Autowired
	private SkuMapper skuMapper;
	// 注入OrderMapper
	@Autowired
	private OrderMapper orderMapper;
	// 注入OrderGoodMapper
	@Autowired
	private OrderGoodMapper orderGoodMapper;
	// 注入GoodMapper
	@Autowired
	private GoodMapper goodMapper;
	//注入CollectionMapper
	@Autowired
	private CollectionMapper collectionMapper;
	//注入EvaluateMapper
	@Autowired
	private EvaluateMapper evaluateMapper;
	// 根据用户名获取角色
	@Override
	public Set<String> findRolesByUsername(String username) {
		return rolesDao.selectByUserName(username);
	}

	// 根据用户名获取权限
	@Override
	public Set<String> findPermissionsByUsername(String username) {
		return permissionDao.selectByUserName(username);
	}

	// 通过用户名获取用户
	@Override
	public User findByUsername(String username) {
		return userDao.selectByUsername(username);
	}

	// 根据手机号获取角色
	@Override
	public Set<String> findRolesByPhoneNum(String phoneNum) {
		return rolesDao.selectByPhoneNum(phoneNum);
	}

	// 根据手机号获取权限
	@Override
	public Set<String> findPermissionsByPhoneNum(String phoneNum) {
		return permissionDao.selectByPhoneNum(phoneNum);
	}

	// 根据手机号获取
	@Override
	public User findByPhoneNum(String phoneNum) {
		return userDao.selectByPhoneNum(phoneNum);
	}

	// 根据邮箱获取角色
	@Override
	public Set<String> findRolesByEmail(String email) {
		return rolesDao.selectByEmail(email);
	}

	// 根据邮箱获取权限
	@Override
	public Set<String> findPermissionsByEmail(String email) {
		return permissionDao.selectByEmail(email);
	}

	// 根据邮箱获取用户
	@Override
	public User findByEmail(String email) {
		return userDao.selectByEmail(email);
	}

	// 通过手机号码注册用户
	@Override
	public int insertUserByPhone(String username, String phoneNum, String salt, String encryptPassword) {
		User user = new User();
		user.setUserName(username);
		user.setPhone(phoneNum);
		user.setCredentialsSalt(salt);
		user.setUserPass(encryptPassword);
		user.setStatus(1);
		user.setCreateTime(new Date());
		return userDao.insertSelective(user);
	}

	// 通过邮箱注册用户
	@Override
	public int insertUserByEmail(String username, String email, String salt, String encryptPassword) {
		User user = new User();
		user.setUserName(username);
		user.setEmail(email);
		user.setCredentialsSalt(salt);
		user.setUserPass(encryptPassword);
		user.setStatus(1);
		user.setCreateTime(new Date());
		return userDao.insertSelective(user);
	}

	/**
	 * 将商品加入购物车
	 */
	@Override
	public int addToCart(Integer skuId, Integer userId, Integer goodNum, String goodName) {
		return cartMapper.insertSelective(skuId, userId, goodNum, new Date(), goodName);
	}

	/**
	 * 创建订单
	 */
	@Override
	public Order addOrder(Order order) {
		String orderNum = DigitalCodeUtil.getOrderCode();// 生创订单码
		order.setOrderNum(orderNum);// 设置订单码
		order.setCreateDate(new Date());// 设置订单创建时间
		orderMapper.insertSelective(order);
		return order;
	}

	/**
	 * 创建订单与商品的关联
	 * 
	 * @param orderId
	 *            订单id
	 * @param skuId
	 *            商品sku id
	 * @param goodNum商品数量
	 * @return
	 */
	@Override
	public int createOrderGood(int orderId, Integer skuId, Integer goodNum, String goodName) {
		return orderGoodMapper.insertGoodOrder(orderId, skuId, goodNum, goodName);
	}

	/**
	 * 通过订单d获取订单
	 * 
	 * @param id
	 *            订单id
	 * @return
	 */
	@Override
	public Order getOrderByPrimaryKey(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	/**
	 * 支付订单
	 */
	@Override
	public Order payTheOrder(Integer orderId) {
		Integer status = 2;
		Date payDate = new Date();
		int result = orderMapper.updateByPayBill(orderId, status, payDate);
		if (result > 0) {
			Order order = orderMapper.selectByPrimaryKey(orderId);
			return order;
		}
		return null;
	}

	/**
	 * 通过用户id获取所有订单
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Order> selectOrderByUserId(Integer userId) {
		return orderMapper.selectByUserId(userId);
	}

	/**
	 * 查询之前是否加入过购物车
	 * 
	 * @param skuId
	 *            sku id
	 * @param userId
	 *            用户id
	 * @param goodName
	 *            商品名
	 */
	@Override
	public Cart selectCartById(Integer skuId, Integer userId, String goodName) {
		return cartMapper.selectById(skuId, userId, goodName);
	}

	/**
	 * 更新购物车信息
	 * 
	 * @param id
	 *            购物车商品id
	 * @param goodNum
	 *            购物数量
	 * @return
	 */
	@Override
	public int updateCartNum(Integer id, Integer goodNum) {
		return cartMapper.updateByCartNum(id, goodNum);
	}

	/**
	 * 更新商品数据
	 * 
	 * @param goodNum
	 *            商品数量
	 * @param skuId
	 *            skuId
	 * @return
	 */
	@Override
	public int updateGoodData(Integer goodNum, Integer skuId) {
		// 先更新sku表，如果sku库存够的话，再修改商品总库存与总销量数据
		int result = skuMapper.updateSkuData(skuId, goodNum);
		if (result == 1) {// 说明还有库存，可以加入购买
			int i = goodMapper.updateGoodData(skuId, goodNum);
			if (i == 1) {
				return 1;
			}
			return 0;
		}
		return 0;
	}

	/**
	 * 获取指定类型的用户所有的订单信息
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Order> selectOrderByStatus(Integer userId, Integer status) {
		return orderMapper.selectOrderByStatus(userId, status);
	}

	/**
	 * 收藏商品，先判断商品是否存在
	 * @param goodId 商品id
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public int insertCollectionRecord(Integer goodId, Integer userId) {
		int hasCollected = collectionMapper.selectByAllKeys(goodId,userId);
		System.out.println(hasCollected);
		if(hasCollected == 0) {//为收藏过，添加收藏记录
			int result = collectionMapper.insertRecord(goodId,userId,new Date());
			return result;
		}
		return 0;
	}
	/**
	 * 用户添加评价
	 * @param userId 用户id
	 * @param orderNum 订单码
	 * @param content 内容
	 * @param grade 评分等级
	 * @return
	 */
	@Override
	public int insertNewComment(Integer userId, String orderNum, String content, String grade) {
		return evaluateMapper.insertNewRecord(userId,orderNum,content,grade,new Date());
	}
	/**
	 * 更改订单状态
	 * @param orderId
	 * @param type
	 * @return
	 */
	@Override
	public int updateOrderStatus(Integer orderId, int type) {
		return orderMapper.updateByStatus(orderId,type);
	}
	/**
	 * 返回用户收藏的商品
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public List<Good> selectAllCollection(Integer userId) {
		return goodMapper.selectByUserId(userId);
	}
	/**
	 * 获取用户购物车所有商品信息
	 * @param userId 用户id
	 * @return
	 */
	@Override
	public List<Cart> selectAllCartGoods(Integer userId) {
		return cartMapper.selectByUserId(userId);
	}

}
