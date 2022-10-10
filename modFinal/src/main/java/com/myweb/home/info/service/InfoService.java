package com.myweb.home.info.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.myweb.home.info.model.InfoDAO;
import com.myweb.home.info.model.InfoDTO;
import com.myweb.home.info.model.ProfileStaticsDTO;
import com.myweb.home.login.model.AccountDTO;
import com.myweb.home.main.model.MainDAO;
import com.myweb.home.main.model.MainDTO;


@Service
public class InfoService {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoDAO.class);
	
	@Autowired
	private InfoDAO dao;
	

	public InfoDTO getUserInfo(String id) {
		InfoDTO data = dao.selectProfile(id);
		
		return data;	
	}
	public InfoDTO getUserPhoto(String id) {
		InfoDTO data = dao.selectProfilePhoto(id);
		
		return data;
		
	}
	
	public InfoDTO getUserPurchase(String id) {
		InfoDTO data = dao.selectPurchase(id);
		
		return data;
		
	}
	
	public List<InfoDTO> getPurchaseList(String id) {
		logger.info("getShoppingDetail(id= {})", id);
		List<InfoDTO> datas = dao.selectBuyList(id);
		
		return datas;
	}
	
	public List<InfoDTO> getFavoriteList(String id) {
		List<InfoDTO> datas = dao.selectLikeList(id);
		
		return datas;
	}
	
	public InfoDTO getMyStoreInfo(String id) {
		InfoDTO data = dao.selectStoreProfile(id);
		
		return data;	
	}
	
	public InfoDTO getUserSelling(String id) {
		logger.info("getUserSelling(id= {})", id);
		InfoDTO data = dao.selectSellCount(id);
		
		return data;
	}
	
	public List<InfoDTO> getSellList(String id) {
		List<InfoDTO> datas = dao.selectSaleList(id);
		
		return datas;
	}
	
	@Transactional
	public void incVisitCnt(HttpSession session, InfoDTO data) {
		logger.info("incVisitCnt(session= {}, data= {})", session, data);
		ProfileStaticsDTO staticsData = new ProfileStaticsDTO();
		staticsData.setAccId(((AccountDTO)session.getAttribute("loginData")).getAccountid());
		
		staticsData = dao.selectStatics(staticsData);
		
		boolean result = false;
		if(staticsData == null) {
			result = dao.updateVisitCnt(data);
			if(!result) {
				throw new RuntimeException("조회수 통계 업데이트 처리에 문제가 발생 하였습니다.");
			}
			
			staticsData = new ProfileStaticsDTO();
			staticsData.setAccId(((AccountDTO)session.getAttribute("loginData")).getAccountid());
			result = dao.insertStatics(staticsData);
			if(!result) {
				throw new RuntimeException("조회수 통계 추가 처리에 문제가 발생 하였습니다.");
			}
		} else {
			long timeDiff = new Date().getTime() - staticsData.getLatestVisit().getTime();
			if(timeDiff / (1000 * 60 * 60 * 24) >= 7) {
				result = dao.updateVisitCnt(data);
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
			data.setVisitCnt(data.getVisitCnt() + 1);
		}
	
	
	}
	
	
}
