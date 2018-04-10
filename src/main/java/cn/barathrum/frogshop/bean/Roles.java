package cn.barathrum.frogshop.bean;

import java.util.Date;
import java.util.Set;

public class Roles {
	//角色id
    private Integer id;
    //角色名（简称）
    private String name;
    //角色展示名称
    private String displayName;
    //描述
    private String description;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //该角色所包含的权限
    private Set<Permissions> permissions;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Set<Permissions> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permissions> permissions) {
		this.permissions = permissions;
	}
    
}