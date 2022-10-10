package com.myweb.home.board.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.home.board.controller.BoardController;
import com.myweb.home.board.model.BoardDAO;
import com.myweb.home.board.model.BoardDTO;
import com.myweb.home.board.model.BoardStaticsDTO;
import com.myweb.home.board.model.Criteria;
import com.myweb.home.board.model.FavoriteDTO;
import com.myweb.home.board.model.ReviewDTO;
import com.myweb.home.board.model.SearchCriteria;
import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.notice.model.NoticeDTO;
import com.myweb.home.upload.model.PhotoUploadDAO;
import com.myweb.home.upload.model.PhotoUploadDTO;


@Service
public class BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private PhotoUploadDAO pDao;
	
	public int listCount() throws Exception {
		return dao.listCount();
	}
 
	public List<BoardDTO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}
	
	public int countSearch(SearchCriteria scri)throws Exception {
		return dao.countSearch(scri);
	}
	
	public BoardDTO getDeleteBoardData(int id) {
		BoardDTO data = dao.selectDeleteBoard(id);
		return data;
	}
	
	public BoardDTO getData(int id) {
		logger.info("getData(id={})", id);
		
		BoardDTO data = dao.selectBoardDetail(id);
		return data;
	}
	
	@Transactional
	public void incViewCnt(HttpSession session, BoardDTO data) {
		BoardStaticsDTO staticsData = new BoardStaticsDTO();
		staticsData.setbId(data.getbId());
		if(session.getAttribute("loginData")!= null) {
			staticsData.setAccId(((AccountDTO)session.getAttribute("loginData")).getAccountid());
			
		} else {
			staticsData.setAccId(null);
		}
		staticsData = dao.selectStatics(staticsData);
		
		boolean result = false;
		if(staticsData == null) {
			result = dao.updateViewCnt(data);
			if(!result) {
				throw new RuntimeException("조회수 통계 업데이트 처리에 문제가 발생 하였습니다.");
			}
			
			staticsData = new BoardStaticsDTO();
			staticsData.setbId(data.getbId());
			if(session.getAttribute("loginData") != null) {
				staticsData.setAccId(((AccountDTO)session.getAttribute("loginData")).getAccountid());
				
			} else {
				staticsData.setAccId(null);
			}
			result = dao.insertStatics(staticsData);
			if(!result) {
				throw new RuntimeException("조회수 통계 추가 처리에 문제가 발생 하였습니다.");
			}
		} else {
			long timeDiff = new Date().getTime() - staticsData.getLatestView().getTime();
			if(timeDiff / (1000 * 60 * 60 * 24) >= 7) {
				result = dao.updateViewCnt(data);
				if(!result) {
					throw new RuntimeException("조회수 업데이트 처리에 문제가 발생 하였습니다.");
				}
				result = dao.updateStatics(staticsData);
				if(!result) {
					throw new RuntimeException("조회수 통계 업데이트 처리에 문제가 발생 하였습니다.");
				}
			}
		}
		
		if(result) {
			data.setViewCnt(data.getViewCnt() + 1);
		}
	
	
	}
	
	public List<BoardDTO> getAll() {
		List<BoardDTO> datas = dao.selectCate();
		return datas;
	}
	
	public int add(BoardDTO data) {
		int seq = dao.getNextSeq();
		data.setbId(seq);
		
		boolean result = dao.insertData(data);
		
		if(result) {
			return data.getbId();
		}
		return -1;
	}
	
	public boolean BoardModify(BoardDTO data) {
		boolean result = dao.updateBoardData(data);
		return result;
	}
	
	public boolean ImageModify(PhotoUploadDTO data) {
		boolean result = pDao.updateFileData(data);
		return result;
	}
	
	public boolean removeBoard(BoardDTO data) {
		logger.info("remove(data = {})", data);
		
		boolean result = dao.deleteBoardData(data);
		
		return result;
	}
	
	public int favor(HttpSession session, BoardDTO data) {
		AccountDTO accData = (AccountDTO)session.getAttribute("loginData");
		
		FavoriteDTO favorData = new FavoriteDTO();
		favorData.setAccId(accData.getAccountid());
		favorData.setbId(data.getbId());
		
		if(dao.selectFavorData(favorData) != null) {
			//찜 기록이 있을 시
			
			boolean FavorDelete = dao.deleteFavorData(favorData);
			
			if(!FavorDelete) {
				
				return 0;
			}
			return -1;
			
		} else {
			//찜 기록이 없을 시
			boolean FavorInsert = dao.insertFavorData(favorData);
			
			if(!FavorInsert) {
				
				return 0;
			}
			return 1;
			
		}
		
	}
	
	
	
	//review
	public void insertReview(ReviewDTO data) throws Exception{
		 logger.info("data({})",data);
		dao.insertReview(data);
	}

	public List<ReviewDTO> ReviewList(int bId) throws Exception{
		 logger.info("bId({})",bId);
		return dao.ReviewList(bId);
	}

	public ReviewDTO getReview(int id) {
		logger.info("id({})",id);
		return dao.getReview(id);
	}

	public boolean remove(ReviewDTO data) {
		 logger.info("data({})",data);
		boolean result = dao.deleteData(data);
		return result;
		
	}

	public boolean modify(ReviewDTO data) {
		logger.info("updateData({})",data);
		boolean result = dao.updateData(data);
		return result;
	}    
}
