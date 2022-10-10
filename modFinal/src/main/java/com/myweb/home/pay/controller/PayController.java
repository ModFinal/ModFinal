package com.myweb.home.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.member.service.MemberService;
import com.myweb.home.member.vo.MemberVO;
import com.myweb.home.upload.service.PhotoUploadService;

@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	@Autowired
	private MemberService service;
	
	
	@GetMapping(value="/payment/pay")
	public String payment(HttpServletRequest request, Model model, AccountDTO accountDto) {
		logger.info("Get Payment(HttpServletRequest={}, model={}, accountDto={})", request, model, accountDto);
		
		HttpSession session = request.getSession();
		accountDto = (AccountDTO) session.getAttribute("loginData");
		
		String accountid = accountDto.getAccountid();
		
		MemberVO data = service.getAll(accountid);
		
		
//		int price = "";
		
		model.addAttribute("data", data);
//		model.addattribute("price", price); // 상품가격
		
		return "payment/pay";
		
		
		
	}

	
	
	@PostMapping(value="/payment/pay")	
	public String payment(MemberVO vo, RedirectAttributes ra) {
		logger.info("Post Payment");
		
		return "home";
	}
	

	
}
