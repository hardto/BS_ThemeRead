package com.zhenyu.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class CommonInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Object sessionObj = request.getSession().getAttribute("USERID");  
	    if(sessionObj!=null) {   
	      return true;  
	    }   
	    /*以weblog/blog/abs为例
	    /weblog
	    /weblog/blog/das
	    /blog/das*/
	    System.out.println(request.getContextPath());
	    /*
	    System.out.println(request.getRequestURI());
	    System.out.println(request.getServletPath());*/
	    response.sendRedirect(request.getContextPath());  
	   /* response.sendRedirect("/");*/
	    return false;  
	}

}
