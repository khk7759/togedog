package com.togedog.util;

import java.util.regex.Pattern;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;

public class MyUtil
{
	// 문자열의 내용중 원하는 문자열을 다른 문자열로 변환
	// String str = replaceAll(str, "\r\n", "<br>"); // 엔터를 <br>로 변환
	public String replaceAll(String str, String oldStr, String newStr)
	{
		if (str == null || str.equals(""))
			return "";

		Pattern p = Pattern.compile(oldStr);
		Matcher m = p.matcher(str);

		StringBuffer sb = new StringBuffer();

		while (m.find())
		{
			m.appendReplacement(sb, newStr);
		}
		m.appendTail(sb);

		return sb.toString();
	}


	// 전체페이지수 구하기
		/* param :
		 *     numPerPage : 한페이지에 표시할 데이터의 개수
		 *     dataCount : 전체데이터수
		 */
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;

		pageCount = dataCount / numPerPage;
		if (dataCount % numPerPage != 0)
			pageCount++;

		//System.out.println("MyUtil.getPageCount.pageCount : " + pageCount);
		
		return pageCount;
	}

	// 페이지 처리 메소드(GET 방식)
		/*
		 * param:
		 *     current_page : 현재 표시할 페이지
		 *     total_page : 전체페이지수
		 *     list_url : 링크를 설정할 url
		 */

	public String pageIndexList(int current_page, int total_page, String list_url)
	{
		if (current_page < 1 || total_page < 1)
			return "";

		StringBuffer sb = new StringBuffer();
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;

		if (list_url.indexOf("?") != -1)
			list_url = list_url + "&";
		else
			list_url = list_url + "?";

		// currentPageSetup : 표시할첫페이지-1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		if (current_page % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		// 1 페이지, [Prev]:10 페이지를 이전페이지로 이동
		n = current_page - numPerBlock;
		if (total_page > numPerBlock && currentPageSetup > 0)
		{
			sb.append("<li class='page-item'><a class='page-link' href='" + list_url + "pageNum=1'>1</a></li>");
			sb.append("<li class='page-item'><a class='page-link' href='" + list_url + "pageNum=" + n + "'>Prev</a></li>");
		}
		
		// 바로가기 페이지
		page = currentPageSetup + 1;
		while (page <= total_page && (page <= currentPageSetup + numPerBlock))
		{
			if (page == current_page)
			{
				sb.append("<li class='page-item active'><a class='page-link'>" + page + "</a></li>");
			} else
			{
				sb.append("<li class='page-item'><a class='page-link' href='" + list_url + "pageNum=" + page + "'>" + page + "</a></li>");
			}
			page++;
		}

		// [Next]:10페이지를 다음페이지로 이동, 마지막 페이지
		n = current_page + numPerBlock;
		if (total_page - currentPageSetup > numPerBlock)
		{
			sb.append("<li class='page-item'><a class='page-link' href='" + list_url + "pageNum=" + n + "'>Next</a></li>");
			sb.append("<li class='page-item'><a class='page-link' href='" + list_url + "pageNum=" + total_page + "'>" + total_page + "</a></li>");
		}

		return sb.toString();
	}
	
	// 요일 얻는 메소드 
	public String getDateDay(String date) throws Exception 
	{
	     
	   String day = "" ;
	     
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
	     
	   Calendar cal = Calendar.getInstance() ;
	   cal.setTime((Date)dateFormat.parse(date));  
	    
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK);
	    
	    switch(dayNum){
	        case 1:
	            day = "DI7"; // 일
	            break ;
	        case 2:
	            day = "DI1"; // 월 
	            break ;
	        case 3:
	            day = "DI2";// 화
	            break ;
	        case 4:
	            day = "DI3";// 수
	            break ;
	        case 5:
	            day = "DI4";// 목
	            break ;
	        case 6:
	            day = "DI5";//금
	            break ;
	        case 7:
	            day = "DI6";// 토
	            break ;
	             
	    }
	    
	    return day ;
	}



}
