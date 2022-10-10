package com.myweb.home.upload.model;

public class PhotoUploadDTO {
	
	private int fileId;
	private int bId;
	private String accId;
	private String uuidName;
	private String fileName;
	private String location;
	private String url;
	private long fileSize;
	private String fileType;
	
	public PhotoUploadDTO() {}
	
	public PhotoUploadDTO(int bId, String location, String url) {
		this.bId = bId;
		this.location = location;
		this.url = url;
	}
	
	public PhotoUploadDTO(String accId, String location, String url) {
		this.accId = accId;
		this.location = location;
		this.url = url;
	}
	
	public int getFileId() {
		return fileId;
	}
	
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	
	public int getbId() {
		return bId;
	}
	
	public void setbId(int bId) {
		this.bId = bId;
	}
	
	public String getAccId() {
		return accId;
	}
	
	public void setAccId(String accId) {
		this.accId = accId;
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

	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
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
		return "PhotoUploadDTO [fileId=" + fileId + ", bId=" + bId + ", accId=" + accId + ", uuidName=" + uuidName
				+ ", fileName=" + fileName + ", location=" + location + ", url=" + url + ", fileSize=" + fileSize
				+ ", fileType=" + fileType + "]";
	}
	
	

}
