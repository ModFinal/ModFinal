package com.myweb.home.login.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.login.service.LoginService;
import com.myweb.home.login.vo.LoginVO;






@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	
	@GetMapping(value="/login")
	public String login(Model model) {
		return "login/login";
		
	}
	
	

	
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(LoginVO loginVo,Model model
			, HttpServletRequest request
			, HttpSession session) {
	
		logger.info("login({},{})",loginVo.getAccountid(), loginVo.getPassword());
		boolean result = service.getLogin(session,loginVo);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		
		   if(result) {
			   //성공
			  
			   return "redirect:/";
		   } else {
			   //실패
			   return"login/login";
		   }
	       }

	
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
    //아이디,비밀번호 찾기 폼으로 이동
	@RequestMapping(value = "/login/findIdPw",method=RequestMethod.GET)
	public String findIdPw() throws Exception {
		return "/login/findIdPw";
	}
	
	@GetMapping(value = "/login/find_id")
	public String find_id(Model model) {
		return "/login/find_id";
	}
	
	//아이디 찾기 성공
	@RequestMapping(value = "/login/find_id", method =RequestMethod.POST)
    public String find_id( @RequestParam("email")String email
				, HttpServletResponse response
				, HttpSession session) throws Exception {
			
			logger.info("find_id({})",email);
			
			
			boolean result = service.find_id(response,session,email);
			
			if(result) {
				//성공 
				System.out.println("성공");
				return "/login/find_id";
			} else {
				//실패
				System.out.println("실패");
				return"login/login";
			}
		}

	
	//비밀번호 찾기 성공
	@RequestMapping(value = "/login/find_pw", method =RequestMethod.POST)
	public String find_pw(@ModelAttribute AccountDTO accountDTO,
			HttpServletResponse response,HttpSession session) throws Exception{
		service.find_pw(response,session, accountDTO);
		
		return "/login/find_pw";
    }
	
	
	
}