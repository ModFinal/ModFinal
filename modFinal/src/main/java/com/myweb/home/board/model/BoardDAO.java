package com.myweb.home.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.home.board.controller.BoardController;
import com.myweb.home.info.model.InfoDTO;
import com.myweb.home.info.model.ProfileStaticsDTO;
import com.myweb.home.notice.model.NoticeDTO;
import com.myweb.home.upload.model.PhotoUploadDTO;


	@Repository
	public class BoardDAO {
		
private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
		
		@Autowired
		private SqlSession sqlSession;
	
		
		
		public int listCount() throws Exception {
			return sqlSession.selectOne("boardMapper.listCount");
		}
		
		public List<BoardDTO> listSearch(SearchCriteria scri) throws Exception {
		    return sqlSession.selectList("boardMapper.listSearch",scri);
		}
		
		public int countSearch(SearchCriteria scri) throws Exception{
			return sqlSession.selectOne("boardMapper.countSearch",scri);
		}
	
		//delete를 위함
		public BoardDTO selectDeleteBoard(int id) {
			BoardDTO res = sqlSession.selectOne("boardMapper.selectBoardAllData", id);
			return res;
		}

		
		public BoardDTO selectBoardDetail(int id) {
			logger.info("selectBoardDetail(id={})", id);
			
			BoardDTO res = sqlSession.selectOne("boardMapper.selectBoardData", id);
			return res;
		}
		
		public boolean updateViewCnt(BoardDTO data) {
			int res = sqlSession.update("boardMapper.updateViewCnt", data);
			
			return res == 1 ? true : false;
		}
		
		
		public BoardStaticsDTO selectStatics(BoardStaticsDTO data) {

			BoardStaticsDTO res = sqlSession.selectOne("boardMapper.selectBoardStatics", data);
			return res;
		}
		
		public boolean insertStatics(BoardStaticsDTO data) {
			
			int res = sqlSession.insert("boardMapper.insertBoardStatics", data);
			return res == 1 ? true : false;
		}
		
		public boolean updateStatics(BoardStaticsDTO data) {
			
			int res = sqlSession.update("boardMapper.updateBoardStatics", data);
			return res == 1 ? true : false;
		}
		
		public List<BoardDTO> selectCate() {
			List<BoardDTO> res =  sqlSession.selectList("boardMapper.selectCateDatas");
			return res;
		}
		
		public int getNextSeq() {
			int seq = sqlSession.selectOne("boardMapper.getNextSeq");
			return seq;
		}
		
		public boolean insertData(BoardDTO data) {
			int res = sqlSession.insert("boardMapper.insertData", data);
			return res == 1 ? true : false;
		}
		
		public boolean updateBoardData(BoardDTO data) {
			int res = sqlSession.update("boardMapper.updateContentData", data);
			return res == 1 ? true : false;
		
		}
		public boolean deleteBoardData(BoardDTO data) {
			int res = sqlSession.delete("boardMapper.deleteBoardData", data);
			return res == 1 ? true : false;
		}
		
		public FavoriteDTO selectFavorData(FavoriteDTO data) {
			logger.info("selectFavorData(data={})", data);
			
			FavoriteDTO res = sqlSession.selectOne("boardMapper.selectFavor", data);
			
			return res;
		}
		
		public boolean insertFavorData(FavoriteDTO data) {
			logger.info("insertFavorData(data={})", data);
			int res = sqlSession.insert("boardMapper.insertFavor", data);
			return res == 1 ? true : false;
		}
		
		public boolean deleteFavorData(FavoriteDTO data) {
			logger.info("deleteFavorData(data={})", data);
			int res = sqlSession.delete("boardMapper.deleteFavor", data);
			return res == 1 ? true : false;
		}
		
		//review
		public void insertReview(ReviewDTO data) {
			 logger.info("data({})",data);
				sqlSession.insert("reviewMapper.insertReview", data);
			}

	
		public List<ReviewDTO> ReviewList(int bId) {
			logger.info("bId({})",bId);
			return sqlSession.selectList("reviewMapper.ReviewList", bId);
		}

		public ReviewDTO getReview(int id) {
			logger.info("id({})",id);
			return sqlSession.selectOne("reviewMapper.getReview", id);
		}

		public boolean deleteData(ReviewDTO data) {
			logger.info("data({})",data);
			int res = sqlSession.update("reviewMapper.deleteData", data);
			return res == 1 ? true : false;
		}

		public boolean updateData(ReviewDTO data) {
			logger.info("updatedata({})",data);
			int res = sqlSession.update("reviewMapper.updateData", data);
			return res == 1 ? true: false;
		}
	   
}
