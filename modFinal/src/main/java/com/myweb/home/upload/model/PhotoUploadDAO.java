package com.myweb.home.upload.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.home.member.controller.MemberController;

@Repository
public class PhotoUploadDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PhotoUploadDAO.class);
	
	@Autowired
	private SqlSession session;
	
	public int getCount(int bId) {
		int res = session.selectOne("photoUploadMapper.getCount", bId);
		return res;
	}

	public boolean insertData(PhotoUploadDTO data) {
		logger.info("insertData(data= {})", data);
		int res = session.insert("photoUploadMapper.insertData", data);
		System.out.println(res);
		return res == 1 ? true : false;
	}

	public List<PhotoUploadDTO> selectBoardDatas(int bId) {
		logger.info("selectBoardDatas(int= {})", bId);
		List<PhotoUploadDTO> res = session.selectList("photoUploadMapper.selectBoardDatas", bId);
		return res;
	}
	
	public boolean updateFileData(PhotoUploadDTO data) {
		logger.info("updateFileData(data= {})", data);
		int res = session.update("photoUploadMapper.updateFileData", data);
		return res == 1 ? true : false;
	
	}

	public boolean insertProfileData(PhotoUploadDTO data) {
		int res = session.insert("photoUploadMapper.insertProfileData", data);
		System.out.println(res);
		return res == 1 ? true : false;
	}
	
	
}
