package com.iims520.framework.core.module;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;

import com.iims520.framework.core.BaseModule;

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

}
