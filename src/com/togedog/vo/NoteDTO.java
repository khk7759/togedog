package com.togedog.vo;

public class NoteDTO
{
	private String noteCd;		// 쪽지 코드
	private String userCd;		// 보낸사람 회원코드
	private String userCd2; 	// 받은사람 회원코드
	private String title;		// 쪽지제목
	private String content;		// 쪽지 내용
	private String sDelDate;	// 보낸사람이 삭제한 날짜
	private String rDelDate;	// 받은사람이 삭제한 날짜
	private String openDate;	// 받은사람이 본 열람일
	private String insDate;		// 쪽지 받은 날짜 
	
	private String nickName;	// 닉네임
	
	private String searchValue;	// 검색키워드
	
	
	public String getNoteCd()
	{
		return noteCd;
	}
	public void setNoteCd(String noteCd)
	{
		this.noteCd = noteCd;
	}
	public String getUserCd()
	{
		return userCd;
	}
	public void setUserCd(String userCd)
	{
		this.userCd = userCd;
	}
	public String getUserCd2()
	{
		return userCd2;
	}
	public void setUserCd2(String userCd2)
	{
		this.userCd2 = userCd2;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getsDelDate()
	{
		return sDelDate;
	}
	public void setsDelDate(String sDelDate)
	{
		this.sDelDate = sDelDate;
	}
	public String getrDelDate()
	{
		return rDelDate;
	}
	public void setrDelDate(String rDelDate)
	{
		this.rDelDate = rDelDate;
	}
	public String getOpenDate()
	{
		return openDate;
	}
	public void setOpenDate(String openDate)
	{
		this.openDate = openDate;
	}
	public String getInsDate()
	{
		return insDate;
	}
	public void setInsDate(String insDate)
	{
		this.insDate = insDate;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getSearchValue()
	{
		return searchValue;
	}
	public void setSearchValue(String searchValue)
	{
		this.searchValue = searchValue;
	}
	
	
}
