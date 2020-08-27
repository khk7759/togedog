package com.togedog.vo;

public class VacDTO
{
	private String vacCd;	// 예방접종 코드
	private String vacItem;	// 예방접종명
	private int period;		// 접종주기(주단위)
	private String date;	// 접종일, 등록일..
	
	public String getVacCd()
	{
		return vacCd;
	}
	public void setVacCd(String vacCd)
	{
		this.vacCd = vacCd;
	}
	public String getVacItem()
	{
		return vacItem;
	}
	public void setVacItem(String vacItem)
	{
		this.vacItem = vacItem;
	}
	public int getPeriod()
	{
		return period;
	}
	public void setPeriod(int period)
	{
		this.period = period;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	
}
