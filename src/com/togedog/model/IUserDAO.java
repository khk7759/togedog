package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import com.togedog.vo.CrtDTO;
import com.togedog.vo.JobDTO;
import com.togedog.vo.UserDTO;

public interface IUserDAO
{
	public String loginUser(UserDTO dto) throws SQLException;		// 회원 로그인		
	public String loginAdmin(UserDTO dto) throws SQLException;	// 관리자 로그인
	
	public String ownAdd(UserDTO dto) throws SQLException;	// 견주 회원가입
	public String wokAdd(UserDTO dto) throws SQLException;	// 워커신청 
	public void crtAdd(UserDTO dto) throws SQLException; // 워커 자격증 등록
	public void addWorkDay(UserDTO dto) throws SQLException;	// 워커 근무가능 요일 등록
	
	public String getUserNickName(String code) throws SQLException;	// 견주 닉네임 찾기
	
	public int idCheck(String id) throws SQLException;			// 아이디 중복확인
	public int nickCheck(String nickName) throws SQLException;	// 닉네임 중복확인
	public int telCheck(String tel) throws SQLException;		// 번호 중복확인 (0807 추가)
	
	public List<UserDTO> getIntrList() throws SQLException;		// 관심사 리스트 
	public List<UserDTO> getBankList() throws SQLException;		// 은행 리스트
	public List<UserDTO> getDays() throws SQLException;			// 요일리스트 0808 추가
	
	public List<UserDTO> getSdList() throws SQLException;					// 시도 리스트
	public List<UserDTO> getSggList(String addrCd1) throws SQLException;	// 시군구 리스트
	public List<UserDTO> getDemList(String addrCd2) throws SQLException;	// 동읍면 리스트
	
	public String findUserId(UserDTO dto) throws SQLException; // 유저 아이디 모를 때 아이디 찾기 0724추가
	public String findUserPwd(UserDTO dto) throws SQLException; // 유저 비밀번호 모를 때 유저 비밀번호 찾기
	public int modifyPwd(UserDTO dto) throws SQLException; // 그리고 비밀번호 수정하기 0724 추가

	
	public List<CrtDTO> getCrtList() throws SQLException;	// 워커 자격증 리스트 0727 추가
	public List<JobDTO> getjobList() throws SQLException;	// 직업리스트 0727 추가
	
	public UserDTO getOwnInfo(String userCd) throws SQLException;	// 유저코드로 견주 정보 얻기 0728 추가
	
	public String addwok(UserDTO dto) throws SQLException;	// 워커 추가 신청 
	public String addown(UserDTO dto) throws SQLException;	// 견주 추가 신청
	
	public void updateUserType(String userCd) throws SQLException;	// 특정 유저코드의 유저타입을 견주겸워커로 수정
	
	public void insertPoint(UserDTO dto) throws SQLException;	// 포인트 등록
	
	public String getOwnCd(String id) throws SQLException;	// 아이디로 견주코드 찾기
	
	public void updateCheckList(UserDTO dto) throws SQLException;	// 견주 체크리스트 업데이트
	public void updateWokCheckList(UserDTO dto) throws SQLException;	// 워커 체크리스트 업데이트
	
	public String getUserCd(String nickName) throws SQLException;	// 닉네임으로 회원코드 찾기

	public String getWorkerName(String userCd) throws SQLException; // 회원코드로 워커 이름 찾기

	public String getWokApplyCd(String userCd) throws SQLException; // 워커 신청코드 찾기
	
	public String getCheckList(String wokApplyCd) throws SQLException;	// 워커 체크리스트 찾기
 
	public String getWokCd(String wokApplyCd) throws SQLException;	// 워커코드 찾기
	
	public UserDTO getWokInfo(String userCd) throws SQLException;	// 워커 정보 얻기
} 
