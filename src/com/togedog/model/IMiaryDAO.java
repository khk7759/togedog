package com.togedog.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.togedog.vo.FeedbackDTO;
import com.togedog.vo.MatchingDTO;
import com.togedog.vo.NoteDTO;
import com.togedog.vo.ParamDTO;
import com.togedog.vo.PetDTO;
import com.togedog.vo.RecordDTO;
import com.togedog.vo.ScheduleDTO;
import com.togedog.vo.UserDTO;
import com.togedog.vo.WeatherDTO;

public interface IMiaryDAO
{
	public UserDTO getOwnInfo(String code) throws SQLException;	// 견주 정보 가져오기
	public String getOwnCode(String code) throws SQLException;	// 견주 코드 가져오기
	public String agcToWorker(String code) throws SQLException;	// 워커 코드 가져오기
	public String agcSelToAgc(String code) throws SQLException; // 대행 코드 가져오기
	
	// 매칭 → 산책 탭 → 받은 산책 ---------------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> walkReceive(String code) throws SQLException;					// 받은 산책 신청 리스트
	public MatchingDTO walkReceiveDetailOwn(String walkCd) throws SQLException;				// 받은 산책 신청 리스트 상세내역 견주
	public List<MatchingDTO> walkReceiveDetailPet(String walkCd) throws SQLException;		// 받은 산책 신청 리스트 상세내역 펫
	public List<MatchingDTO> walkReceiveDetailOwnFdb(MatchingDTO dto) throws SQLException;	// 받은 산책 신청 리스트 상세내역 이전 피드백 내역	
	
	// 매칭 → 산책 탭 → 보낸 산책 ---------------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> walkSend(String code) throws SQLException;					// 보낸 산책 신청 리스트
	public MatchingDTO walkSendDetailOwn(MatchingDTO dto) throws SQLException;			// 보낸 산책 신청 리스트 상세내역 견주
	public void ownWalkLastInsert(MatchingDTO dto) throws SQLException;					// 신청 수락
	
	public void ownWalkLastDelete(String code) throws SQLException;						// 신청 거절
	public void ownWalkDelete(MatchingDTO dto) throws SQLException;						// 매칭 취소
	
	// 매칭 → 산책 탭 → 최종 매칭 ---------------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> getLastWalkInfo(String userCd) throws SQLException; // 산책매칭완료 리스트
	// 최종매칭리스트 견주상세정보 0729 추가
	@Mapper
	public List<MatchingDTO> getWalkLastOwnDetail(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
	// 최종매칭리스트 펫 상세정보 
	@Mapper
	public List<PetDTO> getWalkLastPetDetail(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
	//최종매칭리스트 장애 상세정보
	@Mapper
	public List<PetDTO> getWalkLastDisaDetail(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
	//최종매칭리스트 장애 상세정보
	@Mapper
	public List<PetDTO> getWalkLastAlleDetail(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
	//최종매칭리스트 이전 피드백정보 상세정보
	@Mapper
	public List<FeedbackDTO> getBeforeFdbInfo(@Param("userCd") String userCd, @Param("walkLastCd") String walkLastCd) throws SQLException;
	
	// 매칭 → 대행 탭 → 워커 리스트 --------------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> agcReceive(String code) throws SQLException;		// 받은 워커 신청 리스트
	public MatchingDTO agcWorkerDetail(String code) throws SQLException;		// 받은 워커 상세내역
	public List<MatchingDTO> agcSelPet(String code) throws SQLException;		// 대행 참여 강아지
	public List<MatchingDTO> agcWokFdb(UserDTO dto) throws SQLException;		// 이전 피드백 내역
	public String agcMsg(String code) throws SQLException;						// 신청 메세지
	
	public void agcOk(String code) throws SQLException;							// 워커 수락
	public void agcNo(String code) throws SQLException;							// 워커 거절
	
	// 매칭 → 대행 탭 → 대행 신청 리스트 -----------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> agcApply(String code) throws SQLException;			// 대행 신청 리스트
	public MatchingDTO agcInfo(String code) throws SQLException;				// 대행 신청 정보
	
	public void agcPetDelete(String code) throws SQLException;					// 대행 취소 → 대행 펫 선택 삭제
	public void agcCancel(String code) throws SQLException;						// 대행 취소 → 대행 등록 삭제
	
	// 매칭 → 대행 탭 → 대행매칭 완료 -------------------------------------------------------------------------------------------------------------------
	public List<MatchingDTO> agcLastList(String code) throws SQLException;		// 대행 최종 리스트
	
	public void agcLastCancel(String code) throws SQLException;					// 대행 취소
	
	// 기록 ------------------------------------------------------------------------------------------------------------------------------------
	public String recToAcc(String recCd) throws SQLException;					// 기록 코드 → 가계부 코드
	public String recToSchItem(String recCd) throws SQLException;				// 기록 코드 → 일정 항목 코드
	
	public List<RecordDTO> recList(String userCd) throws SQLException;			// 기록 리스트
	public RecordDTO recArticle(String recCd) throws SQLException;				// 기록 게시글 보기
	public List<RecordDTO> recArticleAcc(String recCd) throws SQLException;		// 기록 게시글 가계부 내역
	
	public void recDelete(RecordDTO dto) throws SQLException;					// 기록 삭제
	public void accDelete(String accCd) throws SQLException;					// 가계부 삭제
	public void accInfoDelete(String accCd) throws SQLException;				// 가계부 항목 삭제
	
	// 캘린더 -----------------------------------------------------------------------------------------------------------------------------------
	public List<ScheduleDTO> getSchItem() throws SQLException;				// 일정
	
	public List<ParamDTO> getSchList(ParamDTO dto) throws SQLException;		// 캘린더
	public void ownCalUpdate(ParamDTO dto) throws SQLException;				// 날짜 이동
	public List<ParamDTO> ownCalList(ParamDTO dto) throws SQLException;		// 일정 리스트
	
	public List<WeatherDTO> getWeatherList() throws SQLException; 			// 날씨리스트(임시)
	public void insertSch(ScheduleDTO dto) throws SQLException; 			// 캘린더 일정추가 버튼 통한 일정 등록
	
	// 알림 ------------------------------------------------------------------------------------------------------------------------------------
	public int notiCount(String code) throws SQLException;	// 알림 개수
	
	// 쪽지 ------------------------------------------------------------------------------------------------------------------------------------
	public int noteCount(String code) throws SQLException;					// 쪽지 개수
	public List<NoteDTO> getNoteList(String userCd) throws SQLException;	// 쪽지리스트
	public void sendNote(NoteDTO note) throws SQLException;					// 쪽지 보내기
	public void deleteNote(String noteCd) throws SQLException;				// 쪽지 삭제
	public NoteDTO getNote(String noteCd) throws SQLException;				// 하나의 쪽지
	
}
