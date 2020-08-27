package com.togedog.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.togedog.model.IMatchingDAO;
import com.togedog.model.IMiaryDAO;
import com.togedog.model.IUserDAO;
import com.togedog.vo.MatchingDTO;
import com.togedog.vo.ParamDTO;
import com.togedog.vo.UserDTO;

@Controller
public class MatchingController
{
	@Autowired
	private SqlSession sqlSession;

	// 1차 추천 리스트
	@RequestMapping(value = "recommandfirst.action", method = RequestMethod.GET)
	public ModelAndView recommandFirst(HttpServletRequest request) throws SQLException
	{
		ModelAndView mav = new ModelAndView();

		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);

		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");

		String gender_cd = request.getParameter("genderType");
		String petCd = request.getParameter("petRep");
		MatchingDTO own = dao.getOwn(dto.getCode());
		MatchingDTO pet = dao.getPet(petCd);

		MatchingDTO mDto = new MatchingDTO();
		// mDto.setIntrCd(own.getIntrCd()); // 관심사 코드(유저)
		mDto.setOwnCd(own.getOwnCd());
		mDto.setIntrCd("II15");
		mDto.setAddrCd1(request.getParameter("addrSel1")); // 주소1 코드(등록)
		mDto.setAddrCd2(request.getParameter("addrSel2")); // 주소2 코드(등록)
		mDto.setAddrCd3(request.getParameter("addrSel3")); // 주소3 코드(등록)
		mDto.setAddrDetail(request.getParameter("addrDetail"));
		mDto.setWalkDate(request.getParameter("fromDate")); // 산책 날짜(등록)
		mDto.setStartTime(request.getParameter("startTime")); // 시작 시간(등록)
		mDto.setEndTime(request.getParameter("endTime")); // 끝 시간(등록)
		mDto.setPetCd(petCd);
		mDto.setPetGenderCd(pet.getPetGender()); // 펫 성별 코드(펫)
		mDto.setGradeCd(own.getGradeCd()); // 단계 코드(유저)
		mDto.setOwnCd(own.getOwnCd()); // 내 견주 코드(유저)
		mDto.setPetAge(pet.getPetAge()); // 펫 나이(펫)
		mDto.setAge(own.getAge()); // 견주 나이(유저)
		mDto.setWeight(pet.getWeight()); // 펫 무게(펫)
		mDto.setGenderCd(gender_cd); // 성별 선택(등록)

		String petSel[] = request.getParameterValues("petSel");

		mav.addObject("list", dao.walkList1(mDto));
		request.getSession().setAttribute("insert", mDto);
		request.getSession().setAttribute("petSel", petSel);

