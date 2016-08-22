package com.iims520.framework.core.module;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
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
	public void doAdd(@Param("parentId")int id,HttpServletRequest req){
		
		req.setAttribute("parentId", id);
		String parentName = "顶级菜单";
		if(id>0){
			Menu parent = dao.fetch(Menu.class,id);
			parentName = parent.getName();
		}
		req.setAttribute("parentName", parentName);
	}
	@At
	@Ok("jsp:jsp.menu.list")	
	public void doList(HttpServletRequest req){
		
		QueryResult result = new QueryResult();
		
		Cnd cnd = Cnd.NEW();
		cnd.asc("createTime");
		
		result.setList(dao.query(Menu.class, cnd));
		req.setAttribute("rq", result.convertList(Menu.class));
	}
	
	@At
	@Ok("jsp:jsp.menu.edit")
	public void doEdit(@Param("id")int id,HttpServletRequest req){
		Menu m = dao.fetch(Menu.class,id);
		dao.fetchLinks(m, "parent"); //获取对应的关联对象
		req.setAttribute("menu",m);
	}
	
	@At
	public Object add(@Param("..")Menu menu){
		
		menu.setCreateTime(new Date());
		menu.setUpdateTime(new Date());
		menu = dao.insert(menu);
		
		return Hit.success("菜单添加成功");
	}
	
	@At
	public Object update(@Param("..") Menu m){
		
		m.setUpdateTime(new Date());
		m.setCreateTime(null);
		dao.updateIgnoreNull(m);
		 return Hit.success("修改菜单成功");
	}

}
