package com.zhenyu.controller.content;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zhenyu.model.Recommend;
import com.zhenyu.model.Type;
import com.zhenyu.model.msg.TypesMsg;
import com.zhenyu.service.ViewService;

/**
 * 网站核心内容
 * @author lizhenyu
 *
 */
@Controller
@RequestMapping("/content")
public class MainController {
	@Resource
	private ViewService viewService;
	@RequestMapping("/index")
	public String index(){
		return "content/index";
	}
	@RequestMapping("/others")
	public String admin(){
		return "content/others";
	}
	@RequestMapping("/categories")
	public String categories(){
		return "content/cates";
	}
	
	@RequestMapping("/title")
	public String title(String type,HttpServletRequest request){
		String id = (String) request.getSession().getAttribute("USERID");
		viewService.insertAction(id, type);
		return "content/title";
	}
	
	@RequestMapping("/readNews")
	public String readNews(){
		return "content/readNews";
	}
	

	@RequestMapping("/readArticles")
	public String readArticles(){
		return "content/readArticles";
	}
	@RequestMapping("/readRecommend")
	public String readRecommend(){
		return "content/readRecommend";
	}
	
	@RequestMapping(value="/types",method=RequestMethod.POST)
	public @ResponseBody TypesMsg getTypes(){
		TypesMsg tm = new TypesMsg();
		tm.setSuccess(true);
		List<Type> types = viewService.getTypes();
		if(types!=null && types.size()>0){
			tm.setStatus("0");
			tm.setMsg("数据获取成功");
			tm.setTypes(types);
		}
		return tm;
	}
	@RequestMapping(value="/allTypes",method=RequestMethod.POST)
	public @ResponseBody TypesMsg getAllTypes(){
		TypesMsg tm = new TypesMsg();
		tm.setSuccess(true);
		List<Type> types = viewService.getAllTypes();
		if(types!=null && types.size()>0){
			tm.setStatus("0");
			tm.setMsg("数据获取成功");
			tm.setTypes(types);
		}
		return tm;
	}
	
	@RequestMapping(value="/oneType",method=RequestMethod.POST)
	public @ResponseBody Type getOneType(String id){
		Type type = viewService.getOneType(id);
		return type;
	}
	
	
	
	@RequestMapping(value="/specialTypes",method=RequestMethod.POST)
	public @ResponseBody TypesMsg specialTypes(String id){
		TypesMsg tm = new TypesMsg();
		tm.setSuccess(true); 
		List<Type> types = viewService.getChildrenTypes(id);
		if(types!=null && types.size()>0){
			tm.setStatus("0");
			tm.setMsg("数据获取成功");
			tm.setTypes(types);
		}
		return tm;
	}

	
	@RequestMapping("/robot")
	public String robot(){
		return "content/robotchat";
	}
	
	@RequestMapping("/all")
	public String all(){
		return "content/all";
	}
	
	@RequestMapping(value="/posoition",produces="text/html; charset=UTF-8")
	public void getPosition(String name,HttpServletResponse res){
		String position = viewService.getPosition(name);
		System.out.println(position);
		try {
			res.setContentType("text/html;charset=utf-8");  
			res.getWriter().print(position);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/getRecommend",method=RequestMethod.POST)
	public @ResponseBody Recommend getRecommend(){
		
		return viewService.getRecommendToday();
	}
	
	@RequestMapping(value="/getRecommendById",method=RequestMethod.POST)
	public @ResponseBody Recommend getRecommendById(String id){
		
		return viewService.getRecommendById(id);
	}

	
	
	
	

}
