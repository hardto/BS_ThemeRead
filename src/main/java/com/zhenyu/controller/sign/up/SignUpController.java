package com.zhenyu.controller.sign.up;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zhenyu.common.annotation.FormToken;
import com.zhenyu.common.encry.DBEncryUtils;
import com.zhenyu.common.encry.SaltStrategy;
import com.zhenyu.common.mail.EmailContent;
import com.zhenyu.common.mail.MailUtils;
import com.zhenyu.model.User;
import com.zhenyu.service.SignService;
import com.zhenyu.util.WebUtil;

/**
 * 注册会员
 * @author lizhenyu
 *
 */
@Controller
@SessionAttributes("USERID")
@RequestMapping("/user")
public class SignUpController {
	private static Map<String,String> map = new HashMap<String,String>();
	@Resource
	private SignService signService;
	@RequestMapping("/register")
	@FormToken(save = true)
	public String tranToRegester(){
		return "sign/register";
	}
	/***
	 * 存储用户信息
	 * @param user
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws NoSuchAlgorithmException 
	 */
	@RequestMapping(value="/info"/*,method=RequestMethod.POST*/)
	/*@FormToken(remove = true)*/
	public String registerInfo(User user,HttpServletRequest req,ModelMap map) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		String ip = WebUtil.getIpAddress(req);
		boolean result = false;
		user.setPassword(DBEncryUtils.AESEncode(user.getPassword()));
		if(!signService.isLogon(user.getEmail(), user.getPhone())){
			result = signService.saveUserInfo(user,ip);
		}
		if(result){
			map.addAttribute("USERID", user.getId());
			return "redirect:../content/index";
		}else{
			return "sign/register";
		}
	}
	@RequestMapping(value="/SaveChangePwd"/*,method=RequestMethod.POST*/)
	public String SaveChangePwd(String email,String password){
		boolean resu = signService.changePwdWithEmail(email, DBEncryUtils.AESEncode(password));
		if(resu){
			return "redirect:login";
		}else{
			return "redirect:ch";
		}
		//return "redirect:login";
	}
	
	@RequestMapping("/getCode")
	public void getCode(String email,String phone,String random,HttpServletResponse res){
		if(!signService.isLogon(email, phone)){
			String code = EmailContent.VerificationCodes();
			map.put(random, code);
			try {
				MailUtils.sendEmail(code, email);
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				res.getWriter().print("-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	@RequestMapping("/getCodeForCh")
	public void getCodeForCh(String email,String random,HttpServletResponse res){
		if(signService.isLogonEmail(email)){
			String code = EmailContent.VerificationCodes();
			map.put(random, code);
			try {
				MailUtils.sendEmail(code, email);
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				res.getWriter().print("-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
	@RequestMapping("/sendCode")
	public void sendCode(String random,HttpServletResponse res){
		try {
			res.getWriter().print(map.get(random));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
