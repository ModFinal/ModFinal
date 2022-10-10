package com.myweb.home.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.home.common.util.Paging;
import com.myweb.home.main.model.MainDTO;
import com.myweb.home.main.service.MainService;

@Controller
@RequestMapping(value="/main")
public class MainContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(MainContoller.class);
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET) 
		public String getCateList(Model model, HttpSession session
				, @RequestParam(defaultValue="1", required=false) int page
				, @RequestParam(defaultValue="0", required=false) int pageCount 
				, @RequestParam(value="type") int category) {
		
		logger.info("getCateList(model= {})", model);
		
		List datas = service.getCate(category);
		MainDTO tData = service.getCateTitle(category);
		
		if(session.getAttribute("pageCount") == null) {
			session.setAttribute("pageCount", 5);
		}
		
		if(pageCount > 0) {
			session.setAttribute("pageCount", pageCount);
		}
		
		pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
		Paging paging = new Paging(datas, page, pageCount);
		
		model.addAttribute("datas", paging.getPageData());  // 게시글
		model.addAttribute("pageData", paging);
		model.addAttribute("tData" ,tData); // 카테고리 데이터
		
		return "board/boardList_category";
		
		
		
	}
	
}
