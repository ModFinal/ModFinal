package com.myweb.home.board.model;

import java.sql.Date;

public class ReviewDTO {
		
		      private  int    id;
		      private  int    bId;
	          private  String accountId;
	          private  String content;
	          private  Date   createDate;
	          private  int    starScore;
	          private  boolean  deleted;
	          private  boolean  hidden;
	          
	          
	          
			public int getId() {
				return id;
			}
		
			public void setId(int id) {
				this.id = id;
			}
			public int getbId() {
				return bId;
			}
			public void setbId(int bId) {
				this.bId = bId;
			}
			public String getAccountId() {
				return accountId;
			}
			public void setAccountId(String accountId) {
				this.accountId = accountId;
			}
			public String getContent() {
				return content;
			}
			public void setContent(String content) {
				this.content = content;
			}
			public Date getCreateDate() {
				return createDate;
			}
			public void setCreateDate(Date createDate) {
				this.createDate = createDate;
			}
			public int getStarScore() {
				return starScore;
			}
			public void setStarScore(int starScore) {
				this.starScore = starScore;
			}
			public boolean isDeleted() {
				return deleted;
			}
			public void setDeleted(boolean deleted) {
				this.deleted = deleted;
			}
			public boolean isHidden() {
				return hidden;
			}
			public void setHidden(boolean hidden) {
				this.hidden = hidden;
			}
			
			@Override
			public String toString() {
				return "ReviewDTO [id=" + id + ", bId=" + bId + ", accountId=" + accountId + ", content=" + content
						+ ", createDate=" + createDate + ", starScore=" + starScore + ", deleted=" + deleted
						+ ", hidden=" + hidden + "]";
			}
	          
	     
}
