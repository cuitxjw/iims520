package com.iims520.framework.core;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Localization;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

import com.iims520.framework.MainSetup;


@SetupBy(value=MainSetup.class)
@Modules(scanPackage=true)
@Localization(value="msg/",defaultLocalizationKey="zh-CN")
@IocBy(type=ComboIocProvider.class,args={"*js","ioc/","*anno","com.iims520.framework.core","*tx"})
public class MainModule {

	 
}
