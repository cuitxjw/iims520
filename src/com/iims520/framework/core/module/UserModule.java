package com.iims520.framework.core.module;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.iims520.framework.core.bean.Hit;
import com.iims520.framework.core.bean.PageParam;
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
		//NutMap re = new NutMap();
		String msg = checkUser(user,true);
		
		if(msg!=null){
			return Hit.fail(msg);
		}
		
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		
		user = dao.insert(user);
		
		//return re.setv("ok", true).setv("data", user);
		return Hit.success("添加用户成功");
	}
	
	@At
	@Ok("jsp:jsp.user.add")
	public void doAdd(){
	}
	
	@At
	public Object update(@Param("..")User user){
		//NutMap re = new NutMap();
        String msg = checkUser(user, false);
        if (msg != null){
        	return Hit.fail(msg);
        }
        user.setName(null);// 不允许更新用户名
        user.setCreateTime(null);//也不允许更新创建时间
        user.setUpdateTime(new Date());// 设置正确的更新时间
        dao.updateIgnoreNull(user);// 真正更新的其实只有password和salt
        return Hit.success("修改用户成功");
	}
	
	@At
	@Ok("jsp:jsp.user.edit")
	public void doUpdate(@Param("id")int id,HttpServletRequest req){
		
		User user = dao.fetch(User.class,id );
		req.setAttribute("user", user);
	}
	
	@At
	public Object delete(@Param("id")int id,@Attr("me")int me){
		if(id==me){
			return Hit.fail("不能删除自己。");
		}
		int r = dao.delete(User.class,id);
		if(r>0){
			return Hit.success("成功删除");
		}else{
			return Hit.fail("删除失败");
		}
	}
	@At
	@Ok("jsp:jsp.user.list")
	public Object query(@Param("name")String name,@Param("..")PageParam param,HttpServletRequest req){
		Pager pager = new Pager();
		pager.setPageNumber(param.getPageNum());
		pager.setPageSize(param.getNumPerPage());
		Cnd cnd = Strings.isBlank(name)? null : Cnd.where("name", "like", "%"+name+"%");
		
		if(param.getOrderDirection()!=null&&Strings.equals(param.getOrderDirection(), "asc") ) { 
				cnd = cnd==null?Cnd.NEW():cnd;
				cnd.asc(param.getOrderField());
			}
		if(param.getOrderDirection()!=null&&Strings.equals(param.getOrderDirection(), "desc") ) {
				cnd = cnd==null?Cnd.NEW():cnd;
				cnd.desc(param.getOrderField());
			}
        QueryResult qr = new QueryResult();
        qr.setList(dao.query(User.class, cnd, pager));
        pager.setRecordCount(dao.count(User.class, cnd));
        qr.setPager(pager);
        req.setAttribute("result", qr);
       // return new ViewWrapper(new JspView("jsp.user.list"),qr); //默认分页是第1页,每页20条
        return qr;
	}
	
	@At
	@Ok("jsp:jsp.user.list")
	public void doQuery(HttpServletRequest req){
		query(null,new PageParam(),req);
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
