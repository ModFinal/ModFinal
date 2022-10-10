package com.myweb.home.login.service;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.login.model.LoginDAO;
import com.myweb.home.login.vo.LoginVO;

@Service
public class LoginService<accountDTO> {

	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	 private LoginDAO dao;
	 
	 public boolean getLogin(HttpSession session, LoginVO loginVo) {
		 
		logger.info("getLogin({},{}",session, loginVo);
		 AccountDTO data = new AccountDTO();
		 data.setAccountid(loginVo.getAccountid());
		 data.setPassword(loginVo.getPassword());
		 
		 data = dao.selectLogin(data);
		 
		 if(data != null) {
			 session.setAttribute("loginData", data);
			 return true;
			
		 } else {
			 return false;
		     
		 }
		 
	 }
	
    
	public boolean find_id(HttpServletResponse response,HttpSession session, String email) throws IOException {
		logger.info("find_id({})", email);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		 AccountDTO data = new AccountDTO();
		 data.setEmail(email);
		
		 
		 data = dao.find_id(email);
		 if(data != null) {
			 session.setAttribute("emailData", data);
			 return true;	 
		 }
		 out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		 }


	public AccountDTO find_pw(HttpServletResponse response,HttpSession session, AccountDTO accountDTO) throws Exception {
					logger.info("find_pw({})",accountDTO);
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					AccountDTO data  = dao.find_pw(accountDTO);
					
					if(data == null) {//가입되지 않은 정보
						    out.println("<script>");
							out.println("alert('가입된 비밀번호가 없습니다.');");
							out.println("history.go(-1);");
							out.println("</script>");
							out.close();
						
						return null;
				
					}else {
						 session.setAttribute("passData", data);
						return accountDTO;
			
					
				}
}
}
	

	

