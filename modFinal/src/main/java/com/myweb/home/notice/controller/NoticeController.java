package com.myweb.home.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myweb.home.common.util.Paging;
import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.notice.model.NoticeDAO;
import com.myweb.home.notice.model.NoticeDTO;
import com.myweb.home.notice.service.NoticeService;
import com.myweb.home.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;

	@RequestMapping(value="", method=RequestMethod.GET)
	public String getList(Model model, HttpSession session
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount) {
		logger.info("getList(model= {})", model);
		
		List data = service.getAll();
		
		if(session.getAttribute("pageCount") == null) {
			session.setAttribute("pageCount", 5);
		}
		
		if(pageCount > 0) {
			session.setAttribute("pageCount", pageCount);
		}
		
		pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
		Paging paging = new Paging(data, page, pageCount);
		
		model.addAttribute("datas", paging.getPageData());
		model.addAttribute("pageData", paging);
		
		return "notice/list"; 
	};
	
	@GetMapping(value="/detail")
	public String getDetail(Model model
			, HttpSession session
			, @RequestParam int id) {
		NoticeDTO data = service.getData(id);
		
		if(data != null) {
			model.addAttribute("data", data);
			return "notice/detail"; //
		} else {
			model.addAttribute("msg", "해당 데이터가 존재하지 않습니다.");
			model.addAttribute("url", "/home");
			return "alert"; //
		}
	}
	
	@GetMapping(value="/add")
	public String add() {
		return "notice/add"; 
	}
	
	@PostMapping(value="/add") 
	public String add(HttpServletRequest request,
			 @ModelAttribute NoticeVO noticeVo
			,@SessionAttribute("loginData") AccountDTO accDto) {
		
		logger.info("add(request= {}, noticeVo ={}, accDto ={})", request, noticeVo, accDto);
		
		NoticeDTO data = new NoticeDTO();
		data.setTitle(noticeVo.getTitle());
		data.setContent(noticeVo.getContent());
		
		if(accDto.getAdmin().equals("Y")) {
			int id = service.add(data);
			
			if(id!= -1) { 
				return "redirect:/notice/detail?id=" + id;
			} else {
				request.setAttribute("error", "게시글 저장에 실패하였습니다.");
				return "notice/add"; 
			}
			
		} else {
			request.setAttribute("error", "해당 작업의 권한이 없습니다.");
			return "/home";
			
		}
		
		
	}
	
	@GetMapping(value="/modify")
	public String modify(Model model
			, @RequestParam int id
			, @SessionAttribute("loginData") AccountDTO accDto) {
	
		logger.info("modify(model= {}, id ={})", model, id);
		
		NoticeDTO data = service.getData(id);
		
		if(data != null) {
			if(accDto.getAdmin().equals("Y")) {
				model.addAttribute("data", data);
				return "notice/modify";
			} else {	
				model.addAttribute("msg", "해당 작업을 수행할 권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "alert";
			}
		} else {
			model.addAttribute("msg", "해당 데이터가 존재하지 않습니다.");
			model.addAttribute("url", "/home");
			return "alert";
		}
	}
	
	@PostMapping(value="/modify")
	public String modify(Model model
			, @ModelAttribute NoticeVO noticeVo
			, @SessionAttribute("loginData") AccountDTO accDto) {
		
		logger.info("modify(model= {}, noticeVo ={})", model, noticeVo);
		
		NoticeDTO data = service.getData(noticeVo.getNotId());
		
		if(data != null) {
			if(accDto.getAdmin().equals("Y")) {
				data.setTitle(noticeVo.getTitle());
				data.setContent(noticeVo.getContent());
				boolean result = service.modify(data);
				
				if(result) {
					return "redirect:/notice/detail?id=" + data.getNotId();
				} else {
					return modify(model, noticeVo.getNotId(), accDto);
				}
			} else {
				model.addAttribute("msg", "해당 작업을 수행할 권한이 없습니다.");
				model.addAttribute("url", "/home");
			return "alert";
			} 
		}else {
			model.addAttribute("msg", "해당 데이터가 없습니다.");
			model.addAttribute("url", "/home");
		return "alert";
		}
	}
	
	@PostMapping(value="/delete", produces="application/json; charset=utf-8")
	@ResponseBody
	public String delete( @RequestParam int id) {
		NoticeDTO data = service.getData(id);
		
		logger.info("delete(id = {})", id);
		
		JSONObject json = new JSONObject();
		
		if(data == null) {
			// 삭제할 데이터 없음
			json.put("code", "notExists");
			json.put("message", "이미 삭제 된 데이터 입니다.");
		} else {
				boolean result = service.remove(data);
				if(result) {
					json.put("code", "success");
					json.put("message", "삭제가 완료되었습니다.");
				} else {
					// 삭제 실패
					json.put("code", "fail");
					json.put("message", "삭제 작업 중 문제가 발생하였습니다.");
				}
			}
			return json.toJSONString();
		}
	
}
