<%@page import="com.togedog.vo.ParamDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
	List<ParamDTO> list = (List)request.getAttribute("schList");

	//for(int i = 0; i < list.size(); i++)
		//System.out.println(list.get(i).getSchDate() + " : " + list.get(i).getSchCd() + " : " + list.get(i).getItem());
	
	String Year = (String)request.getAttribute("year");
	String Month = request.getAttribute("month").toString();
	
	int year = Integer.parseInt(Year);
	int month = Integer.parseInt(Month);
	
	int days[] = {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int tot = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400 + 1;
	
	days[1] = year % 4 == 0 ? year % 100 == 0 ? year % 400 == 0 ? 29 : 28 : 29 : 28;
	
	for(int i = 0; i < month - 1; i++)
		tot += days[i];
	
	int week = tot % 7;

	StringBuffer html = new StringBuffer();
	
	for(int i = 1; i <= days[month - 1] + week; i++)
	{	
		if(i % 7 == 1)
			html.append("<tr>");
		
		if(i <= week)
			html.append("<td></td>");
		else
			{
				html.append("<td class='shower");
				
				if(i % 7 == 0)
					html.append(" sat");
				else if(i % 7 == 1)
					html.append(" sun");
				
				html.append("'>" + (i - week));
				
				for(int j = 0; j < list.size(); j++)
				{
					if(list.get(j).getSchDate() == (i - week))
					{
						switch(list.get(j).getItem())
						{
							case "산책" : html.append(String.format("<div class='walk'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd())); break;
							case "교육" : html.append(String.format("<div class='edu'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd())); break;
							case "미용" : html.append(String.format("<div class='but'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd())); break;
							case "건강" : html.append(String.format("<div class='hel'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd())); break;
							case "용품" : html.append(String.format("<div class='sup'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd())); break;
							case "기타" : html.append(String.format("<div class='etc'><input type='hidden' value='%s'/></div>", list.get(j).getSchCd()));
						}
					}
				}
					
				html.append("</td>");
			}
		
		if(i % 7 == 0)
			html.append("</tr>");	
	}
	
	if((days[month - 1] + week) % 7 != 0)
	{
		for(int i = 0; i < 7 - (days[month - 1] + week) % 7; i++)
			html.append("<td></td>");
		html.append("</tr>");		
	}
%>
<%=html.toString() %>