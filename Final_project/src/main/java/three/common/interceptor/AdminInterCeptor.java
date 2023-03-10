package three.common.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import three.user.model.UserVO;

import lombok.extern.log4j.Log4j;

//관리자 필터
@Log4j
public class AdminInterCeptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest req,HttpServletResponse res,Object handler) 
	throws Exception
	{
		HttpSession ses=req.getSession();
		UserVO user=(UserVO)ses.getAttribute("user");
		if(user==null||user.getUserStatus()!=1) {
			String view="/WEB-INF/views/index.jsp";	
			
			RequestDispatcher disp=req.getRequestDispatcher(view);
			disp.forward(req, res);
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest req,HttpServletResponse res,Object handler,ModelAndView mv) 
	throws Exception
	{
		super.postHandle(req,res,handler,mv);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest req,HttpServletResponse res,Object handler,Exception ex)
	throws Exception
	{
		
	}

}
