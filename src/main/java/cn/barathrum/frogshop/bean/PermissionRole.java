package cn.barathrum.frogshop.bean;

public class PermissionRole {
    private Integer id;

    private Integer permissionId;

    private Integer roleId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPermissionid() {
        return permissionId;
    }

    public void setPermissionid(Integer permissionid) {
        this.permissionId = permissionid;
    }

    public Integer getRoleid() {
        return roleId;
    }

    public void setRoleid(Integer roleid) {
        this.roleId = roleid;
    }
}