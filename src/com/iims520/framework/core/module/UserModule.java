package com.iims520.framework.core.module;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.iims520.framework.core.bean.User;


@IocBean
@At("/user")
@Ok("json")
@Fail("http:500")
public class UserModule {
	
	@Inject
	private Dao dao;
	
	@At
	public Object login(@Param("username")String username,@Param("password")String password,HttpSession session){
		
		User user = dao.fetch(User.class,Cnd.where("name","=",username).and("password","=",password));//这里的属性是针对对象的
		checkUser(user,false);
		
		if(user==null){
			return false;
		}else{
			session.setAttribute("me", user.getId());
		}
		return true;
		
	} 
	
	
	@At
	@Ok(">>:/")
	public void logout(HttpSession session){
		session.invalidate();
	}
	
	
	@At
	public int count(){
		
		return dao.count(User.class);
	}
	
	@At
	public Object add(@Param("..")User user){
		NutMap re = new NutMap();
		String msg = checkUser(user,true);
		
		if(msg!=null){
			return re.setv("ok", false).setv("msg", msg);
		}
		
		user.setLoginName(user.getName());
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		
		user = dao.insert(user);
		
		return re.setv("ok", true).setv("data", user);
	}
	
	protected String checkUser(User user, boolean create) {
        if (user == null) {
            return "空对象";
        }
        if (create) {
            if (Strings.isBlank(user.getName()) || Strings.isBlank(user.getPassword()))
                return "用户名/密码不能为空";
        } else {
            if (Strings.isBlank(user.getPassword()))
                return "密码不能为空";
        }
        String passwd = user.getPassword().trim();
        if (6 > passwd.length() || passwd.length() > 12) {
            return "密码长度错误";
        }
        user.setPassword(passwd);
        if (create) {
            int count = dao.count(User.class, Cnd.where("name", "=", user.getName()));
            if (count != 0) {
                return "用户名已经存在";
            }
        } else {
            if (user.getId() < 1) {
                return "用户Id非法";
            }
        }
        if (user.getName() != null)
            user.setName(user.getName().trim());
        return null;
    }

}
