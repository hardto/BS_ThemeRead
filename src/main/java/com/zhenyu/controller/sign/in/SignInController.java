package com.zhenyu.controller.sign.in;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zhenyu.common.encry.DBEncryUtils;
import com.zhenyu.common.encry.SaltStrategy;
import com.zhenyu.mapper.UserMapper;
import com.zhenyu.model.msg.UserMsg;
import com.zhenyu.service.SignService;
import com.zhenyu.util.WebUtil;

/**
 * 会员登陆控制器
 * @author lizhenyu
 *
 */
@Controller 
@SessionAttributes("USERID")
@RequestMapping(value="/user")
public class SignInController {
	@Resource
	private SignService signService;
	@RequestMapping("/login")
	public String tranToLogin(){
		return "sign/login";
	}
	@RequestMapping("/ch")
	public String changePwd(){
		return "sign/ch";
	}
	@RequestMapping(value="/check",method=RequestMethod.POST)
	public @ResponseBody UserMsg  checkUser(@RequestParam(value="usm",required=true) String typeAnditem , @RequestParam(value="pwd",required=true)String pwd,ModelMap map,HttpServletRequest req){
		UserMsg um = null;
		String ip = WebUtil.getIpAddress(req);
		String city = signService.getCity(ip);
		try{
			pwd = DBEncryUtils.AESEncode(pwd);
			um= signService.CommonCheckAccount(typeAnditem, pwd);
			um.setSuccess(true);
			if(um.getUser()!=null){
				if(city.equals(um.getUser().getCol1())){
					signService.insertLoginStatus(um.getUser().getId(), ip);
					um.setStatus("0");
					um.setMsg("登陆成功");
					map.addAttribute("USERID", um.getUser().getId());
				}else{
					um.setStatus("-1");
					um.setMsg("危险登陆");
				}
				
				
			}else{
				um.setStatus("1");
				um.setMsg("用户不存在");
			}
		}catch(Exception e){
			um = new UserMsg();
			um.setSuccess(true);
			um.setStatus("1");
			um.setMsg(e.getMessage());
			e.printStackTrace();
		}
		return um;
	}
	
	@RequestMapping(value="/addUserId",method=RequestMethod.POST)
	public void addUserId(@RequestParam("id") String id,ModelMap map,HttpServletRequest req){
		String ip = WebUtil.getIpAddress(req);
		signService.insertLoginStatus(id, ip);
		map.addAttribute("USERID", id);
	}
}
