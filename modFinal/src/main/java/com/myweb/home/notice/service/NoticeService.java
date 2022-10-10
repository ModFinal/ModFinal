package com.myweb.home.notice.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.myweb.home.notice.model.NoticeDAO;
import com.myweb.home.notice.model.NoticeDTO;


@Service
public class NoticeService {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAO.class);
	
	@Autowired
	private NoticeDAO dao;
	
	public List<NoticeDTO> getAll() {
		logger.info("getAll()");
		
		List<NoticeDTO> datas = dao.selectAll();
		return datas;
	}
	
	public NoticeDTO getData(int id) {
		logger.info(" getData(id ={})", id);
		NoticeDTO data = dao.selectData(id);
		return data;
	}
	
	public int add(NoticeDTO data) {
		logger.info(" getData(data ={})", data);
		
		int seq = dao.getNextSeq();
		data.setNotId(seq);
		
		boolean result  = dao.insertData(data);
		
		if(result) {
			return data.getNotId();
		}
			return -1;
	}
	
	public boolean modify(NoticeDTO data) {
		logger.info("modify(data = {})", data);
		boolean result = dao.updateData(data);
		return result;
	}
	
	public boolean remove(NoticeDTO data) {
		logger.info("remove(data = {})", data);
		
		boolean result = dao.deleteData(data);
		
		return result;
	}
}
