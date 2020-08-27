package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import com.togedog.vo.MatchingDTO;
import com.togedog.vo.ParamDTO;

public interface IMatchingDAO
{
	// 1차 추천 리스트
	public List<MatchingDTO> walkList1(MatchingDTO dto) throws SQLException;

	// 1차 상세 - 견주
	public List<MatchingDTO> walkDetailOwn(String walkCd) throws SQLException;
	
	// 1차 상세 - 펫
	public List<MatchingDTO> walkDetailPet(String walkCd) throws SQLException;
	
	// 1차 상세 - 펫 장애
	public List<MatchingDTO> walkDetailPetDisable(String walkCd) throws SQLException;
	
	// 1차 상세 - 펫 알러지
	public List<MatchingDTO> walkDetailPetAllerge(String walkCd) throws SQLException;
	
	// 1차 상세 - 이전 피드백
	public List<MatchingDTO> walkDetailOwnFdbItem(String walkCd) throws SQLException;
	
	// 1차 상세 - 펫 선택
	public List<MatchingDTO> walkPetSel(String code) throws SQLException;
	
	// 사용자 성별 코드로 변환 
	public String getGender(String code) throws SQLException;
	public MatchingDTO getOwn(String code) throws SQLException;
	public MatchingDTO getPet(String petCd) throws SQLException;
	
	public List<MatchingDTO> walkList2(ParamDTO dto) throws SQLException;
	
	public String matchOwnInsert(MatchingDTO dto) throws SQLException;
	public void matchPetInsert(ParamDTO dto) throws SQLException;
	
	public void matchingSel(ParamDTO dto) throws SQLException;
	public List<ParamDTO> getAgcPrice() throws SQLException;
	public List<ParamDTO> getPetSize() throws SQLException;
	public List<ParamDTO> getBasePrice() throws SQLException;
	public List<ParamDTO> getSubPrice() throws SQLException;
	public void agcInsert(MatchingDTO dto) throws SQLException;
	public void agcPetInsert(ParamDTO dto) throws SQLException;
}