package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import com.togedog.vo.MatchingDTO;
import com.togedog.vo.UserDTO;

public interface IWorkerMiaryDAO
{
	public List<MatchingDTO> getAgcApply(String wokCd) throws SQLException;				// (지금은 모든)대행신청리스트
	public MatchingDTO getAgcDetail(String agcCd) throws SQLException;		// 대행신청 상세정보
	public List<MatchingDTO> waitingAgc(String wokCd) throws SQLException;	// 워커가 선택하고 견주선택 대기 리스트 
	public List<UserDTO> getWorkdays(String wokApplyCd) throws SQLException;// 워커 근무
	public void insertAGCSel(MatchingDTO dto) throws SQLException;				// 워커가 대행건 선택 
	
}
