package com.togedog.model;

import java.sql.SQLException;

import com.togedog.vo.UserDTO;

public interface IMainDAO
{
	// 산책 펫 수
	public int getWalkPetCount() throws SQLException;

	// 대행 펫 수
	public int getAgcPetCount() throws SQLException;
	
	// 누적 견주 수
	public int getOwnCount() throws SQLException;
	
	// 누적 펫 수
	public int getPetCount() throws SQLException;
	
	// 누적 워커 수
	public int getWokCount() throws SQLException;
	
	// 누적 그룹 수
	//public int getGroupCount() throws SQLException;
	
	// 메인 마이정보 수정 
	public void updateMainMyInfo(UserDTO dto) throws SQLException;
	
	// 회원 기존 비밀번호와 같은지
	public String pwCheck(String beforePwd) throws SQLException;
	
	// 회원 탈퇴
	public void insertUserBye(String userCd) throws SQLException;
}
