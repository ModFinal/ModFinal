package com.myweb.home.upload.vo;

public class PhotoUploadVO {
	
	private int bId;
	private String uuidName;
	private String fileName;
	private long fileSize;
	private String fileType;
	
	
	
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getUuidName() {
		return uuidName;
	}
	
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public long getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	public String getFileType() {
		return fileType;
	}
	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	@Override
	public String toString() {
		return "PhotoUploadVO [bId=" + bId + ", uuidName=" + uuidName + ", fileName=" + fileName + ", fileSize="
				+ fileSize + ", fileType=" + fileType + "]";
	}
	
	

}
