package cn.barathrum.frogshop.bean;

import java.util.Date;

public class AttributeGood {
    private Integer id;

    private Integer goodId;

    private Integer categoryId;

    private Integer attrivalueId;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodid() {
        return goodId;
    }

    public void setGoodid(Integer goodid) {
        this.goodId = goodid;
    }

    public Integer getCategoryid() {
        return categoryId;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryId = categoryid;
    }

    public Integer getAttrivalueid() {
        return attrivalueId;
    }

    public void setAttrivalueid(Integer attrivalueid) {
        this.attrivalueId = attrivalueid;
    }

    public Date getCreatetime() {
        return createTime;
    }

    public void setCreatetime(Date createtime) {
        this.createTime = createtime;
    }
}