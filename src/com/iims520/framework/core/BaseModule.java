package com.iims520.framework.core;

import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;

public abstract class BaseModule {

	@Inject
	public Dao dao;
}
