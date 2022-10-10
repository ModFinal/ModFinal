package com.myweb.home.notice.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class NoticeDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAO.class);
	
	@Autowired
	private SqlSession session;
	
	private String mapper = "noticeMapper.%s";
	
	public List<NoticeDTO> selectAll() {
		
		String mapperId = String.format(mapper, "selectAllData");
		List<NoticeDTO> res = session.selectList(mapperId);
		
		logger.info("selectAll()");
		
		return res;
	}
	
	public NoticeDTO selectData(int id) {
		logger.info("selectData(id = {})", id);
		
		String mapperId = String.format(mapper, "selectDetailData");
		NoticeDTO res = session.selectOne(mapperId, id);
		return res;
	}
	
	public boolean insertData(NoticeDTO data) {
		String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId, data);
		return res == 1 ? true : false;
		
	}
	
	public boolean updateData(NoticeDTO data) {
		logger.info("updateData(data = {})", data);
		
		String mapperId = String.format(mapper, "updateData");
		int res = session.update(mapperId, data);
		return res == 1 ? true : false;
		
	}
	
	public boolean deleteData(NoticeDTO data) {
		logger.info("deleteData(data = {})", data);
		String mapperId = String.format(mapper, "deleteData");
		int res = session.delete(mapperId, data);
		return res == 1 ? true : false;
	}
	
	public int getNextSeq() {
		String mapperId = String.format(mapper, "getNextSeq");
		int seq = session.selectOne(mapperId);
		return seq;
	}

}
