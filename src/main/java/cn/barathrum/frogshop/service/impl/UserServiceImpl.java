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

	// 注入GoodMapper
	@Autowired
	private GoodMapper goodMapper;
	// 注入CollectionMapper
	@Autowired
	private CollectionMapper collectionMapper;

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
	 * 收藏商品，先判断商品是否存在
	 * 
	 * @param goodId
	 *            商品id
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public int insertCollectionRecord(Integer goodId, Integer userId) {
		int hasCollected = collectionMapper.selectByAllKeys(goodId, userId);
		System.out.println(hasCollected);
		if (hasCollected == 0) {// 为收藏过，添加收藏记录
			int result = collectionMapper.insertRecord(goodId, userId, new Date());
			return result;
		}
		return 0;
	}

	/**
	 * 返回用户收藏的商品
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@Override
	public List<Good> selectAllCollection(Integer userId) {
		return goodMapper.selectByUserId(userId);
	}

}
