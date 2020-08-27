package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.togedog.vo.NoticeDTO;

public interface INoticeDAO 
{
	// 메인 공지사항 리스트 뽑아내는 함수
	public List<NoticeDTO> mainNoticeList() throws SQLException;
	
	// 공지사항 리스트 뽑아내는 함수
	// 추가적으로 페이징 처리와 검색 처리를 위해 매개변수를 넣어준다 200807
	public List<NoticeDTO> noticeList(@Param("searchValue")String searchValue, @Param("start")int start, @Param("end")int end) throws SQLException;
	
	// 메인 공지사항 상세보기를 뽑아내는 함수 (0727 추가)
	public NoticeDTO noticeArticle(String notiCd) throws SQLException;
	
	// 공지사항 상세보기를 누르면 올라가는 조회수 카운트 함수 (0727 추가)
	public int viewCount(String notiCd) throws SQLException;
	
	// 게시물 상세보기 안에서 다음 게시물 번호를 얻어오는 함수 (0727 추가)
	public int getNextNum(String notiCd2) throws SQLException;
	
	// 게시물 상세보기 안에서 이전 게시물 번호 얻어오는 함수 (0727 추가)
	public int getBeforeNum(String notiCd2) throws SQLException;
	
	// 페이징 처리하기 시작 200806
	// 전체 게시물 개수 얻어오는 함수
	public int getTotalNum(@Param("searchValue") String searchValue) throws SQLException;
}