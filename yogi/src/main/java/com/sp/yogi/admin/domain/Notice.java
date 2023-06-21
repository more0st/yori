package com.sp.yogi.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private long noticeNum;
	private String userId;
	private String userName;
	private String subject;
	private String content;
	private String reg_date;
	private int hitCount;
	private int notice;
	private int showNotice;

	private long imgNum;
	private String imgFileName;
	private int fileCount;

	// 스프링에서 파일 받기
	private List<MultipartFile> selectFile; // <input type="file" name="selectFile"
	private long gap;

	public long getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(long noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getShowNotice() {
		return showNotice;
	}

	public void setShowNotice(int showNotice) {
		this.showNotice = showNotice;
	}

	public long getImgNum() {
		return imgNum;
	}

	public void setImgNum(long imgNum) {
		this.imgNum = imgNum;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}
}
