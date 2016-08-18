package com.iims520.framework.core.module;

import java.util.Date;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.iims520.framework.core.BaseModule;
import com.iims520.framework.core.bean.Hit;
import com.iims520.framework.core.bean.Menu;

/**
 * 菜单管理 ，针对系统构建时，使用。
 * @author Administrator
 *
 */
@IocBean
@At("/menu")
@Ok("json")
@Fail("http:500")
public class MenuModule extends BaseModule{
	
	@At
	@Ok("jsp:jsp.menu.add")
	public void doAdd(){
		//
	}
	@At
	@Ok("jsp:jsp.menu.list")	
	public void doList(){
		
	}
	
	@At
	public Object add(@Param("..")Menu menu){
		
		menu.setCreateTime(new Date());
		menu.setUpdateTime(new Date());
		menu = dao.insert(menu);
		
		return Hit.success("菜单添加成功");
	}

}
