package com.myweb.home.login.service;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
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
   
	
    public void sendEmail(AccountDTO DTO,String div) throws Exception {
    	
    	String charSet = "utf-8";
    	String hostSMTP = "smtp.gmail.com";
    	String hostSMTPid = "hope30529@gmail.com";
    	String hostSMTPpwd = "byxkxugbviucxxuc";
    
    
        String fromEmail = "hope30529@gmail.com";
        String fromName = "HeemangPark";
        String subject = "";
        String msg="";
        
        if(div.equals("findpw")) {
        	subject = "지구마켓 임시 비밀번호 입니다.";
        	msg += "<div align = 'center' style='border:1px solid black; font-family:verdana'>";
        	msg += "<h3 style='color: blue;'>";
    		msg += DTO.getAccountid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
    		msg += "<p>임시 비밀번호 : ";
    		msg += DTO.getPassword() + "</p></div>";
        }
        
        String mail = DTO.getEmail();
        try {
        	  HtmlEmail email = new HtmlEmail();
        	  email.setDebug(true);
        	  email.setCharset(charSet);
        	  email.setSSL(false);
        	  email.setHostName(hostSMTP);
        	  email.setSmtpPort(465);
        	  
        	  email.setAuthentication(hostSMTPid, hostSMTPpwd);
        	  email.setTLS(true);
              email.addTo(mail, charSet);
              email.setFrom(fromEmail, fromName, charSet);
              email.setSubject(subject);
              email.setHtmlMsg(msg);
              email.send(); 	  
        } catch (Exception e) {
        	System.out.println("메일발송 실패 : " + e);
        }
    }

	public void find_pw(HttpServletResponse response,HttpSession session, AccountDTO accountDTO) throws Exception {
					logger.info("find_pw({})",accountDTO);
					response.setContentType("text/html;charset=utf-8");
					//AccountDTO data  = dao.find_pw(accountDTO);
					PrintWriter out = response.getWriter();
					
					if(accountDTO.getAccountid() == null) {
						    out.println("<script>");
							out.println("alert('가입된 아이디가 없습니다.');");
							out.println("history.go(-1);");
							out.println("</script>");
							out.close();
						
					
				
					}else if(!accountDTO.getEmail().equals(accountDTO.getAccountid())) {
						out.println("잘못된 이메일 입니다.");
						out.close();
					}else {
						String pw = "";
						for(int i = 0; i<12; i++) {
							pw += (char)((Math.random() * 26) + 97);
						}
						accountDTO.setPassword(pw);
						dao.update_pw(accountDTO);
						sendEmail(accountDTO, "find_pw");
						
						out.print("이메일로 임시 비밀번호를 발송하였습니다.");
						out.close();
					//	 session.setAttribute("passData", data);
					//	return accountDTO;
			
					
				}
}



}
	

	

