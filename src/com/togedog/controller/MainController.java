package com.togedog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

import com.togedog.model.IMainDAO;
import com.togedog.model.IMiaryDAO;
import com.togedog.model.INoticeDAO;
import com.togedog.model.IUserDAO;
import com.togedog.util.MyUtil;
import com.togedog.vo.NoticeDTO;
import com.togedog.vo.UserDTO;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 가장 초기 메인화면 (회원인 사람도, 회원이 아닌 사람도 접근할 수 있는 화면)(0725추가)
	@RequestMapping(value="/firstmain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String RealMainForm(Model model, HttpServletRequest request) throws SQLException
	{	
		String view = null;
		
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		model.addAttribute("count1", dao.getWalkPetCount());
		model.addAttribute("count2", dao.getAgcPetCount());
		model.addAttribute("count3", dao.getOwnCount());
		model.addAttribute("count4", dao.getPetCount());
		model.addAttribute("count5", dao.getWokCount());
		//model.addAttribute("count6", dao.getGroupCount());
		
		view = "/WEB-INF/views/Main.jsp";
		
		return view;
	}
	
	// 가장 초기 메인화면에 있는 펫워커 지원서 설명 버튼(0725 추가)
	@RequestMapping(value="/mainworkerrec.action", method=RequestMethod.GET)
	public String MainWorkerRec(Model model) throws SQLException
	{
		return "WEB-INF/views/MainWorkerRec.jsp";
	}
	   
	// 메인화면
	@RequestMapping(value="/mainmenuform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String MainMenuForm(Model model, HttpServletRequest request) throws SQLException
	{
		INoticeDAO notiDao = sqlSession.getMapper(INoticeDAO.class);	
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		request.setAttribute("user", dto);
		request.setAttribute("mainNotiList", notiDao.mainNoticeList());
		
		String view = "WEB-INF/views/MainMenu.jsp";  
		
		return view;
	}
	
	// 공지사항 리스트로 들어가는 컨트롤러(0726 추가)
	// 공지사항 리스트로 들어갈때 페이징처리하기(0807 추가)
	@RequestMapping(value="/mainnoticelistform.action", method=RequestMethod.GET)
	public String MainNoticeListForm(Model model, HttpServletRequest request) throws SQLException, UnsupportedEncodingException
	{
		String view = "WEB-INF/views/MainNoticeList.jsp";
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		request.setAttribute("user", dto);
		
		//----------------------------------------------- 페이징 처리
		
		String cp = request.getContextPath();
		MyUtil util = new MyUtil();
		INoticeDAO notidao = sqlSession.getMapper(INoticeDAO.class);
	
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		
		int currentPage = 1; // 현재 페이지는 1이다...
		if (pageNum != null && pageNum.length() != 0) // 페이지 번호가 null이거나 길이가 0이 아니라면
		{
			currentPage = Integer.parseInt(pageNum); // 현재 페이지는 숫자 어쩌구,,,
		}
		
		String searchValue = null; // 검색 키워드
		searchValue = request.getParameter("searchValue");
		
		if(searchValue == null)
		{
			searchValue = "";
		}
		
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int dataCount = notidao.getTotalNum(searchValue); // 전체 데이터 개수
		
		int numPerPage; // 미리 변수 선언
		
		String numPerPage1 = request.getParameter("numPerPage"); 
		// 페이지마다 나타나는 게시글 개수를 view 딴에서 선택한 것
		// 단, 넘어온 값이 String 이다...	
		
		//System.out.println(numPerPage1); // 테스트
		
		if(numPerPage1 != null) // null이 아니라면,,, 
		{
			numPerPage = Integer.parseInt(numPerPage1); // 페이지 마다 나타나는 게시글 개수
		}
		else // null일때 디폴트로 나타나는 게시글 개수
		{
			numPerPage = 5; // 는 5개
		}
		
		int totalPage = util.getPageCount(numPerPage, dataCount); // 전체 페이지 수 계산하는 메소드 사용하기
		
		// 전체 페이지 수보다 현재 표시할 페이지가 큰 경우
		if(totalPage < currentPage)
		{
			currentPage = totalPage;
		}
		
		// 리스트의 시작과 끝의 위치
		int start = (currentPage -1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		
		// 테이블에서 리스트를 출력할 데이터 가져오기
		List<NoticeDTO> list = notidao.noticeList(searchValue, start, end);
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			//searchValue = URLEncoder.encode("UTF-8");
			params = "searchValue=" + searchValue;
		}
		
		// 페이징 처리
		String listUrl = cp + "/mainnoticelistform.action";
		if (params.length() != 0)
		{
			listUrl += "?" + params;
		}
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("notiList", list);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("dataCount", dataCount);
		
		//request.setAttribute("notiList", notidao.noticeList());
		//request.setAttribute("totalData", notidao.getTotalNum());
		
		return view;
	}
	
	// 공지사항 리스트의 article로 들어가는 컨트롤러(0727 추가)
	@RequestMapping(value="/mainnoticearticleform.action", method=RequestMethod.GET)
	public String MainNoticeArticle(Model model, HttpServletRequest request) throws SQLException
	{
		String view = "WEB-INF/views/MainNoticeArticle.jsp";
		
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		String noticode = request.getParameter("notiCd");
		
		INoticeDAO notiDao = sqlSession.getMapper(INoticeDAO.class);
		
		request.setAttribute("user", dto);

		request.setAttribute("view", notiDao.viewCount(noticode)); // 조회수 카운트
		request.setAttribute("article", notiDao.noticeArticle(noticode)); // 각 공지사항 상세보기
		
		int beforeNum = notiDao.getBeforeNum(noticode); // noticode 숫자로 받아오고 null인 경우는 -1을 보낸다....
		int nextNum = notiDao.getNextNum(noticode); // 숫자로 받아오고 null인 경우는 -1dmf qhsosek.
		
		//System.out.println(beforeNum);
		//System.out.println(nextNum);
		
		request.setAttribute("before", beforeNum); // 숫자를 보낸다
		request.setAttribute("next", nextNum); // 숫자를 보낸다

		NoticeDTO dtoBefore = null; // dto 우선적으로 널
		NoticeDTO dtoNext = null; // dto 우선적으로 널
		
		String beforeStr;
		String nextStr;
		
		// 만약에 숫자가 -1이 아니라면....
		if(beforeNum == -1)
		{
			beforeStr = "-1";
			dtoBefore = notiDao.noticeArticle(beforeStr);
			request.setAttribute("beforeStr", beforeStr);
			//System.out.println(beforeStr);
			request.setAttribute("beforeTitle", beforeStr);
		}
		else
		{
			beforeStr = "NOTI" + beforeNum; // -1이면 noti-1 이 된단말이지...
			dtoBefore = notiDao.noticeArticle(beforeStr);
			request.setAttribute("beforeStr", beforeStr);
			//System.out.println(beforeStr);
			request.setAttribute("beforeTitle", dtoBefore.getTitle());
		}
			
		
		// 만약에 숫자가 -1이 아니라면....
		if(nextNum == -1)
		{
			nextStr = "-1";
			dtoNext = notiDao.noticeArticle(nextStr);
			request.setAttribute("nextStr", nextStr);
			//System.out.println(nextStr);
			request.setAttribute("nextTitle", nextStr);
		}
		else
		{
			nextStr = "NOTI" + nextNum; // -1이면 여기도 noti-1이 된단 말이지...
			dtoNext = notiDao.noticeArticle(nextStr);
			request.setAttribute("nextStr", nextStr);
			//System.out.println(nextStr);
			request.setAttribute("nextTitle", dtoNext.getTitle());
		}
		
		

		//request.setAttribute("beforeTitle", dtoBefore.getTitle());
		//request.setAttribute("nextTitle", dtoNext.getTitle());
		
		return view;
	}
	
	// 그룹페이지 컨텐츠 준비중 띄우는 페이지 추가(0726)
	@RequestMapping(value="/contentfix.action", method=RequestMethod.GET)
	public String ContentFix(Model model) throws SQLException
	{
		String view = "WEB-INF/views/ContentFix.jsp";
		
		return view;
	}
	
	// 메인정보 수정 폼 요청(0810 추가)
	@RequestMapping(value="/mainmyinfo.action", method= {RequestMethod.GET, RequestMethod.POST })
	public String getMainMyInfo(HttpServletRequest request, Model model) throws SQLException
	{
		//1. 세션에서 유저코드 얻어오기
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		String userCd = userDTO.getCode();
		
		System.out.println(userCd);
		
		//2. 유저코드에 해당하는 유저 정보 얻어오기(UserDTO)
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		UserDTO user = dao.getOwnInfo(userCd);
		request.setAttribute("user", user);
		
		//3. 주소 리스트
		List<UserDTO> sdList = dao.getSdList();
		model.addAttribute("sdList", sdList);
		
		List<UserDTO> sggList = dao.getSggList(user.getAddrCd1());
		
		model.addAttribute("sggList", sggList);
		
		List<UserDTO> demList = dao.getDemList(user.getAddrCd2());
		model.addAttribute("demList", demList);
		
		// 은행리스트
		List<UserDTO> bankList = dao.getBankList();
		model.addAttribute("bankList", bankList);
		
		//4. jsp 에서 뿌려주깅 
		return "WEB-INF/views/MainInfo.jsp";
	}
	
	// 메인정보 수정 액션처리(0810 추가)
	@RequestMapping(value ="/updatemainmyinfo.action", method=RequestMethod.POST)
	public String updateMainMyInfo(HttpServletRequest request) throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		// 세션에서 유저코드 얻기
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");
		String userCd = dto.getCode();
		
		//수신한 값 받아오기 
		String beforePwd = request.getParameter("beforePwd");
		String pwd = request.getParameter("pwd");
		String addrCd3 = request.getParameter("addrCd3");
		String addrDetail = request.getParameter("addrDetail");
		String tel =  request.getParameter("tel");
		String bankCd = request.getParameter("bankCd");
		String accNum = request.getParameter("accNum");
		
		
		// DTO 구성
		UserDTO userDto = new UserDTO();
		userDto.setBeforePwd(beforePwd);
		userDto.setPwd(pwd);
		userDto.setAddrCd3(addrCd3);
		userDto.setAddrDetail(addrDetail);
		userDto.setTel(tel);
		userDto.setBankCd(bankCd);
		userDto.setAccNum(accNum);
		userDto.setCode(userCd);
		
		// 업데이트 쿼리문 실행
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		dao.updateMainMyInfo(userDto);
		
		
		return "/mainmyinfo.action";
	}
	
	// 입력받은  회원 비밀번호가 기존 번호와 같은지 확인
	@RequestMapping(value="pwcheck.action", method = RequestMethod.POST)
	public String pwCheck(HttpServletRequest request) throws SQLException
	{
		String beforePwd = request.getParameter("beforePwd");
		
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		
		/*
		String pwd = dao.pwCheck(beforePwd);
		
		System.out.println(pwd);
		
		String result = "";
		
		if(beforePwd == pwd)
		{
			result = "correct";
		}
		*/
		
		String result = "correct";
		
		request.setAttribute("result", result);
		
		return "WEB-INF/views/ajax.jsp";
	}
	
	// 탈퇴하기
	@RequestMapping(value = "exit.action", method = RequestMethod.GET)
	public String exit(HttpServletRequest request) throws SQLException
	{
		// 세션에서 유저코드 얻기 
		HttpSession session = request.getSession();
		UserDTO userDTO	= (UserDTO)session.getAttribute("user");
		String userCd = userDTO.getCode();
		
		// tbl_user_bye 에 insert
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		dao.insertUserBye(userCd);
		
		// 세션 정보 지우기
		session.removeAttribute("user");
		
		return "WEB-INF/views/ExitComp.jsp";
	}
	
}