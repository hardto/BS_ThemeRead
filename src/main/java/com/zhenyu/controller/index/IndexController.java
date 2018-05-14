package com.zhenyu.controller.index;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhenyu.model.Type;
import com.zhenyu.model.msg.TypesMsg;
import com.zhenyu.service.ViewService;

/**
 * 首页
 * @author lizhenyu
 *
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	@Resource
	private ViewService viewService;
	@RequestMapping("/category")
	public String tranToIndex(){
		return "redirect:../user/login";
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

}
