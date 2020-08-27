package com.togedog.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.togedog.model.IUserDAO;
import com.togedog.model.IWorkerMiaryDAO;
import com.togedog.util.MyUtil;
import com.togedog.vo.MatchingDTO;
import com.togedog.vo.UserDTO;

@Controller	
public class WorkerMiaryController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 체크리스트 업데이트
	@RequestMapping(value = "updateWokCheckList.action", method = RequestMethod.GET)
	public String updateWokCheckList(HttpServletRequest request) throws SQLException 
	{
		// 세션에서 회원코드 받아오기
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		String userCd = user.getCode();
		
		// 회원코드로 워커신청코드 얻기
		IUserDAO userDAO = sqlSession.getMapper(IUserDAO.class);
		String wokApplyCd = userDAO.getWokApplyCd(userCd);
		
		// 데이터 수신
		String checkList = request.getParameter("checkList");
		
		// 객체 구성
		UserDTO dto = new UserDTO();
		dto.setWokApplyCd(wokApplyCd);
		dto.setCheckList(checkList);
		
		// 워커 체크리스트 업데이트
		userDAO.updateWokCheckList(dto);
		
		request.setAttribute("result", checkList);
		return "/WEB-INF/views/ajax.jsp";
	}
	
	// 워커 마이어리 메인화면
	@RequestMapping(value="/workermiarymain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String MiaryWorkerMainForm(HttpServletRequest request) throws SQLException
	{	
		String view = null;
	
		// 세션에서 회원코드 받아오기
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		String userCd = user.getCode();
		
		// 회원코드 통해서 이름 얻어오기 
		IUserDAO userDAO = sqlSession.getMapper(IUserDAO.class);
		String name = userDAO.getWorkerName(userCd);
		
		// 회원코드로 워커신청코드 얻기
		String wokApplyCd = userDAO.getWokApplyCd(userCd);
		
		// 체크리스트 얻어오기
		String checkList = userDAO.getCheckList(wokApplyCd);
		
		request.setAttribute("name", name);
		request.setAttribute("checkList", checkList);
		
		view = "/WEB-INF/views/MiaryWorkerMain.jsp";
		
		return view;
	}
	
	// 워커 마이어리 매칭탭 → 대행신청내역
	@RequestMapping(value="/agencyapplylist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AgencyApplyList(HttpServletRequest request) throws Exception
	{	
		String view = "/WEB-INF/views/AgencyApplyListTab.jsp";
		
		// 세션에서 회원코드 받아오기
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		String userCd = user.getCode();
		
		// DAO 주입
		IUserDAO userDAO = sqlSession.getMapper(IUserDAO.class); 
		IWorkerMiaryDAO workerDAO = sqlSession.getMapper(IWorkerMiaryDAO.class);
		
		// 회원코드로 워커신청코드 얻기
		String wokApplyCd = userDAO.getWokApplyCd(userCd);
		
		// 워커신청코드로 워커코드 얻기
		String wokCd = userDAO.getWokCd(wokApplyCd);
		
		// 대행 리스트( 전체 대행 신청리스트 중 이 워커에게 맞는 리스트 가져오기)
		IWorkerMiaryDAO mDAO = sqlSession.getMapper(IWorkerMiaryDAO.class);
		List<MatchingDTO> agcList = mDAO.getAgcApply(wokCd);
		
		// 워커가 선택하고 견주 선택 기다리는 전체리스트
		List<MatchingDTO> waitingList = mDAO.waitingAgc(wokCd);
		
		
		//-----------매칭 
		// 워커 정보 가져오기
		UserDTO workerDTO = userDAO.getWokInfo(userCd);
		String wokAddrCd1 = workerDTO.getAddrCd1();	
		

		List<MatchingDTO> matchingList = new ArrayList<MatchingDTO>();
		
		MyUtil myUtil = new MyUtil();
		
		double startNum = 0;
		double endNum = 0;
		
		// 지역(시도)이 일치하고 근무요일, 시간 맞는 매칭DTO만 matchingList 에 담기
		for(MatchingDTO matchingDTO : agcList)
		{
			// 지역(시도) 맞으면 
			if(wokAddrCd1.equals(matchingDTO.getAddrCd1()))
			{
				// 워커 근무요일 가져오기
				List<UserDTO> daysList = workerDAO.getWorkdays(wokApplyCd);
				for (UserDTO days : daysList)
				{
					String wokDayCd = days.getDayCd();
					int wokFavStart = days.getFavStart();
					int wokFavEnd = days.getFavEnd();
					
					// 산책일 요일 얻기
					String walkDI = myUtil.getDateDay(matchingDTO.getWalkDate());
					
					// 산책 시간 얻기
					String startTime = matchingDTO.getStartTime();
					String endTime = matchingDTO.getEndTime();
					
					String[] startTimes = startTime.split(":");
					String[] endTimes = endTime.split(":");
					
					// 산책시작시간 얻기
					if(startTimes[1].equals("30"))
						startNum = Integer.parseInt(startTimes[0])+ 0.5;
					else
						startNum = Integer.parseInt(startTimes[0]);
					
					// 산책끝 시간 얻기
					if(endTimes[1].equals("30"))
						endNum = Integer.parseInt(endTimes[0])+ 0.5;
					else
						endNum = Integer.parseInt(endTimes[0]);
					
					if(wokDayCd.equals(walkDI) && wokFavStart <= startNum && wokFavEnd >= endNum )
						matchingList.add(matchingDTO);
					
				}
			}
		}

		request.setAttribute("agcList", matchingList);
		request.setAttribute("waitingList", waitingList);
		
		return view;
	}
	
	// 워커가 대행매칭 수락 → 대기중 
	@RequestMapping(value="wokAgcAccept.action", method = RequestMethod.POST)
	public String wokAgcAccept(HttpServletRequest request) throws SQLException
	{
		// 회원코드 얻기
		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("user");
		String userCd = userDTO.getCode();
		
		IUserDAO userDAO = sqlSession.getMapper(IUserDAO.class);
		String wokCd = userDAO.getWokCd(userDAO.getWokApplyCd(userCd));
		
		// 데이터 수신
		String agcCd = request.getParameter("agcCd");
		String msg = request.getParameter("msg");
				
		MatchingDTO dto = new MatchingDTO();
		dto.setWokCd(wokCd);
		dto.setMsg(msg);
		dto.setAgcCd(agcCd);
		
		IWorkerMiaryDAO wokDAO = sqlSession.getMapper(IWorkerMiaryDAO.class);
		wokDAO.insertAGCSel(dto);
		
		return "/WEB-INF/views/AgencyApplyListTab.jsp";
	}
	
	
	
	// 워커 마이어리 매칭탭 → 대행매칭완료
	@RequestMapping(value="/agencycompletematchinglist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AgencyCompleteMatchingList(Model model) throws SQLException
	{	
		String view = "/WEB-INF/views/AgencyCompleteMatchingList.jsp";
		
		return view;
	}
	
	// 워커 마이어리 정산탭
	@RequestMapping(value="/workeraccount.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String WorkerAccount(Model model) throws SQLException
	{	
		String view = "/WEB-INF/views/WorkerAccount.jsp";
		
		return view;
	}
	
	// 워커 마이어리 통계탭
	@RequestMapping(value="/workerstatistics.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String WorkerStatistics(Model model) throws SQLException
	{	
		String view = "/WEB-INF/views/WorkerStatistics.jsp";
		
		return view;
	}
	
	// 워커 마이어리 정보탭
	@RequestMapping(value="/workermyinfo.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String WorkerMyInfo(Model model) throws SQLException
	{	
		String view = "/WEB-INF/views/MiaryWorkerMyinfo.jsp";
		
		return view;
	}
}
