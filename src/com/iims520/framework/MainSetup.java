package com.iims520.framework;

import java.util.Date;

import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.ioc.Ioc;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.iims520.framework.core.bean.User;

public class MainSetup implements Setup {

	@Override
	public void destroy(NutConfig arg0) {
		
	}

	@Override
	public void init(NutConfig conf) {
		Ioc ioc = conf.getIoc();
		Dao dao = ioc.get(Dao.class);
		Daos.createTablesInPackage(dao, "com.iims520.framework", false);
		
		if(dao.count(User.class)==0){
			User user = new User();
			user.setName("admin");
			user.setLoginName("admin");
			user.setPassword("123456");
			
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			dao.insert(user);
		}
	}

}
