package com.iims520.framework.core.bean;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;

public abstract  class BasePojo {

	@Column("CT")
	protected Date createTime;
	
	@Column("UT")
	protected Date updateTime;

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
	
	
}
