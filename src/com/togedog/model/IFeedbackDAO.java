package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.togedog.vo.FeedbackDTO;

public interface IFeedbackDAO
{
	// 강아지 피드백 리스트를 뽑아내는 함수
	public List<FeedbackDTO> dogFeedbackList() throws SQLException;
	
	// 견주 피드백 리스트를 뽑아내는 함수
	public List<FeedbackDTO> ownFeedbackList() throws SQLException;
	
	// 워커 피드백 리스트를 뽑아내는 함수
	public List<FeedbackDTO> wokFeedbackList() throws SQLException;
	
	// 해당하는 펫을 데리고 오는 함수
	public List<FeedbackDTO> getPetName(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
}
