package com.zhenyu.controller.sign.in;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.zhenyu.common.encry.DBEncryUtils;
import com.zhenyu.model.User;
import com.zhenyu.model.msg.CensusMsg;
import com.zhenyu.model.msg.CollectMsg;
import com.zhenyu.service.SignService;
import com.zhenyu.service.ViewService;

@Controller 
@SessionAttributes("USERID")
@RequestMapping(value="/manager")
public class ManagerController {
	Logger logger = Logger.getLogger(ManagerController.class);
	@Resource
	private ViewService viewService;
	@Resource
	private SignService signService;
	@RequestMapping("/login")
	public String login(){
		return "manager/login";
	}
	@RequestMapping("/index")
	public String hasUser(String usm,String pwd,ModelMap map,HttpServletRequest request){
		Object sessionObj = request.getSession().getAttribute("USERID");  
		if(sessionObj != null ){
			return "content/admin";
		}else{
			if(usm == null || pwd == null || "".equals(usm) || "".equals(pwd)){
				 return "redirect:login";
			}else{
				pwd = DBEncryUtils.AESEncode(pwd);
				User user = signService.validateUserWithAcc(usm,pwd);
				logger.info("授权上面一步");
				Subject subject = SecurityUtils.getSubject();
				 UsernamePasswordToken token = new UsernamePasswordToken(usm, pwd);
				 subject.login(token);
				if(user != null){
					map.addAttribute("USERID", user.getId());
					logger.info("设置了id");
					return "content/admin";
				}else{
					return "redirect:login";
				}
			}
		}
		
	}
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String upload(@RequestParam("descripe")String describe,@RequestParam("file") MultipartFile file,String typeId,HttpServletRequest req ){
		//文件上传到文件夹，路径和描述存到数据库
		if(file != null && !"".equals(file.getOriginalFilename())){
			String path = req.getServletContext().getRealPath("/resource/images");
			String fileName = file.getOriginalFilename();
			try {
				file.transferTo(new File(path+File.separator+fileName));
				viewService.updateTypeById(typeId, describe, "resource/images/"+fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			if(describe == null){
				describe = "";
			}
			viewService.updateTypeById(typeId, describe, "");
		}
		return "forward:index";
	}
	
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(String delid,String ishot,String fatherid,String addtype,HttpServletRequest req ){
		viewService.edit(delid, ishot, fatherid, addtype);
		return "redirect:index";
	}
	
	
	@RequestMapping(value="/recommend",method=RequestMethod.POST)
	public String recommend(String main,String sub,String content,HttpServletRequest req ){
		viewService.recommend(main.trim(), sub.trim(),content);
		return "redirect:index";
	}
	
	
	
	@RequestMapping(value="/census",method=RequestMethod.POST)
	public @ResponseBody CensusMsg census(){
		return viewService.getCensus();
	}
	
	@RequestMapping(value="/collect",method=RequestMethod.POST)
	public @ResponseBody CollectMsg collect(){
		return viewService.getCollect();//collect
	}
	
	
	
	
	
}
