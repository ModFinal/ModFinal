package com.myweb.home.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;


import com.myweb.home.board.model.BoardDTO;
import com.myweb.home.board.model.Criteria;
import com.myweb.home.board.model.PageMaker;
import com.myweb.home.board.model.ReviewDTO;
import com.myweb.home.board.model.SearchCriteria;
import com.myweb.home.board.service.BoardService;
import com.myweb.home.board.vo.BoardVO;
import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.notice.controller.NoticeController;
import com.myweb.home.upload.model.PhotoUploadDTO;
import com.myweb.home.upload.service.PhotoUploadService;
import com.myweb.home.upload.vo.PhotoUploadVO;


@Controller
public class BoardController {
		
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
		@Autowired
		private BoardService service;
		
		@Autowired
		private PhotoUploadService photoUploadService;
		
		//상품 검색
		@RequestMapping(value = "/board/boardList_search", method = RequestMethod.GET)
		public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		 List<BoardDTO> list = service.listSearch(scri);
		 logger.info("boardList_search(search {},{})", scri,model);
		 model.addAttribute("list", list);
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(scri);
		 pageMaker.setTotalCount(service.listCount());
		 //pageMaker.setTotalCount(service.countSearch(scri));
		 model.addAttribute("pageMaker", pageMaker);
		}
		
		
		
	
		@RequestMapping(value = "/board/detail", method = RequestMethod.GET) 
		public String BoardDetailView(Model model
				, HttpSession session
				, @RequestParam int id) {
			
			logger.info("BoardDetailView(model= {})", model);
			
			
			BoardDTO data = service.getData(id);
			
		if(data != null) {
			service.incViewCnt(session, data); // 조회수 체크 세션
			model.addAttribute("data", data); // 게시글 상세 데이터
			return "board/boardDetail";
		} else {
				model.addAttribute("msg", "해당 데이터가 존재하지 않습니다.");
				model.addAttribute("url", "/home");
				return "alert"; 
			 }	
		
		}
		
		@GetMapping(value="/board/upload")
		public String add(Model model) {
			List datas = service.getAll();
			model.addAttribute("cData", datas); //카테고리 정보
			return "board/boardUpload";
		}
		
		@PostMapping(value="/board/upload")
		public String add(HttpServletRequest request
				, @SessionAttribute("loginData") AccountDTO accDto
				, @ModelAttribute BoardVO boardVo
				, @RequestParam("photoUpload") MultipartFile[] files) {

			BoardDTO data = new BoardDTO();
			data.setbTitle(boardVo.getbTitle());
			data.setbContent(boardVo.getbContent());
			data.setbId(boardVo.getbId());
			data.setCateId(boardVo.getCateId());
			data.setDealMethod(boardVo.getDealMethod());
			data.setpCondition(boardVo.getpCondition());
			data.setPrice(boardVo.getPrice());
			data.setAccountId(accDto.getAccountid());
			
			int id = service.add(data);
			
			for(MultipartFile file: files) {
				String location = request.getServletContext().getRealPath("/resources/board/upload");
				String url = "/static/board/upload";
				PhotoUploadDTO fileData = new PhotoUploadDTO(id, location, url);
				
				try {
					int fileResult = photoUploadService.upload(file, fileData);
					if(fileResult == -1) {
						request.setAttribute("error", "파일 업로드 수량을 초과하였습니다.");
						return "board/boardUpload";
					}
				} catch(Exception e) {
					request.setAttribute("error", "파일 업로드 작업중 예상치 못한 에러가 발생하였습니다.");
					return "board/boardUpload";
				}
				
			}
			
			if(id != -1) {
				return "redirect:/board/detail?id=" + id;			
			} else {
				request.setAttribute("error", "게시글 저장 실패!");
				return "board/add";
			}
		}
		
		@GetMapping(value="/board/modify")
		public String modify(Model model,
				@SessionAttribute("loginData") AccountDTO accDto,
				@RequestParam int id
				) {
			
			List datas = service.getAll();
			model.addAttribute("cData", datas); //카테고리 정보
			
			logger.info("modify(model= {}, AccountDTO={}, int={})", model, accDto, id);
			
			BoardDTO data= service.getData(id);
			List<PhotoUploadDTO> fileDatas = photoUploadService.getDatas(id);
		
			
	
			if(data != null) {
				if(data.getAccountId().equals(accDto.getAccountid()) || accDto.getAdmin().equals("Y") ) {
					model.addAttribute("data", data);
					model.addAttribute("fileDatas", fileDatas);
					return "board/boardModify";
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
		
		@PostMapping(value="/board/modify")
		public String modify(Model model, HttpServletRequest request
				, @SessionAttribute("loginData") AccountDTO accDto
				, @ModelAttribute BoardVO boardVo
				, @RequestParam("photoUpload") MultipartFile[] files)
		 {
			logger.info("modify(model= {}, AccountDTO={}, boardVo={})", model, accDto, boardVo);
			
			BoardDTO data = service.getData(boardVo.getbId());
			/*
			 * 

				for(MultipartFile file: files) {
					PhotoUploadDTO fileData = new PhotoUploadDTO();
					fileData.setbId(boardVo.getbId());
					
					try {
						int fileResult = photoUploadService.update(file, fileData);
						if(fileResult == -1) {
							model.addAttribute("msg", "파일 업로드 수량을 초과하였습니다.");
							model.addAttribute("url", "/home");
							return "alert";
						}
					} catch(Exception e) {
						model.addAttribute("msg", "파일 업로드 작업중 예상치 못한 에러가 발생하였습니다.");
						model.addAttribute("url", "/home");
						return "alert";
					}
				}
			*/
			if(data != null) {
				if(data.getAccountId().equals(accDto.getAccountid()) || accDto.getAdmin().equals("Y")) {
					data.setbTitle(boardVo.getbTitle());
					data.setbContent(boardVo.getbContent());
					data.setCateId(boardVo.getCateId());
					data.setDealMethod(boardVo.getDealMethod());
					data.setpCondition(boardVo.getpCondition());
					data.setPrice(boardVo.getPrice());
					
					boolean result = service.BoardModify(data);
					
					if(result) {
						return "redirect:/board/detail?id=" + data.getbId();
					} else {
						return modify(model, accDto, boardVo.getbId());
					}
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
		
		@PostMapping(value="/board/delete", produces="application/json; charset=utf-8")
		@ResponseBody
		public String delete(@SessionAttribute("loginData") AccountDTO accDto
				, @RequestParam int id) {
			
			logger.info("delete(id = {}, accDto={})", id, accDto);
			
			BoardDTO data = service.getDeleteBoardData(id);
			
			JSONObject json = new JSONObject();
			
			if(data == null) {
				// 삭제할 데이터 없음
				json.put("code", "notExists");
				json.put("message", "이미 삭제 된 데이터 입니다.");
			} else {
				if(data.getAccountId().equals(accDto.getAccountid())) {
					// 작성자, 수정자 동일인
					boolean result = service.removeBoard(data);
					if(result) {
						json.put("code", "success");
						json.put("message", "삭제가 완료되었습니다.");
					} else {
						// 삭제 실패
						json.put("code", "fail");
						json.put("message", "삭제 작업 중 문제가 발생하였습니다.");
					}
				} else {
					// 작성자, 수정자 동일인 아님 - 권한 없음
					json.put("code", "permissionError");
					json.put("message", "삭제 할 권한이 없습니다.");
				}
			}
			
			return json.toJSONString();
		}
		
		
		//찜하기
		@PostMapping(value="board/wishList", produces="application/json; charset=utf-8")
		@ResponseBody
		public String like(HttpSession session
				, @RequestParam("bId") int bId) {
			logger.info("like(session = {}, bId = {})", session, bId);
			
			
			BoardDTO data = new BoardDTO();
			JSONObject json = new JSONObject();
			
			data.setbId(bId);
			
			int favor = service.favor(session, data);
			
			if(favor == 1 ) {
				
				json.put("code", "like");
			} else if(favor == -1) {
				
				json.put("code", "unlike");
			} else if (favor == 0) {
				
				json.put("code", "fail");
				json.put("message", "처리 과정중 오류가 발생하였습니다.");
			}
				
			
			return json.toJSONString();
		}
		
		@PostMapping(value="board/pay", produces="application/json; charset=utf-8")
		@ResponseBody
		public String purchase(HttpSession session, @RequestParam("bId") int bId) {
			logger.info("purchase(session = {}, bId = {})", session, bId);
			
			return null;
		}
		
		
		
		
		@RequestMapping(value="/board/boardDetail", method = RequestMethod.GET)
		  public void boardDetail(@RequestParam(value="bId",defaultValue="0") int bId ,Model model) throws Exception {
			
			 logger.info("boardDetail");
			 List<ReviewDTO> review = service.ReviewList(bId);
			 model.addAttribute("review", review); 
			
		 }
		

		@RequestMapping(value="/review/add", method = RequestMethod.POST)
		public String insertReview(Model model,
				ReviewDTO data, HttpSession session,HttpServletRequest request) throws Exception{
			    logger.info("datas({})", data);
			   
			     String bid =request.getParameter("bid");
				 String content = request.getParameter("content");
				 
				 AccountDTO account = (AccountDTO)session.getAttribute("loginData");
				 
				 try {
					 data.setAccountId(account.getAccountid());
					 data.setbId(Integer.parseInt(bid));
					 data.setContent(content);
				 
				 
				 
				 }catch(Exception e) {
					 
				 }
				 service.insertReview(data);
				 
			 return "redirect:/board/boardDetail?id=" + data.getbId();
				
		}
 


		//상품후기 삭제	
			@RequestMapping(value="/review/delete", method= RequestMethod.POST)
			@ResponseBody
			public void reviewDelete(ReviewDTO reviewDTO,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
				
				
				logger.info("post review delete");
				
				
				response.setContentType("application/json; charset=utf-8");
				
				String id = request.getParameter("id");
				ReviewDTO reviewData = service.getReview(Integer.parseInt(id));
				
				AccountDTO account = (AccountDTO)session.getAttribute("loginData");
				StringBuilder sb = new StringBuilder();
				sb.append("{");
				if((reviewData.getAccountId()).equals( account.getAccountid())) {
					boolean result =service.remove(reviewData);
					if(result) {
			    		sb.append(String.format("\"%s\": \"%s\"", "code","success"));
			    	}else {
			    		sb.append(String.format("\"%s\": \"%s\"", "code","error"));
			    	}
			    }else {
			    	sb.append(String.format("\"%s\": \"%s\"", "code","error"));
			    }
				sb.append("}");
				
				response.getWriter().append(sb.toString());
				response.getWriter().flush();
			}
		
		
		
			
			@RequestMapping(value="/review/modify", method= RequestMethod.POST)
			@ResponseBody
			public void reviewmodify(@RequestParam (value="ReviewDTO",required =false) String reviewDTO,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		        
				response.setContentType("application/json; charset=utf-8");
				logger.info("reviewDTO{}, modify");
			   
			    String id = (String) request.getAttribute("id");
			    if(id == null || id == "") {
			    	return;
			    }
			    String content = request.getParameter("content");
			  
			   
			    ReviewDTO reviewData = service.getReview(Integer.parseInt(id));
			    AccountDTO accountData = (AccountDTO)session.getAttribute("loginData");

				
			    StringBuilder sb =new StringBuilder();
			    sb.append("{");
			    if(reviewData.getAccountId().equals(accountData.getAccountid())) {
			    	reviewData.setContent(content);
			    	boolean result =service.modify(reviewData);
			    	if(result) {
			    		sb.append(String.format("\"%s\": \"%s\",", "code","success"));
			    		sb.append(String.format("\"%s\": \"%s\" ", "value",reviewData.getContent()
			    				.replace("\r","\\r").replace("\n"," \\n") ));
			    		
			    	}
			    }
			    sb.append("}");
			    
			    response.getWriter().append(sb.toString());
			    response.getWriter().flush();
			  
}

}