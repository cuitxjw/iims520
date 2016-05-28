package com.iims520.framework.core.module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

@IocBean
@At("/")
@Ok("jsp")
@Fail("http:500")
public class IndexModule {
	
	private String title = "管理平台";
	
	@At("index")
	public Object doIndex(HttpSession session,HttpServletRequest req){
		
		Object me = session.getAttribute("me");
		if(me==null){
			
		}
		
		req.setAttribute("title", title);
		
		return new ViewWrapper(new JspView("jsp.admin.main"),title);
	}

}
