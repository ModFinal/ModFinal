package com.myweb.home.info.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAO {

	
private static final Logger logger = LoggerFactory.getLogger(InfoDAO.class);
	
	@Autowired
	private SqlSession session;
	
	private String mapper = "InfoMapper.%s";
	
	public InfoDTO selectProfile(String id) {
		String mapperId = String.format(mapper, "selectUserDatas");
		InfoDTO res  = session.selectOne(mapperId, id);
		
		logger.info("selectProfile(id= {})", id);
		
		return res;
		
	}
	
	public InfoDTO selectProfilePhoto(String id) {
		String mapperId = String.format(mapper, "selectUserPhoto");
		InfoDTO res  = session.selectOne(mapperId, id);
		
		logger.info("selectProfile(id= {})", id);
		
		return res;
		
	}
	
	public InfoDTO selectPurchase(String id) {
		String mapperId = String.format(mapper, "selectPurchaseCount");
		InfoDTO res = session.selectOne(mapperId, id);
		
		return res;
	}
	
	public List<InfoDTO> selectBuyList(String id) {
		logger.info("selectBuyList(id= {})", id);
		String mapperId = String.format(mapper, "selectShoppingList");
		List<InfoDTO> res = session.selectList(mapperId, id);
		
		return res;
		
	}
	
	public List<InfoDTO> selectLikeList(String id) {
		String mapperId = String.format(mapper, "selectFavoriteList");
		List<InfoDTO> res = session.selectList(mapperId, id);
		
		return res;
		
	}
	
	public List<InfoDTO> selectSaleList(String id) {
		String mapperId = String.format(mapper, "selectSellingList");
		List<InfoDTO> res = session.selectList(mapperId, id);
		
		return res;
		
	}
	
	public InfoDTO selectStoreProfile(String id) {
		String mapperId = String.format(mapper, "selectMystoreProfile");
		InfoDTO res  = session.selectOne(mapperId, id);
		
		return res;
	}
	
	public InfoDTO selectSellCount(String id) {
		logger.info("selectSellCountt(id= {})", id);
		String mapperId = String.format(mapper, "selectSellNum");
		InfoDTO res = session.selectOne(mapperId, id);
		
		return res;
	}
	
	public boolean updateVisitCnt(InfoDTO data) {
		logger.info("updateVisitCnt(data= {})", data);
		String mapperId = String.format(mapper, "updateVisitCnt");
		int res = session.update(mapperId, data);
		
		return res == 1 ? true : false;
	}
	
	public ProfileStaticsDTO selectStatics(ProfileStaticsDTO data) {
		logger.info("selectStatics(data= {})", data);
		String mapperId = String.format(mapper, "selectStatics");
		ProfileStaticsDTO res = session.selectOne(mapperId, data);
		return res;
	}
	
	public boolean insertStatics(ProfileStaticsDTO data) {
		logger.info("insertStatics(data= {})", data);
		String mapperId = String.format(mapper, "insertStatics");
		int res = session.insert(mapperId, data);
		return res == 1 ? true : false;
	}
	
	public boolean updateStatics(ProfileStaticsDTO data) {
		logger.info("updateStatics(data= {})", data);
		String mapperId = String.format(mapper, "updateStatics");
		int res = session.update(mapperId, data);
		return res == 1 ? true : false;
	}
	
	

}
