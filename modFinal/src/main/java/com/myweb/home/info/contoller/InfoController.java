package com.myweb.home.info.contoller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myweb.home.common.util.Paging;
import com.myweb.home.info.model.InfoDTO;
import com.myweb.home.info.service.InfoService;
import com.myweb.home.login.model.AccountDTO;

@Controller
@RequestMapping(value= "/myinfo")
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Autowired
	private InfoService service;
	

	@RequestMapping(value="/main")
	public String getProfile(Model model, HttpSession session
			, @SessionAttribute("loginData") AccountDTO accDto) {
		
		if(accDto != null) {
			
			InfoDTO pData = service.getUserInfo(accDto.getAccountid());
			InfoDTO photo = service.getUserPhoto(accDto.getAccountid());
			InfoDTO dData = service.getUserPurchase(accDto.getAccountid());
			
			
			model.addAttribute("pData", pData); // 프로필 데이터
			model.addAttribute("photo", photo); // 사진
			model.addAttribute("dData", dData); // 구매 횟수
			
			return "login/myPage";
		} 
		// 에러 페이지 미완
		if (session.getAttribute("loginData") == null) {
			//로그인 안하고 진입시
				model.addAttribute("msg", "접근 권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "alert";
			} else {
			// 그 외 
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/home");
				return "alert";
			
		}
		
	}
	
	@RequestMapping(value="/shoppinglist")
	public String getShoppingDetail(Model model , HttpSession session
			, @SessionAttribute("loginData") AccountDTO accDto
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount ) {
		
		logger.info("getShoppingDetail(model= {})", model);
		
		if(accDto != null) {
			
			InfoDTO pData = service.getUserInfo(accDto.getAccountid());
			InfoDTO photo = service.getUserPhoto(accDto.getAccountid());
			InfoDTO dData = service.getUserPurchase(accDto.getAccountid());
			List datas = service.getPurchaseList(accDto.getAccountid());
			
			
			if(session.getAttribute("pageCount") == null) {
				session.setAttribute("pageCount", 5);
			}
			
			if(pageCount > 0) {
				session.setAttribute("pageCount", pageCount);
			}
			
			pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
			Paging paging = new Paging(datas, page, pageCount);
			
			
			model.addAttribute("pData", pData); // 프로필 데이터
			model.addAttribute("photo", photo); // 사진
			model.addAttribute("dData", dData); // 구매 횟수
			model.addAttribute("datas", paging.getPageData()); // 구매 상품 목록
			model.addAttribute("shoppingPage", paging);
			
			return "login/shoppingList";
		}  
		//
		if (session.getAttribute("loginData") == null) {
			//로그인 안하고 진입시
				model.addAttribute("msg", "접근 권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "alert";
			} else {
			// 그 외 
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/home");
				return "alert";
			
		}
	}
	
	@RequestMapping(value="/favoritelist")
	public String getFavoriteDetail(Model model , HttpSession session
			, @SessionAttribute("loginData") AccountDTO accDto
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount ) {
		
		logger.info("getShoppingDetail(model= {})", model);
		
		if(accDto != null) {
			
			InfoDTO pData = service.getUserInfo(accDto.getAccountid());
			InfoDTO photo = service.getUserPhoto(accDto.getAccountid());
			InfoDTO dData = service.getUserPurchase(accDto.getAccountid());
			List datas = service.getFavoriteList(accDto.getAccountid());
			
			
			if(session.getAttribute("pageCount") == null) {
				session.setAttribute("pageCount", 5);
			}
			
			if(pageCount > 0) {
				session.setAttribute("pageCount", pageCount);
			}
			
			pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
			Paging paging = new Paging(datas, page, pageCount);
			
			
			model.addAttribute("pData", pData); // 프로필 데이터
			model.addAttribute("photo", photo); // 사진
			model.addAttribute("dData", dData); // 구매 횟수
			model.addAttribute("datas", paging.getPageData()); //찜 상품 목록
			model.addAttribute("favoriteListPage", paging);
			
			return "login/favoriteList";
		}  
		//
		if (session.getAttribute("loginData") == null) {
			//로그인 안하고 진입시
				model.addAttribute("msg", "접근 권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "alert";
			} else {
			// 그 외 
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/home");
				return "alert";
			
		}
	}
	
	@RequestMapping(value="/myStore")
	public String getStoreList (Model model , HttpSession session
			, @SessionAttribute("loginData") AccountDTO accDto
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount ) {
		logger.info("getStoreList(model= {}, session= {}, accDto= {})", model, session, accDto);
		
		if(accDto != null) {
			
			InfoDTO pData = service.getMyStoreInfo(accDto.getAccountid());
			InfoDTO photo = service.getUserPhoto(accDto.getAccountid());
			InfoDTO sData = service.getUserSelling(accDto.getAccountid());
			List datas = service.getSellList(accDto.getAccountid());
			
			
			if(session.getAttribute("pageCount") == null) {
				session.setAttribute("pageCount", 5);
			}
			
			if(pageCount > 0) {
				session.setAttribute("pageCount", pageCount);
			}
			
			pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
			Paging paging = new Paging(datas, page, pageCount);
			
			service.incVisitCnt(session, pData);// 상점 방문 횟수 
			model.addAttribute("pData", pData); // 프로필 데이터
			model.addAttribute("photo", photo); // 사진
			model.addAttribute("sData", sData); // 판매 횟수
			model.addAttribute("datas", paging.getPageData()); //판매중 상품 목록
			model.addAttribute("pageData", paging);
			
			return "shop/myShop";
		}  
		//
		if (session.getAttribute("loginData") == null) {
			//로그인 안하고 진입시
				model.addAttribute("msg", "접근 권한이 없습니다.");
				model.addAttribute("url", "/home");
				return "alert";
			} else {
			// 그 외 
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("url", "/home");
				return "alert";
			
		}
	}
	

}
