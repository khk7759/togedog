package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import com.togedog.vo.NoticeDTO;
import com.togedog.vo.UserDTO;

public interface IAdminDAO
{
	// 올해 산책 매칭  횟수
	public int yearWalkLastCount() throws SQLException;
	
	// 이번달 산책 매칭  횟수
	public int monthWalkLastCount() throws SQLException;
	
	// 올해 산책 매칭  횟수
	public int yearAgcLastCount() throws SQLException;
	
	// 이번달 산책 매칭  횟수
	public int monthAgcLastCount() throws SQLException;
	
	// 올해 산책 매칭  횟수
	public int yearUserCount() throws SQLException;
	
	// 이번달 산책 매칭  횟수
	public int monthUserCount() throws SQLException;
	
	
	
	// 관리자 정보
	public UserDTO adminInfo(String adminCd) throws SQLException;
	
	// 관리자 정보 수정
	public void adminInfoUpdate(UserDTO dto) throws SQLException;
	
	// 관리자 비밀번호 확인
	public String adminPw(String code) throws SQLException;
	
	// 관리자 비밀번호 확인 → 입력된 pw 암호화하여 비교하기
	public String adminUserPw(String pw) throws SQLException;
	
	// 관리자 비밀번호 수정
	public void adminPwUpdate(UserDTO dto) throws SQLException;
	
	
	
	// 공지사항 리스트
	public List<NoticeDTO> adminNoticeList() throws SQLException;
	
	// 공지사항 게시물
	public NoticeDTO adminNoticeArticle(String notiCd) throws SQLException;
	
	// 공지사항 글쓰기
	public void noticeInsert(NoticeDTO dto) throws SQLException;
	
	// 공지사항 삭제
	public void noticeDelete(String notiCd) throws SQLException;
	
	// 공지사항 수정
	public void noticeUpdate(NoticeDTO dto) throws SQLException;
	
	
	
	// 견주 리스트
	public List<UserDTO> ownerList() throws SQLException;
	
	// 견주 상세 정보
	public UserDTO ownerDetail(String userCd) throws SQLException;
	
	// 견주 상세 정보 → 공유 회원 리스트
	public List<UserDTO> ownerShareUser(String userCd) throws SQLException;
	
	// 견주 상세 정보 → 소유 펫 리스트
	public List<UserDTO> ownerSharePet(String userCd) throws SQLException;
	
	// 워커 리스트
	public List<UserDTO> workerList() throws SQLException;
	
	// 워커 상세 정보
	public UserDTO workerDetail(String workerCd) throws SQLException;
	
	// 활동 정지 동작
	public void stopTermInsert(UserDTO dto) throws SQLException;
	
	// 강제탈퇴 사유 리스트
	public List<UserDTO> blkItem() throws SQLException;
	
	// 활동 정지 동작
	public void blkInsert(UserDTO dto) throws SQLException;
	
	
	
	// 탈퇴회원 → 견주 리스트
	public List<UserDTO> userByeOwnerList() throws SQLException;
	
	// 탈퇴회원 → 워커 리스트
	public List<UserDTO> userByeWorkerList() throws SQLException;
	
	
	
	// 활동 정지 회원 리스트
	public List<UserDTO> userStopList() throws SQLException;
	
	// 활동 정지 해제
	public void userStopDone(String code) throws SQLException;

	
	
	// 강제탈퇴 회원 리스트
	public List<UserDTO> blackList() throws SQLException;
	
	// 블랙리스트 삭제
	public void blackDelete(String code) throws SQLException;
	
	
	
	// 관리자 리스트
	public List<UserDTO> adminList() throws SQLException;
	
	// 관리자 리스트
	public void adminInsert(UserDTO dto) throws SQLException;
	
	// 관리자 비밀번호 초기화
	public void adminPwReset(UserDTO dto) throws SQLException;
	
	// 관리자 삭제
	public void adminDelete(String id) throws SQLException;
	
	
	
	// 워커 신청 리스트
	public List<UserDTO> workerApplyList() throws SQLException;
	
	// 워커 상세 정보
	public UserDTO workerApplyDetail(String workerCd) throws SQLException;
	
	// 워커 자격증 리스트
	public List<UserDTO> workerCrtList(String workerCd) throws SQLException;
	
	// 워커 근무선호 요일 리스트
	public List<UserDTO> workerPsbList(String workerCd) throws SQLException;
	
	// 워커 근무선호 요일 리스트
	public List<UserDTO> workerNoItemList() throws SQLException;
	
	// 워커 등록
	public void workerok(UserDTO dto) throws SQLException;
	
	// 워커 거절
	public void workerno(UserDTO dto) throws SQLException;
}
