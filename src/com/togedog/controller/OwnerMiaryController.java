package com.togedog.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.togedog.model.IFeedbackDAO;
import com.togedog.model.IMatchingDAO;
import com.togedog.model.IMiaryDAO;
import com.togedog.model.IUserDAO;
import com.togedog.vo.FeedbackDTO;
import com.togedog.vo.MatchingDTO;
import com.togedog.vo.NoteDTO;
import com.togedog.vo.ParamDTO;
import com.togedog.vo.PetDTO;
import com.togedog.vo.RecordDTO;
import com.togedog.vo.ScheduleDTO;
import com.togedog.vo.UserDTO;
import com.togedog.vo.WeatherDTO;

@Controller
public class OwnerMiaryController
{
	@Autowired
	private SqlSession sqlSession;

	// 메인
	// ------------------------------------------------------------------------------------------------------------

	// 체크리스트 업데이트
	@RequestMapping(value="/updateCheckList.action", method = RequestMethod.GET)
	public String updateCheckList(HttpServletRequest request) throws SQLException
	{
		// 세션에서 회원코드 얻기
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		String userCd = dto.getCode();
		
		// 수신한 값 담기
		String checkList = request.getParameter("checkList");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setCode(userCd);
		userDTO.setCheckList(checkList); 
		
		// 업데이트 시키기
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		dao.updateCheckList(userDTO);
		
		String result = userDTO.getCheckList();
		
		request.setAttribute("result", result);
		
		return "/WEB-INF/views/ajax.jsp";
	}

	// 견주 마이어리 메인화면
	@RequestMapping(value = "ownermiarymain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String MiaryOwnerMainForm(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		IUserDAO userDao = sqlSession.getMapper(IUserDAO.class);
		
		
		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");
		String userCd = dto.getCode();
		
		UserDTO userDTO = userDao.getOwnInfo(userCd);

		// 체크리스트 추가 
		String checkList = userDTO.getCheckList();
		
		// 시도 리스트 추가
		List<UserDTO> sdList = userDao.getSdList();

		// 날씨리스트 추가(임시)
		List<WeatherDTO> weatherList = dao.getWeatherList();

		int notiCount = dao.notiCount(dto.getCode());
		int noteCount = dao.noteCount(dto.getCode());

		//System.out.println(dto.getGrade());
		
		model.addAttribute("nickName", userDao.getUserNickName(dto.getCode()));
		model.addAttribute("ownInfo", userDTO);
		model.addAttribute("sdList", sdList);
		model.addAttribute("weatherList", weatherList);
		model.addAttribute("checkList", checkList);
		request.setAttribute("notiCount", notiCount);
		request.setAttribute("noteCount", noteCount);

		view = "/WEB-INF/views/OwnerMainTab.jsp";

		return view;
	}

