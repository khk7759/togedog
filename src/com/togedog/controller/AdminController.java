package com.togedog.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.togedog.model.IAdminDAO;
import com.togedog.model.INoticeDAO;
import com.togedog.vo.NoticeDTO;
import com.togedog.vo.UserDTO;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 메인 화면
	@RequestMapping(value="/adminmain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminMain(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		model.addAttribute("yearWalkLastCount", dao.yearWalkLastCount());
		model.addAttribute("monthWalkLastCount", dao.monthWalkLastCount());
		model.addAttribute("yearAgcLastCount", dao.yearAgcLastCount());
		model.addAttribute("monthAgcLastCount", dao.monthAgcLastCount());
		model.addAttribute("yearUserCount", dao.yearUserCount());
		model.addAttribute("monthUserCount", dao.monthUserCount());
		
		view = "/WEB-INF/views/admin/Main.jsp";
		
		return view;
	}
	
	
	
	// 관리자 정보 수정 페이지 요청
	@RequestMapping(value="/admininfoform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminInfo(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("adminInfo", dao.adminInfo(userDTO.getCode()));
		
		view = "/WEB-INF/views/admin/AdminInfo.jsp";
		
		return view;
	}
	
	// 관리자 정보 수정
	@RequestMapping(value="/admininfoupdate.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminInfoUpdate(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO dto = new UserDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		
		dao.adminInfoUpdate(dto);
		
		view = "redirect:/admininfoform.action";
		
		return view;
	}
	
	// 관리자 비밀번호 변경
	@RequestMapping(value="/adminpw.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPw(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("admin");
		
		String pw = dao.adminPw(dto.getCode());
		
		String userPw = request.getParameter("pw");
		String userPw1 = request.getParameter("pw1");
		
		if(!pw.equals(dao.adminUserPw(userPw)))
		{
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
		}
		else
		{
			dto.setPwd(userPw1);
			
			dao.adminPwUpdate(dto);
		}
		
		view = "redirect:/admininfoform.action";
		
		return view;
	}
	
	
	
	// 공지사항 리스트
	@RequestMapping(value="/noticelist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		model.addAttribute("notiList", dao.adminNoticeList());
		
		view = "/WEB-INF/views/admin/NoticeList.jsp";
		
		return view;
	}
	
	// 공지사항 article
	@RequestMapping(value="/noticearticleform.action", method={RequestMethod.GET, RequestMethod.POST})
	public String MainNoticeArticle(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		String noticode = request.getParameter("notiCd");

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		INoticeDAO notiDao = sqlSession.getMapper(INoticeDAO.class);
		
		request.setAttribute("view", notiDao.viewCount(noticode));
		request.setAttribute("article", dao.adminNoticeArticle(noticode));
		
		int beforeNum = notiDao.getBeforeNum(noticode);
		int nextNum = notiDao.getNextNum(noticode);
		
		request.setAttribute("before", beforeNum);
		request.setAttribute("next", nextNum);

		NoticeDTO dtoBefore = null;
		NoticeDTO dtoNext = null;
		
		String beforeStr;
		String nextStr;
		
		if(beforeNum == -1)
		{
			beforeStr = "-1";
			dtoBefore = notiDao.noticeArticle(beforeStr);
			request.setAttribute("beforeStr", beforeStr);
			request.setAttribute("beforeTitle", beforeStr);
		}
		else
		{
			beforeStr = "NOTI" + beforeNum;
			dtoBefore = notiDao.noticeArticle(beforeStr);
			request.setAttribute("beforeStr", beforeStr);
			request.setAttribute("beforeTitle", dtoBefore.getTitle());
		}
			
		if(nextNum == -1)
		{
			nextStr = "-1";
			dtoNext = notiDao.noticeArticle(nextStr);
			request.setAttribute("nextStr", nextStr);
			request.setAttribute("nextTitle", nextStr);
		}
		else
		{
			nextStr = "NOTI" + nextNum;
			dtoNext = notiDao.noticeArticle(nextStr);
			request.setAttribute("nextStr", nextStr);
			request.setAttribute("nextTitle", dtoNext.getTitle());
		}
		
		view = "WEB-INF/views/admin/NoticeArticle.jsp";
		
		return view;
	}
	
	// 공지사항 글쓰기 페이지
	@RequestMapping(value="/noticeinsertform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeInsertForm(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		view = "/WEB-INF/views/admin/NoticeInsertForm.jsp";
		
		return view;
	}
	
	// 공지사항 글쓰기 동작
	@RequestMapping(value="/noticeinsert.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeInsert(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("admin");
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setAdminCd(dto.getCode());
		noticeDTO.setTitle(request.getParameter("title"));
		noticeDTO.setContent(request.getParameter("content").replace("\r\n", "<br>"));
		
		dao.noticeInsert(noticeDTO);
		
		view = "redirect:/noticelist.action";
		
		return view;
	}
	
	// 공지사항 삭제 동작
	@RequestMapping(value="/noticedelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDelete(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String notiCd = request.getParameter("notiCd");
		
		dao.noticeDelete(notiCd);
		
		view = "redirect:/noticelist.action";
		
		return view;
	}
	
	// 공지사항 수정 페이지
	@RequestMapping(value="/noticeupdateform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdateForm(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		String notiCd = request.getParameter("notiCd");
		
		NoticeDTO dto = new NoticeDTO();
		
		dto = dao.adminNoticeArticle(notiCd);
		dto.setContent(dto.getContent().replace("<br>", "\r\n"));
		model.addAttribute("article", dto);
		
		view = "/WEB-INF/views/admin/NoticeUpdateForm.jsp";
		
		return view;
	}
	
	// 공지사항 수정 동작
	@RequestMapping(value="/noticeupdate.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdate(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		NoticeDTO dto = new NoticeDTO();
		
		String notiCd = request.getParameter("notiCd");
		dto.setNotiCd2(notiCd);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content").replace("\r\n", "<br>"));
		
		dao.noticeUpdate(dto);
		
		view = "/noticearticleform.action?notiCd=" + notiCd;
		
		return view;
	}
	
	
	
	// 회원관리 → 견주 리스트
	@RequestMapping(value="/ownerlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		model.addAttribute("ownerList", dao.ownerList());
		
		view = "/WEB-INF/views/admin/OwnerList.jsp";
		
		return view;
	}
	
	// 회원관리 → 견주 리스트 → 상세정보 보기
	@RequestMapping(value="/ownerdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ownerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		String userCd = request.getParameter("userCd");
		
		UserDTO dto = dao.ownerDetail(userCd);
		
		model.addAttribute("dto", dto);
		model.addAttribute("shareUser", dao.ownerShareUser(userCd));
		model.addAttribute("sharePet", dao.ownerSharePet(userCd));
		model.addAttribute("blkItem", dao.blkItem());
		
		view = "/WEB-INF/views/admin/OwnerDetail.jsp";
		
		return view;
	}
	
	
	
	// 회원관리 → 워커 리스트
	@RequestMapping(value="/workerlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		model.addAttribute("workerList", dao.workerList());
		
		view = "/WEB-INF/views/admin/WorkerList.jsp";
		
		return view;
	}
	
	// 회원관리 → 워커 리스트 → 상세정보 보기
	@RequestMapping(value="/workerdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String workerCd = request.getParameter("userCd");
		
		UserDTO dto = dao.workerDetail(workerCd);
		
		model.addAttribute("dto", dto);
		model.addAttribute("blkItem", dao.blkItem());
		
		view = "/WEB-INF/views/admin/WorkerDetail.jsp";
		
		return view;
	}
	
	// 활동정지 등록
	@RequestMapping(value="/stopterminsert.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String stopTermInsert(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO dto = new UserDTO();
		
		dto.setCode(request.getParameter("code"));
		dto.setStopNum(Integer.parseInt(request.getParameter("stopTerm")));
		
		dao.stopTermInsert(dto);
		
		String url = request.getHeader("referer").split("/")[4];
		
		if(url.equals("ownerdetail.action"))
			view = "redirect:/ownerlist.action";
		else if(url.equals("workerdetail.action"))
			view = "redirect:/workerlist.action";
		
		return view;
	}
	
	// 블랙리스트 등록
	@RequestMapping(value="/blacklistinsert.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String blackListInsert(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO dto = new UserDTO();
		
		dto.setCode(request.getParameter("code"));
		dto.setBlkItemCd(request.getParameter("blkItem"));
		
		dao.blkInsert(dto);
		
		String url = request.getHeader("referer").split("/")[4];
		
		if(url.equals("ownerdetail.action"))
			view = "redirect:/ownerlist.action";
		else if(url.equals("workerdetail.action"))
			view = "redirect:/workerlist.action";
		else if(url.equals("userbyeownerdetail.action"))
			view = "redirect:/userbyeownerlist.action";
		else if(url.equals("userbyeworkerdetail.action"))
			view = "redirect:/userbyeworkerlist.action";
		
		return view;
	}
	
	
	
	// 회원관리 → 탈퇴 회원 리스트 → 견주
	@RequestMapping(value="/userbyeownerlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userByeOwnerList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("ownerList", dao.userByeOwnerList());
		
		view = "/WEB-INF/views/admin/UserByeOwnerList.jsp";
		
		return view;
	}
	
	// 회원관리 → 탈퇴 회원 리스트 → 견주 상세보기
	@RequestMapping(value="/userbyeownerdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userByeOwnerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String userCd = request.getParameter("userCd");
		
		UserDTO dto = dao.ownerDetail(userCd);
		
		model.addAttribute("dto", dto);
		model.addAttribute("shareUser", dao.ownerShareUser(userCd));
		model.addAttribute("sharePet", dao.ownerSharePet(userCd));
		model.addAttribute("blkItem", dao.blkItem());
		
		view = "/WEB-INF/views/admin/UserByeOwnerDetail.jsp";
		
		return view;
	}
	
	// 회원관리 → 탈퇴 회원 리스트 → 워커
	@RequestMapping(value="/userbyeworkerlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userByeWorkerList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("workerList", dao.userByeWorkerList());
		
		view = "/WEB-INF/views/admin/UserByeWorkerList.jsp";
		
		return view;
	}
	
	// 회원관리 → 탈퇴 회원 리스트 → 워커 상세보기
	@RequestMapping(value="/userbyeworkerdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userByeWorkerDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String workerCd = request.getParameter("userCd");
		
		UserDTO dto = dao.workerDetail(workerCd);
		
		model.addAttribute("dto", dto);
		model.addAttribute("blkItem", dao.blkItem());
		
		view = "/WEB-INF/views/admin/UserByeWorkerDetail.jsp";
		
		return view;
	}
	
	
	
	// 회원관리 → 활동정지 회원 리스트
	@RequestMapping(value="/userstoplist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userStopList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("userStopList", dao.userStopList());
		
		view = "/WEB-INF/views/admin/UserStopList.jsp";
		
		return view;
	}
	
	// 회원관리 → 활동정지 회원 → 정지 해제
	@RequestMapping(value="/userstopdone.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String userStopDone(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.userStopDone(request.getParameter("code"));
		
		view = "redirect:/userstoplist.action";
		
		return view;
	}
	
	
	
	// 회원관리 → 블랙 리스트
	@RequestMapping(value="/blacklist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String blackList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("blackList", dao.blackList());
		
		view = "/WEB-INF/views/admin/BlackList.jsp";
		
		return view;
	}
	
	// 회원관리 → 블랙 리스트 삭제
	@RequestMapping(value="/blackdelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String blackDelete(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.blackDelete(request.getParameter("code"));
		
		view = "redirect:/blacklist.action";
		
		return view;
	}
	
	
	
	// 회원관리 → 관리자 리스트
	@RequestMapping(value="/adminlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("adminList", dao.adminList());
		
		view = "/WEB-INF/views/admin/AdminList.jsp";
		
		return view;
	}
	
	// 회원관리 → 관리자 등록
	@RequestMapping(value="/admininsert.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminInsert(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO dto = new UserDTO();
		
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));
		
		dao.adminInsert(dto);
		
		view = "redirect:/adminlist.action";
		
		return view;
	}
	
	// 회원관리 → 관리자 비밀번호 초기화
	@RequestMapping(value="/adminpwreset.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPwReset(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		UserDTO dto = new UserDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setTel(request.getParameter("tel"));
		
		dao.adminPwReset(dto);
		
		view = "redirect:/adminlist.action";
		
		return view;
	}
	
	// 회원관리 → 관리자 삭제
	@RequestMapping(value="/admindelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminDelete(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.adminDelete(request.getParameter("id"));
		
		view = "redirect:/adminlist.action";
		
		return view;
	}
	
	
	
	// 회원관리 → 신청 확인 → 워커 신청 리스트
	@RequestMapping(value="/workerapplylist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerApplyList(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("workerApplyList", dao.workerApplyList());
		
		view = "/WEB-INF/views/admin/WorkerApplyList.jsp";
		
		return view;
	}
	
	// 회원관리 → 신청 확인 → 워커 신청 상세보기
	@RequestMapping(value="/workerapplydetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerApplyDetail(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;

		UserDTO userDTO = (UserDTO)request.getSession().getAttribute("admin");
		
		model.addAttribute("adminInfo", userDTO);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String workerCd = request.getParameter("wokApplyCd");
		
		model.addAttribute("dto", dao.workerApplyDetail(workerCd));
		model.addAttribute("crtList", dao.workerCrtList(workerCd));
		model.addAttribute("psbList", dao.workerPsbList(workerCd));
		model.addAttribute("workerNoItemList", dao.workerNoItemList());
		
		view = "/WEB-INF/views/admin/WorkerApplyDetail.jsp";
		
		return view;
	}
	
	// 회원관리 → 신청 확인 → 워커 등록
	@RequestMapping(value="/workerok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerOk(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("admin");
		
		dto.setWokCd(request.getParameter("wokApplyCd"));
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.workerok(dto);

		view = "redirect:/workerapplylist.action";
		
		return view;
	}
	
	// 회원관리 → 신청 확인 → 워커 거절
	@RequestMapping(value="/workerno.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String workerNo(Model model, HttpServletRequest request) throws SQLException
	{
		String view = null;
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("admin");
		
		dto.setItemCd(request.getParameter("noItem"));
		dto.setWokCd(request.getParameter("wokApplyCd"));
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.workerno(dto);
		
		view = "redirect:/workerapplylist.action";
		
		return view;
	}
}
