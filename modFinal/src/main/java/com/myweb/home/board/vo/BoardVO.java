package com.myweb.home.board.vo;

import java.sql.Date;

public class BoardVO {
	
		private int bId;
		private String bTitle;
		private String bContent;
		private int cateId;
		private String dealMethod;
		private int price;
		private String pCondition;
		
		
		public int getbId() {
			return bId;
		}
		public void setbId(int bId) {
			this.bId = bId;
		}
		public String getbTitle() {
			return bTitle;
		}
		public void setbTitle(String bTitle) {
			this.bTitle = bTitle;
		}
		public String getbContent() {
			return bContent;
		}
		public void setbContent(String bContent) {
			this.bContent = bContent;
		}
		
		public int getCateId() {
			return cateId;
		}
		public void setCateId(int cateId) {
			this.cateId = cateId;
		}
		public String getDealMethod() {
			return dealMethod;
		}
		public void setDealMethod(String dealMethod) {
			this.dealMethod = dealMethod;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getpCondition() {
			return pCondition;
		}
		public void setpCondition(String pCondition) {
			this.pCondition = pCondition;
		}
		
		@Override
		public String toString() {
			return "BoardVO [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", cateId=" + cateId
					+ ", dealMethod=" + dealMethod + ", price=" + price + ", pCondition=" + pCondition + "]";
		}
		
		
		
	}