	// 견주 마이어리 메인 탭 → 알림 리스트
	@RequestMapping(value = "ownernotilist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerMiaryNotiList(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/MiaryNotiList.jsp";

		return view;
	}

	
	// 견주 마이어리 메인 탭 → 쪽지 페이지 요청
	@RequestMapping(value = "ownernotelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String noteList(HttpServletRequest request) throws SQLException
	{	
		return "WEB-INF/views/NoteList.jsp";
	}
		
		
	// 쪽지 리스트 ajax
	// 페이징 처리하기..
	@RequestMapping(value = "notelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String ownerMiaryNoteList(HttpServletRequest request) throws SQLException
	{	
		// 세션에서 회원코드 받기
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		String userCd = dto.getCode();
		
		// 쪽지리스트 받아오기 
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		List<NoteDTO> noteList = dao.getNoteList(userCd);
		request.setAttribute("noteList", noteList);
		
		return "WEB-INF/views/ajaxNoteList.jsp";
	}
	
	  // 쪽지 발송
	  @RequestMapping(value = "sendNote.action", method = RequestMethod.POST)
	  public String sendNote(HttpServletRequest request) throws SQLException 
	  {
		  // 세션에서 회원 코드 
		  UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
		  String userCd = dto.getCode();
		  
		  // 수신한 값 담기
		  String receiver = request.getParameter("receiver"); //받는사람 닉네임 
		  String content = request.getParameter("nContent");
		  
		  // 받는 사람 닉네임으로 회원코드 얻기
		  IUserDAO userDAO = sqlSession.getMapper(IUserDAO.class);
		  String userCd2 = userDAO.getUserCd(receiver);
		  
		  //System.out.println(receiver);
		  //System.out.println(userCd2);
		  
		  // noteDTO 생성
		  NoteDTO note = new NoteDTO();
		  note.setUserCd(userCd);		// 보낸 사람
		  note.setUserCd2(userCd2);	// 받은 사람 
		  note.setContent(content);
		  
		  // note insert 
		  IMiaryDAO miaryDAO = sqlSession.getMapper(IMiaryDAO.class);
		  miaryDAO.sendNote(note);
		
		// 쪽지리스트 받아오기 
		//List<NoteDTO> noteList = miaryDAO.getNoteList(userCd);
		//request.setAttribute("noteList", noteList);
		  
		  return "WEB-INF/views/NoteList.jsp";
	  }
	  
	// 쪽지 삭제
	@RequestMapping(value = "noteDelete.action", method = RequestMethod.GET)
	public String deleteNote(HttpServletRequest request, String[] noteCdList) throws SQLException
	{
		// 회원코드
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
		String userCd = dto.getCode();
		//System.out.println("여기왔니");
		
		IMiaryDAO miaryDAO = sqlSession.getMapper(IMiaryDAO.class);
		
		for(int i=0; i<noteCdList.length; i++)
		{	
			String noteCd = noteCdList[i];
			//System.out.println(noteCd);
			
			miaryDAO.deleteNote(noteCd);
		}
		
		// 쪽지리스트 받아오기 
		//List<NoteDTO> noteList = miaryDAO.getNoteList(userCd);
		//request.setAttribute("noteList", noteList);
		  
		return "WEB-INF/views/NoteList.jsp";
	}
	
	// 하나의 쪽지 보기
	@RequestMapping(value = "getNote.action", method = RequestMethod.GET)
	public String getNote(HttpServletRequest request) throws SQLException
	{
		// 수신
		String noteCd = request.getParameter("noteCd");
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		//System.out.println(noteCd);
		
		NoteDTO note = dao.getNote(noteCd);
		
		//System.out.println(note);
		
		request.setAttribute("article", note);
		
		return "WEB-INF/views/ajaxNote.jsp";
	}
	
	
	
	// 견주 마이어리 메인 탭 → 캘린더 일정 등록 0728 추가
	@RequestMapping(value = "insertSch.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String insertSch(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		// 일정등록 값 받아오기
		String title = request.getParameter("title");
		String weatherCd = request.getParameter("weather");
		String category = request.getParameter("category");

		String addr = request.getParameter("addrSel3"); // 동읍면 넣어야 한다..
		String address = request.getParameter("address");
		String date = request.getParameter("date");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String startDate = date + " " + start + ":00";
		String endDate = date + " " + end + ":00";

		// System.out.println(startDate);
		// --==>> 2020-07-31 03:06:00
		// System.out.println(endDate);

		// 세션에서 유저코드 얻어오기
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("user");

		String userCd = dto.getCode();

		// dto 구성
		ScheduleDTO schDto = new ScheduleDTO();
		schDto.setTitle(title);
		schDto.setWeatherCd(weatherCd);
		schDto.setSchCd(category);
		schDto.setAddrSel3Cd(addr);
		schDto.setAddress(address);
		schDto.setStartDate(startDate);
		schDto.setEndDate(endDate);
		schDto.setUserCd(userCd);

		// 일정 등록 액션 처리
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		dao.insertSch(schDto);

		view = "/WEB-INF/views/OwnerMainTab.jsp";

		return view;
	}

	// 매칭내역
	// --------------------------------------------------------------------------------------------------------

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 탭
	@RequestMapping(value = "ownerwalkmatching.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerWalkMatching(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		String ownCd = dao.getOwnCode(dto.getCode());

		// 받은 산책신청 리스트
		List<MatchingDTO> walkReceiveList = dao.walkReceive(ownCd);
		model.addAttribute("walkReceiveList", walkReceiveList);

		// 보낸 산책신청 리스트
		List<MatchingDTO> walkSendList = dao.walkSend(ownCd);
		model.addAttribute("walkSendList", walkSendList);

		view = "/WEB-INF/views/OwnerWalkMatchingList.jsp";

		return view;
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 상세보기 견주
	@RequestMapping(value = "ownwalkreceivedetailown.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkReceiveDetailOwn(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		model.addAttribute("list", dao.walkReceiveDetailOwn(request.getParameter("walkCd")));

		return "/WEB-INF/views/ajaxOwnWalkReceiveDetailOwn.jsp";
	}

	// 견주 마이어리 매칭 탭 → 산책 보낸 내역 상세보기 견주
	@RequestMapping(value = "ownwalksenddetailown.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkSendDetailOwn(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		String ownCd = dao.getOwnCode(dto.getCode());

		MatchingDTO matDto = new MatchingDTO();

		matDto.setWalkCd(request.getParameter("walkCd"));
		matDto.setOwnCd(ownCd);

		model.addAttribute("list", dao.walkSendDetailOwn(matDto));

		return "/WEB-INF/views/ajaxOwnWalkReceiveDetailOwn.jsp";
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 상세보기 펫
	@RequestMapping(value = "ownwalkreceivedetailpet.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkReceiveDetailPet(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		model.addAttribute("list", dao.walkReceiveDetailPet(request.getParameter("walkCd")));

		return "/WEB-INF/views/ajaxOwnWalkReceiveDetailPet.jsp";
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역, 산책매칭완료 상세보기 펫알러지, 장애
	@RequestMapping(value = "ownwalkreceivedetailallerge.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkReceiveDetailAllerge(Model model, HttpServletRequest request) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);

		model.addAttribute("list1", dao.walkDetailPetAllerge(request.getParameter("walkCd")));
		model.addAttribute("list2", dao.walkDetailPetDisable(request.getParameter("walkCd")));

		return "/WEB-INF/views/ajaxOwnWalkReceiveDetailAllerge.jsp";
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 상세보기 이전 피드백 내역
	@RequestMapping(value = "ownwalkreceivedetailfdb.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkReceiveDetailFdb(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		String ownCd = dao.getOwnCode(dto.getCode());

		MatchingDTO matDto = new MatchingDTO();

		matDto.setOwnCd(ownCd);
		matDto.setWalkCd(request.getParameter("walkCd"));

		model.addAttribute("list", dao.walkReceiveDetailOwnFdb(matDto));

		return "/WEB-INF/views/ajaxOwnWalkReceiveDetailFdb.jsp";
	}

	
	//------- 최종매칭 ----------------------------------------------------------------------------
	// 견주 마이어리 매칭 탭 → 최종매칭 리스트 (0728 추가)
	@RequestMapping(value = "ownercompletewalkmatching.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String OwnerCompleteWalkMatching(Model model, HttpServletRequest request) throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");

		String view = null;

		// 산책매칭완료 탭을 클릭하면
		// 회원코드를 받아오기
		String userCd = request.getParameter("userCd");

		// 산책매칭정보 받아오기

		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		List<MatchingDTO> matchingList = dao.getLastWalkInfo(userCd);

		// System.out.println(userCd); 확인

		request.setAttribute("userCd", userCd);
		model.addAttribute("matchingList", matchingList);

		view = "/WEB-INF/views/OwnerCompleteWalkMatching.jsp";

		return view;
	}
	
   // 견주 산책 피드백 출력 // 진행 중....
   @RequestMapping(value="/ownerfeedbackform.action", method=RequestMethod.GET)
   public String FeedbackForm(Model model, HttpServletRequest request) throws SQLException
   {
	   String view = "WEB-INF/views/ajaxOwnerFeedback.jsp";
		
	   IFeedbackDAO dao = sqlSession.getMapper(IFeedbackDAO.class);
	   
	   HttpSession session = request.getSession();
	   
	   UserDTO dto = (UserDTO)session.getAttribute("user");
	   
	   request.setAttribute("user", dto);
	   
	   request.setAttribute("dogfdbList", dao.dogFeedbackList());
	   
	   //System.out.println(dao.dogFeedbackList());
	   
	   request.setAttribute("ownfdbList", dao.ownFeedbackList());
	   
	   //System.out.println(dao.ownFeedbackList());
	
	   return view;
   }
   
   // 견주 산책 피드백 출력 후 확인 액션 // 진행 중....
   @RequestMapping(value="/ownerfeedback.action", method=RequestMethod.GET)
   public String Feedbackaction(Model model, HttpServletRequest request) throws SQLException
   {
	   
	   String view = "WEB-INF/views/OwnerCompleteWalkMatching.jsp";
	   
	   String userCd = request.getParameter("userCd");
	   
	   System.out.println(userCd);
	   
	   request.setAttribute("userCd", userCd);
	   
	   return view;
   }
	
	// 견주 마이어리 매칭 탭 → 최종매칭리스트 상대 상세정보 (0729 추가)
	@RequestMapping(value="walklastdetail.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String getWalkLastOwnDetail(Model model, HttpServletRequest request) throws SQLException
	{
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		// 상세정보 보기를 클릭하면
		// 회원코드와 최종산책 코드를 받아오기
		String userCd = request.getParameter("userCd");
		String walkLastCd = request.getParameter("walkLastCd");
		
		//System.out.println(userCd); 		//-- 확인  
		//System.out.println(walkLastCd);	//-- 확인
		 
		// 견주 상세정보 얻어오기
		List<MatchingDTO> ownList = dao.getWalkLastOwnDetail(userCd, walkLastCd);
		
		// 펫 상세정보 얻어오기
		List<PetDTO> petList = dao.getWalkLastPetDetail(userCd, walkLastCd);
		
		// 장애 정보 얻어오기
		List<PetDTO> disaList = dao.getWalkLastDisaDetail(userCd, walkLastCd);
		
		// 알러지 정보 얻어오기
		List<PetDTO> alleList = dao.getWalkLastAlleDetail(userCd, walkLastCd);
		
		// 이전 매칭 정보 얻어오기
		List<FeedbackDTO> fdbList = dao.getBeforeFdbInfo(userCd, walkLastCd);
		
		model.addAttribute("ownList",ownList);
		model.addAttribute("petList", petList);
		model.addAttribute("adList", disaList);
		model.addAttribute("alleList", alleList);
		model.addAttribute("fdbList", fdbList);
		
		return "/WEB-INF/views/ajaxWalkLastDetail.jsp";
		
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 수락
	@RequestMapping(value = "ownwalklastinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkLastInsert(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		MatchingDTO dto = new MatchingDTO();
		
		dto.setWeatherCd("WEAT1");
		dto.setWalkCd(request.getParameter("walkCd"));
		
		dao.ownWalkLastInsert(dto);

		return "/ownerwalkmatching.action";
	}

	// 견주 마이어리 매칭 탭 → 산책 신청 내역 거절
	@RequestMapping(value = "ownwalklastdelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkLastDelete(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		dao.ownWalkLastDelete(request.getParameter("walkCd"));

		return "/ownerwalkmatching.action";
	}

	// 견주 마이어리 매칭 탭 → 산책 보낸 내역 거절
	@RequestMapping(value = "ownwalkdelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnWalkDelete(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		String ownCd = dao.getOwnCode(dto.getCode());

		MatchingDTO matDto = new MatchingDTO();

		matDto.setOwnCd(ownCd);
		matDto.setWalkCd(request.getParameter("walkCd"));

		dao.ownWalkDelete(matDto);

		return "/ownerwalkmatching.action";
	}

	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 탭
	@RequestMapping(value = "ownerworkermatching.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerWorkerMatching(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		String ownCd = dao.getOwnCode(dto.getCode());

		// 받은 워커 신청 리스트
		List<MatchingDTO> agcReceiveList = dao.agcReceive(ownCd);
		model.addAttribute("agcReceiveList", agcReceiveList);

		// 보낸 대행 신청 리스트
		List<MatchingDTO> agcApplyList = dao.agcApply(ownCd);
		model.addAttribute("agcApplyList", agcApplyList);

		view = "/WEB-INF/views/OwnerWorkerMatchingList.jsp";

		return view;
	}

	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 워커 리스트 상세정보
	@RequestMapping(value="agcworkerdetail.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcWorkerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");
		
		String agcSelCd = request.getParameter("agcCd");
		
		String wokCd = dao.agcToWorker(agcSelCd);
		
		dto.setOwnCd(dao.getOwnCode(dto.getCode()));
		dto.setWokCd(wokCd);
		
		String agcCd = dao.agcSelToAgc(agcSelCd);
		
		model.addAttribute("worker", dao.agcWorkerDetail(wokCd));
		model.addAttribute("pet", dao.agcSelPet(agcCd));
		model.addAttribute("agcWokFdb", dao.agcWokFdb(dto));
		model.addAttribute("agcMsg", dao.agcMsg(agcSelCd));
		
		return "/WEB-INF/views/ajaxOwnerAgcWorkerDetail.jsp";
	}
	
	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 워커 수락
	@RequestMapping(value="/agcwokyes.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcWokYes(Model model, HttpServletRequest request) throws SQLException
	{
		//IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		return "redirect:/ownerworkermatching.action";
	}
	
	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 워커 거절
	@RequestMapping(value="/agcwokno.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcWokNo(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		String agcSelCd = request.getParameter("agcCd");
		
		dao.agcNo(agcSelCd);
		 
		return "redirect:/ownerworkermatching.action";
	}
	
	
	
	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 대행 상세정보
	@RequestMapping(value="agcownerdetail.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcOwnerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		String agcCd = request.getParameter("agcCd");
		
		model.addAttribute("info", dao.agcInfo(agcCd));
		model.addAttribute("pet", dao.agcSelPet(agcCd));
		
		return "/WEB-INF/views/ajaxOwnerAgcDetail.jsp";
	}
	
	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 대행 신청 삭제
	@RequestMapping(value="/agccancel.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcCancel(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		String agcCd = request.getParameter("agcCd");
		
		dao.agcPetDelete(agcCd);
		dao.agcCancel(agcCd);
		
		return "redirect:/ownerworkermatching.action";
	}
	
	// 견주 마이어리 매칭 탭 → 대행 매칭 완료 리스트 탭
	@RequestMapping(value = "ownercompleteworkermatching.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerCompleteWorkerMatching(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		model.addAttribute("agcLastList", dao.agcLastList(dao.getOwnCode(dto.getCode())));
		
		view = "/WEB-INF/views/OwnerCompleteWorkerMatching.jsp";

		return view;
	}
	
	// 견주 마이어리 매칭 탭 → 대행 매칭 완료 상세정보
	@RequestMapping(value = "agclastdetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String agcLastDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");
		
		String agcSelCd = request.getParameter("agcCd");
		
		String wokCd = dao.agcToWorker(agcSelCd);
		
		dto.setOwnCd(dao.getOwnCode(dto.getCode()));
		dto.setWokCd(wokCd);
		
		String agcCd = dao.agcSelToAgc(agcSelCd);
		
		model.addAttribute("worker", dao.agcWorkerDetail(wokCd));
		model.addAttribute("pet", dao.agcSelPet(agcCd));
		model.addAttribute("agcWokFdb", dao.agcWokFdb(dto));
		
		view = "/WEB-INF/views/ajaxAgcLastDetail.jsp";
		
		return view;
	}
	
	// 견주 마이어리 매칭 탭 → 대행 신청 리스트 → 대행 신청 삭제
	@RequestMapping(value="/agclastcancel.action" , method = {RequestMethod.GET, RequestMethod.POST})
	public String agcLastCancel(Model model, HttpServletRequest request) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		String agcCd = request.getParameter("agcCd");
		
		dao.agcLastCancel(agcCd);
		
		return "redirect:/ownercompleteworkermatching.action";
	}

	// 기록
	// ------------------------------------------------------------------------------------------------------------

	// 견주 마이어리 기록 탭
	@RequestMapping(value = "ownerrecordlisttab.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerRecordListTab(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		model.addAttribute("recList", dao.recList(dto.getCode()));
		
		view = "/WEB-INF/views/RecordListTab.jsp";

		return view;
	}
	
	// 기록 게시글 보기
	@RequestMapping(value = "recarticle.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String recArticle(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
		model.addAttribute("article", dao.recArticle(request.getParameter("recCd")));
		model.addAttribute("accList", dao.recArticleAcc(request.getParameter("recCd")));
		
		view = "/WEB-INF/views/RecordArticle.jsp";
		
		return view;
	}
	
	// 기록 작성 폼
	@RequestMapping(value = "walkrecwrite.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String WalkRecInsertForm(HttpServletRequest request, Model model) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		IMatchingDAO matDao = sqlSession.getMapper(IMatchingDAO.class);
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");

		model.addAttribute("schList", dao.getSchItem());
		model.addAttribute("pet_list", matDao.walkPetSel(dto.getCode()));
	      
		String view = "/WEB-INF/views/RecordInsert.jsp";
		return view;
	}
	
	// 기록 수정
	@RequestMapping(value = "/recupdate.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String recUpdate(HttpServletRequest request, Model model) throws SQLException
	{
		String view = null;
		
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		IMatchingDAO matDao = sqlSession.getMapper(IMatchingDAO.class);
		
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
		
		model.addAttribute("pet_list", matDao.walkPetSel(dto.getCode()));
		
		model.addAttribute("schList", dao.getSchItem());
		model.addAttribute("weatherList", dao.getWeatherList());
		
		model.addAttribute("article", dao.recArticle(request.getParameter("recCd")));
		
		view = "/WEB-INF/views/RecordUpdate.jsp";
		
		return view;
	}
	
	// 기록 삭제
	@RequestMapping(value = "/recdelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String recDelete(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
 		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		
 		RecordDTO dto = new RecordDTO();
 		
 		String recCd = request.getParameter("recCd");
		String accCd = dao.recToAcc(recCd);
		
		dto.setSchItemCd(dao.recToSchItem(recCd));
		dto.setRecCd(recCd);
		
		dao.accInfoDelete(accCd);
		dao.recDelete(dto);
		dao.accDelete(accCd);
		
		view = "redirect:/ownerrecordlisttab.action";
		
		return view;
	}
	

	// 그룹
	// ------------------------------------------------------------------------------------------------------------

	// 견주 마이어리 그룹 탭
	@RequestMapping(value = "ownergrouptab.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerGroupTab(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/OwnerGroupTab.jsp";
		// 준비중
		return view;
	}

	// 통계
	// ------------------------------------------------------------------------------------------------------------

	// 견주 마이어리 통계 탭
	@RequestMapping(value = "ownerstatisticstab.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerStatisticsTab(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/Statistics.jsp";

		return view;
	}

	// 견주 마이어리 통계 탭 → 가계부 탭
	@RequestMapping(value = "owneraccount.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerAccount(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/OwnerAccount.jsp";

		return view;
	}

	// 견주 마이어리 통계 탭 → 포인트 탭
	@RequestMapping(value = "ownerpoint.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerPoint(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/OwnerPoint.jsp";

		return view;
	}

	// 정보
	// ------------------------------------------------------------------------------------------------------------

	// 견주 마이어리 정보 탭
	@RequestMapping(value = "ownerinfotab.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerInfoTab(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		IMiaryDAO miaryDao = sqlSession.getMapper(IMiaryDAO.class);
		IUserDAO userDao = sqlSession.getMapper(IUserDAO.class);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("user");

		dto = miaryDao.getOwnInfo(dto.getCode());

		List<UserDTO> sdList = userDao.getSdList();
		List<UserDTO> sggList = userDao.getSggList(dto.getAddrCd1());
		List<UserDTO> demList = userDao.getDemList(dto.getAddrCd2());

		model.addAttribute("sdList", sdList);
		model.addAttribute("sggList", sggList);
		model.addAttribute("demList", demList);

		model.addAttribute("ownInfo", dto);

		view = "/WEB-INF/views/OwnerInfoTab.jsp";

		return view;
	}

	// 견주 마이어리 정보 탭 → 소셜 탭
	@RequestMapping(value = "ownerfriendlist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerFriendList(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/FriendList.jsp";

		return view;
	}

	// 견주 마이어리 정보 탭 → 마이펫 정보 탭
	// jsp 다시 보기!==============================================================
	@RequestMapping(value = "ownerpetinfo.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String PetInfoTab(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/PetInfoTab.jsp";

		return view;
	}
	// ==============================================================jsp 다시 보기!

	// 견주 마이어리 정보 탭 → 소셜 탭 → 신청목록
	@RequestMapping(value = "ownerfriendapply.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerFriendApply(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/FriendApply.jsp";

		return view;
	}

	// 견주 마이어리 정보 탭 → 소셜 탭 → 차단목록
	@RequestMapping(value = "ownerblocklist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String OwnerBlockList(Model model) throws SQLException
	{
		String view = null;

		view = "/WEB-INF/views/BlockList.jsp";

		return view;
	}
	
	@RequestMapping(value = "ownajaxcal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String OwnAjaxCal(HttpServletRequest request, Model model) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
      
		String Year = request.getParameter("year");
		String Month = request.getParameter("month");
      
		if(Month.length() == 1)
			Month = "0" + Month;
      
		String walkDate = Year + "-" + Month;
      
		ParamDTO pDto = new ParamDTO();
		pDto.setCode(dto.getCode());
		pDto.setWalkDate(walkDate);
      
		List<ParamDTO> list = dao.getSchList(pDto);

		model.addAttribute("schList", list);
		model.addAttribute("year", Year);
		model.addAttribute("month", Month);
      
		String view = "WEB-INF/views/ajaxOwnCal.jsp";
		return view;
	}
   
	@RequestMapping(value = "ownajaxcalupdate.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownAjaxCalUpdate(HttpServletRequest request, Model model) throws SQLException
	{
		IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
      
		String schCd = request.getParameter("schCd");
		String walkDate = request.getParameter("walkDate");
      
      ParamDTO dto = new ParamDTO();
      dto.setSchCd(schCd);
      dto.setWalkDate(walkDate);
      
      dao.ownCalUpdate(dto);
      
      String view = "WEB-INF/views/ajaxOwnCalUpdate.jsp";
      return view;
   }
   
   @RequestMapping(value = "ownacallist.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String ownCalList(HttpServletRequest request, Model model) throws SQLException
   {
      IMiaryDAO dao = sqlSession.getMapper(IMiaryDAO.class);
      UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
      
      String date = request.getParameter("paramDate");
      
      ParamDTO pDto = new ParamDTO();
      pDto.setCode(dto.getCode());
      pDto.setWalkDate(date);
      
      model.addAttribute("calList", dao.ownCalList(pDto));
      
      String view = "WEB-INF/views/ownCalList.jsp";
      return view;
   }
}
