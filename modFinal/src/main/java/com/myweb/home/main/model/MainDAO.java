package com.myweb.home.main.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MainDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MainDAO.class);
	
	@Autowired
	private SqlSession session;
	
	private String mapper = "mainMapper.%s";
	
	public List<MainDTO> selectAll() {
		
		String mapperId = String.format(mapper, "selectDatas");
		List<MainDTO> res = session.selectList(mapperId);
		
		logger.info("selectAll()");
		
		return res;
		
	}
	
	public List<MainDTO> selectCate(int id) {
		String mapperId = String.format(mapper, "selectCateDatas");
		List<MainDTO> res  = session.selectList(mapperId, id);
		
		logger.info("selectCate(id= {})", id);
		
		return res;
		
	}
	
	public MainDTO selectCateTitle(int id) {
		String mapperId = String.format(mapper, "selectCateName");
		MainDTO res = session.selectOne(mapperId, id);
		return res;
	}

	
	
	
	
	
	
	
	
}