		mav.setViewName("WEB-INF/views/RecommandFirst.jsp");
		return mav;
	}

	// 2차 추천 리스트
	@RequestMapping(value = "recommandsecond.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandSecond(Model model, HttpServletRequest request) throws SQLException
	{
		String view = "WEB-INF/views/RecommandSecond.jsp";
		return view;
	}

	@RequestMapping(value = "recommandsecondajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandSecondAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);

		UserDTO udto = (UserDTO)request.getSession().getAttribute("user");
		
		String filter = request.getParameter("filter");
		String order = request.getParameter("order");
		String by = request.getParameter("by");
		
		ParamDTO dto = new ParamDTO();
		System.out.println(udto.getCode());
		dto.setCode(udto.getCode());
		dto.setFilter(filter);
		dto.setOrder(order);
		dto.setBy(by);

		model.addAttribute("secondList", dao.walkList2(dto));

		String view = "WEB-INF/views/RecommandSecondAjax.jsp";
		return view;
	}

	// 1차 추천 리스트 견주 정보
	@RequestMapping(value = "recommandfirstownajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandFirstOwnAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		String walkCd = request.getParameter("walkCd");

		model.addAttribute("list", dao.walkDetailOwn(walkCd));

		return "WEB-INF/views/RecommandFirstOwnAjax.jsp";
	}

	// 1차 추천 리스트 펫 정보
	@RequestMapping(value = "recommandfirstpetajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandFirstPetAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		String walkCd = request.getParameter("walkCd");

		model.addAttribute("list", dao.walkDetailPet(walkCd));

		return "WEB-INF/views/RecommandFirstPetAjax.jsp";
	}

	// 1차 추천 리스트 펫 장애 정보
	@RequestMapping(value = "recommandfirstpetdisableajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandFirstPetDisableAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		String walkCd = request.getParameter("walkCd");

		model.addAttribute("list", dao.walkDetailPetDisable(walkCd));

		return "WEB-INF/views/RecommandFirstPetDisableAjax.jsp";
	}

	// 1차 추천 리스트 펫 알러지 정보
	@RequestMapping(value = "recommandfirstpetallergeajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandFirstPetAllergeAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		String walkCd = request.getParameter("walkCd");

		model.addAttribute("list", dao.walkDetailPetAllerge(walkCd));

		return "WEB-INF/views/RecommandFirstPetAllergeAjax.jsp";
	}

	// 1차 추천 리스트 이전 피드백
	@RequestMapping(value = "recommandfirstownfdbitemajax.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String recommandFirstPetFdbAjax(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		String walkCd = request.getParameter("walkCd");

		model.addAttribute("list", dao.walkDetailOwnFdbItem(walkCd));

		return "WEB-INF/views/RecommandFirstOwnFdbItemAjax.jsp";
	}

	// 견주 일대일매칭 정보 입력
	@RequestMapping(value = "/walkmatchinsert.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String walkMatchInsert(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		IUserDAO userDao = sqlSession.getMapper(IUserDAO.class);
		IMiaryDAO mDao = sqlSession.getMapper(IMiaryDAO.class);

		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");
		
		dto = mDao.getOwnInfo(dto.getCode());
		
		model.addAttribute("sdList", userDao.getSdList());
		model.addAttribute("sggList", userDao.getSggList(dto.getAddrCd1()));
		model.addAttribute("demList", userDao.getDemList(dto.getAddrCd2()));

		model.addAttribute("gender_cd", dao.getGender(dto.getCode()));
		model.addAttribute("pet_list", dao.walkPetSel(dto.getCode()));
		
		model.addAttribute("ownInfo", dto);

		String view = "/WEB-INF/views/WalkMatchInsert.jsp";
		return view;
	}

	@RequestMapping(value = "walkmatchinsertcomp.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String walkMatchingInsertComp(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		MatchingDTO dto = (MatchingDTO) request.getSession().getAttribute("insert");
		
		String walkCd = request.getParameter("walkCd");
		if(walkCd == null)
		{
			dao.matchOwnInsert(dto);
						
			walkCd = dto.getWalkCd();
		}
		else
		{
			UserDTO udto = (UserDTO)request.getSession().getAttribute("user");
			
			ParamDTO pdto = new ParamDTO();
			pdto.setCode(udto.getCode());
			pdto.setWalkCd(walkCd);
			
			dao.matchingSel(pdto);
			
			walkCd = pdto.getWalkCd2();
		}
		
		String petSel[] = (String[])request.getSession().getAttribute("petSel");
		for (int i = 0; i < petSel.length; i++)
		{
			ParamDTO pdto = new ParamDTO();
			pdto.setWalkCd(walkCd);
			pdto.setPetCd(petSel[i]);
			pdto.setPetRepCd(dto.getPetCd());
			
			dao.matchPetInsert(pdto);
		}
		
		request.getSession().removeAttribute("insert");
		request.getSession().removeAttribute("petSel");

		String view = "WEB-INF/views/WalkMatchInsertComp.jsp";
		return view;
	}

	// 견주 대행 신청 정보 입력
	@RequestMapping(value = "/agencymatchinsert.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String MiaryOwnerMainForm(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		IUserDAO userDao = sqlSession.getMapper(IUserDAO.class);
		IMiaryDAO mDao = sqlSession.getMapper(IMiaryDAO.class);
		
		UserDTO dto = (UserDTO) request.getSession().getAttribute("user");
		
		dto = mDao.getOwnInfo(dto.getCode());

		model.addAttribute("sdList", userDao.getSdList());
		model.addAttribute("sggList", userDao.getSggList(dto.getAddrCd1()));
		model.addAttribute("demList", userDao.getDemList(dto.getAddrCd2()));
		
		model.addAttribute("pet_list", dao.walkPetSel(dto.getCode()));
		model.addAttribute("bankList", userDao.getBankList());	
		model.addAttribute("agcPriceList", dao.getAgcPrice());
		model.addAttribute("petSizeList", dao.getPetSize());
		model.addAttribute("agcBasePrice", dao.getBasePrice());
		model.addAttribute("agcSubPrice", dao.getSubPrice());
		
		model.addAttribute("ownInfo", dto);
		
		String view = "/WEB-INF/views/AgencyMatchApply.jsp";
		return view;
	}
	
	@RequestMapping(value = "agencymatchinsertcomp.action", method =
	{RequestMethod.GET, RequestMethod.POST})
	public String agencyMatchInsertComp(HttpServletRequest request, Model model) throws SQLException
	{
		IMatchingDAO dao = sqlSession.getMapper(IMatchingDAO.class);
		UserDTO dto = (UserDTO)request.getSession().getAttribute("user");	
		MatchingDTO own = dao.getOwn(dto.getCode());
		
		MatchingDTO mDto = new MatchingDTO();
		mDto.setOwnCd(own.getOwnCd());
		mDto.setAddrCd1(request.getParameter("addrSel1")); // 주소1 코드(등록)
		mDto.setAddrCd2(request.getParameter("addrSel2")); // 주소2 코드(등록)
		mDto.setAddrCd3(request.getParameter("addrSel3")); // 주소3 코드(등록)
		mDto.setAddrDetail(request.getParameter("addrDetail"));
		mDto.setWalkDate(request.getParameter("fromDate")); // 산책 날짜(등록)
		mDto.setStartTime(request.getParameter("startTime")); // 시작 시간(등록)
		mDto.setEndTime(request.getParameter("endTime")); // 끝 시간(등록)
		
		dao.agcInsert(mDto);
		
		String petSel[] = request.getParameterValues("petSel");
		String petCd = request.getParameter("petRep");
		for(int i = 0; i < petSel.length; i++)
		{
			ParamDTO pDto = new ParamDTO();
			pDto.setAgcCd(mDto.getAgcCd());
			pDto.setPetCd(petSel[i]);
			pDto.setPetRepCd(petCd);
			
			dao.agcPetInsert(pDto);	
		}
		
		String view = "WEB-INF/views/AgencyMatchApplyComp.jsp";
		return view;
	}
}