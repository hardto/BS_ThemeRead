package com.zhenyu.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
/**
 * 登陆service层
 * @author lizhenyu
 *事务添加spring-orm
 */

import com.zhenyu.common.ippojo.CityFromIp;
import com.zhenyu.mapper.LoginMapper;
import com.zhenyu.mapper.UserAuthsMapper;
import com.zhenyu.mapper.UserMapper;
import com.zhenyu.model.Login;
import com.zhenyu.model.User;
import com.zhenyu.model.UserAuths;
import com.zhenyu.model.msg.UserMsg;
import com.zhenyu.util.ValidateString;
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service
public class SignService { 
	@Resource
	private CityFromIp cityFromIp;
	@Resource
	private UserAuthsMapper userAuthsMapper;
	@Resource
	private LoginMapper loginMapper;
	@Resource
	private UserMapper userMapper;
	
	public User validateUserWithAcc(String acc,String pwd){
		User user = userMapper.selectByUsmPwd(acc,pwd);
		return user;
	}
	
	public UserMsg CommonCheckAccount(String typeAndItem,String pwd){
		if(ValidateString.isEmail(typeAndItem)){
			UserAuths ua = userAuthsMapper.selectByIdentityType("email",typeAndItem,pwd);
			UserMsg um = new UserMsg();
			if(ua!=null){
				User user = userMapper.selectByPrimaryKey(ua.getUserId());
				um.setUser(user);
			}
			return um;
			
		}else if(ValidateString.isPhone(typeAndItem)){
			UserMsg um = new UserMsg();
			UserAuths ua = userAuthsMapper.selectByIdentityType("phone",typeAndItem,pwd);
			if(ua!=null){
				User user = userMapper.selectByPrimaryKey(ua.getUserId());
				um.setUser(user);
			}
			return um;
		}else{
			User user = userMapper.selectByUsmPwd(typeAndItem,pwd);
			UserMsg um = new UserMsg();
			um.setUser(user);
			return um;
		}
	}
	/**
	 * 对于表中id,由于不是int类型自增，所以需要手动设置
	 * @param user
	 * @return
	 */
	public boolean saveUserInfo(User user,String ip){
		if("127.0.0.1".equals(ip)){
			user.setCol1("中国南京");
		}else{
			String city = cityFromIp.getSubdivision(ip);
			user.setCol1(city);
		}
		
		user.setRegisterIp(ip);
		int userId = userMapper.getId();
		user.setId(String.valueOf((userId+1)));
		int i = userMapper.insert(user);
		UserAuths ua = new UserAuths();
		int userAuthsId = userAuthsMapper.getId();
		ua.setId(String.valueOf(userAuthsId+1));
		ua.setIdentityType("phone");
		ua.setUserId(user.getId());
		ua.setIdentity(user.getPhone());
		ua.setCredential(user.getPassword());
		int ii = userAuthsMapper.insert(ua);
		UserAuths uas = new UserAuths();
		int userAuthsId2 = userAuthsMapper.getId();
		uas.setId(String.valueOf(userAuthsId2+1));
		uas.setIdentityType("email");
		uas.setUserId(user.getId());
		uas.setIdentity(user.getEmail());
		uas.setCredential(user.getPassword());
		int iii = userAuthsMapper.insert(uas);
		return i>0&&ii>0&&iii>0;
	}
	
	public String getCity(String ip){
		String city = "";
		if("127.0.0.1".equals(ip)){
			city = "中国南京";
		}else{
			city = cityFromIp.getSubdivision(ip);
		}
		
		return city;
	}
	
	public boolean isLogon(String email,String phone){
		if(userMapper.selectByEmail(email)!=null||userMapper.selectByPhone(phone)!=null){
			return true;
		}
		return false;
	}
	
	public boolean isLogonAll(String email, String phone,String account) {
		if(userMapper.selectByEmail(email)!=null||userMapper.selectByPhone(phone)!=null||userMapper.selectByAccount(account)!=null){
			return true;
		}
		return false;
	}
	
	public boolean isLogonEmail(String email){
		if(userMapper.selectByEmail(email)!=null){
			return true;
		}
		return false;
	}
	
	public boolean isLogonPhone(String phone){
		if(userMapper.selectByPhone(phone)!=null){
			return true;
		}
		return false;
	}
	
	//登陆状态表插库
	public void insertLoginStatus(String id,String ip){
		int newId = loginMapper.getId();
		Login login = new Login();
		login.setId(String.valueOf(newId+1));
		login.setUserId(id);
		login.setLoginIp(ip);
		login.setLoginTime(new Date());
		loginMapper.insert(login);
	}
	
	public boolean changePwdWithEmail(String email,String pwd){
		//更新2个表
		int i = userAuthsMapper.updateByIdentity(email,pwd);
		int ii = userMapper.updateByEmail(email, pwd);
		return i>0&&ii>0;
	}

	

}
