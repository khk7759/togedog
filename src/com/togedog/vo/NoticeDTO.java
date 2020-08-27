package com.togedog.vo;

public class NoticeDTO 
{
	private int notiCd1; // substr('NOTI' || SEQ.NEXTVAL) 한 거
	private String notiCd2; // 'NOTI' || SEQ.NEXTVAL
	private String adminCd, adminName; 
	private String title, content, insDate, fileName;
	private int views;
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getAdminName()
	{
		return adminName;
	}
	
	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}
	
	public int getNotiCd1()
	{
		return notiCd1;
	}
	public void setNotiCd1(int notiCd1)
	{
		this.notiCd1 = notiCd1;
	}
	
	public String getNotiCd2()
	{
		return notiCd2;
	}
	public void setNotiCd2(String notiCd2)
	{
		this.notiCd2 = notiCd2;
	}
	public String getAdminCd()
	{
		return adminCd;
	}
	public void setAdminCd(String adminCd)
	{
		this.adminCd = adminCd;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getInsDate()
	{
		return insDate;
	}
	public void setInsDate(String insDate)
	{
		this.insDate = insDate;
	}
	public int getViews()
	{
		return views;
	}
	public void setViews(int views)
	{
		this.views = views;
	}
	
	
}