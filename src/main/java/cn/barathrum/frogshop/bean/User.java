package cn.barathrum.frogshop.bean;

import java.util.Date;
import java.util.Set;

public class User {
	//用户id
    private Integer id;
    //用户名
    private String userName;
    //用户密码
    private String userPass;
    //用户手机号
    private String phone;
    //账号状态
    private Integer status;
    //账号创建时间
    private Date createTime;
    //用户邮箱
    private String email;
    //用户所拥有的权限
    private Set<Roles> roles;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Set<Roles> getRoles() {
		return roles;
	}
	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}

  
}