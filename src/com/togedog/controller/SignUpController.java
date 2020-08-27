package com.togedog.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.togedog.model.IPetDAO;
import com.togedog.model.IUserDAO;
import com.togedog.util.Coolsms;
import com.togedog.vo.CrtDTO;
import com.togedog.vo.JobDTO;
import com.togedog.vo.PetDTO;
import com.togedog.vo.UserDTO;
import com.togedog.vo.VacDTO;

@Controller
public class SignUpController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 최초 회원가입 페이지 요청(견주, 워커 선택 페이지)
	@RequestMapping(value = "/signupselect.action", method = RequestMethod.GET)
	public String signUpSelect(Model model) throws SQLException
	{
		return "WEB-INF/views/SignupSelect.jsp"; 
	}
	
	// 견주 회원가입 완료 페이지에서 산책하러가기 요청
	@RequestMapping(value = "/walkgogo.action", method = RequestMethod.GET)
	public String signUpMaingo() throws SQLException
	{
		return "WEB-INF/views/Main.jsp";
	}
	
	// 문자 본인인증
	@RequestMapping(value="/certTel.action", method = RequestMethod.POST)
	public String certUser(HttpServletRequest request) throws SQLException
	{	
		// 인증받을 번호 수신
		String certTel = request.getParameter("certTel");
		
		// 번호 중복 체크
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		int telCheck = dao.telCheck(certTel);
		
		// 중복된 번호가 아니라면 
		if(telCheck == 0)
		{
			// 6자리 랜덤 숫자 생성 
			Random random = new Random();
			String randomNum = "";
			
			for(int i =0; i<6; i++)
			{
				randomNum += Integer.toString(random.nextInt(10));
				
			}
			
			// 회원에게 문자 발송
			//Coolsms.sendMsg(certTel, randomNum);
			System.out.println(randomNum);
			
			request.setAttribute("result", randomNum);
		}
		// 중복된 번호라면 
		else if(telCheck != 0) 
		{
			request.setAttribute("result", 0);
		}
		
		return "WEB-INF/views/ajax.jsp";
	}
	
	
	// 견주 시작 -----------------------------------------------------------------------------------------------------
	
	
	// 신규견주 회원가입폼 요청
	@RequestMapping(value = "/ownsignupform.action", method = RequestMethod.GET)
	public String ownSignUpForm(HttpServletRequest request, Model model) throws SQLException
	{
		// 관심사 항목 리스트
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		List<UserDTO> intrList = dao.getIntrList();
		model.addAttribute("intrList", intrList);
		
		// 은행 리스트
		List<UserDTO> bankList = dao.getBankList();
		model.addAttribute("bankList", bankList);
		
		// 주소 시도 리스트
		List<UserDTO> sdList = dao.getSdList();
		model.addAttribute("sdList", sdList);
		
		model.addAttribute("type", "owner");
		
		return "WEB-INF/views/SignupCommonOwn.jsp";
	}
	
	
	// 신규견주 회원가입 액션 요청
	@RequestMapping(value= "/ownsignup.action" , method = RequestMethod.POST)
	public String ownSignUp(HttpServletRequest request, ModelMap model) throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		//1. 뷰페이지에서 값 받아오기 
		String id = request.getParameter("id");					// 아이디
		String pwd = request.getParameter("pwd");				// 비밀번호
		String name = request.getParameter("name");				// 이름
		String birthday = request.getParameter("birthday");		// 생년월일 
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + email2;							//이메일
		
		String addr3 =  request.getParameter("addrSel3");		// 주소3 코드
		String addrDetail = request.getParameter("addrDetail"); // 상세주소
		String tel = request.getParameter("tel");				// 전화번호
		String gender = request.getParameter("gender");			// 성별코드
		String intr = request.getParameter("intr");				// 관심사 코드
		String intrDetail = request.getParameter("intrDetail");	// 상세 관심사
		String nickName = request.getParameter("nickName");		// 닉네임
		String dayCd = request.getParameter("day");				// 선호요일 
		
		int favStart = Integer.parseInt(request.getParameter("favStart"));	// 선호 시작시간
		int favEnd = Integer.parseInt(request.getParameter("favEnd"));		// 선호 끝 시간
		
		String accNum = request.getParameter("accNum");			// 계좌번호
		String bankCd = request.getParameter("bankCd");     	// 은행코드
		
		String photo = request.getParameter("photo");			// 사진
		
		
		// 닉네임 null 이면 id 가 닉네임
		if(nickName.equals(""))
		{
			nickName = id;
		}
		
		//2. dto 생성 
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setUserTypeCd("UT1");
		dto.setAddrCd3(addr3);
		dto.setAddrDetail(addrDetail);
		dto.setBankCd(bankCd);
		dto.setAccNum(accNum);
		dto.setGenderCd(gender);
		dto.setEmail(email);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setBirthday(birthday);
		dto.setTel(tel);
		dto.setIntrCd(intr);
		dto.setIntrDetail(intrDetail);
		dto.setNickName(nickName);
		dto.setDayCd(dayCd);
		dto.setFavStart(favStart);
		dto.setFavEnd(favEnd);
		dto.setPhoto(photo);
		
		//3. IUserDAO 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		//4. 견주 등록 프로시저 호출 
		dao.ownAdd(dto);
		String ownCd = dto.getResult(); //이런 방식으로 OUT 변수 받는 것 
		
		//5. 포인트 등록
		
		// 5-1. 추천인 포인트 등록
		String recId = request.getParameter("recId"); // 추천인 아이디
		
		if(!recId.equals(""))// 추천인이 있으면 
		{ 
			// 내가 6점   
			UserDTO myPoint = new UserDTO();
			myPoint.setPointItemCd("PI9");
			myPoint.setOwnCd(ownCd);
			dao.insertPoint(myPoint);
			
			// 상대가 3점
			UserDTO yourPoint = new UserDTO();
			yourPoint.setPointItemCd("PI10");
			yourPoint.setOwnCd(dao.getOwnCd(recId));
			dao.insertPoint(yourPoint);
		}	
		
		// 회원가입 포인트는 프로시저로..

		
		model.addAttribute("ownCd", ownCd);
		
		// 강아지 등록여부 선택 페이지 요청
		return "WEB-INF/views/SignupSelect2.jsp"; 
	}
	
	
	// 강아지 등록폼 요청
	@RequestMapping(value="/addPetForm.action", method= RequestMethod.GET)
	public String addPetInfo(HttpServletRequest request, Model model) throws SQLException
	{
		// 신규가입할때는 세션에 견주코드 값이 없으니까 직접 받아와야한다
		String ownCd = request.getParameter("ownCd");
		//System.out.println(ownCd);
		
		//예방접종 리스트  
	    IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
	    List<VacDTO> vacList  = petDao.getVacList();      
	    
	    model.addAttribute("vacList",vacList);
	      
	    // 견종리스트 
	    List<PetDTO> dogItemList = petDao.getDogItemList();
	    model.addAttribute("dogItemList",dogItemList);
		
		model.addAttribute("ownCd", ownCd);
		
		return "WEB-INF/views/PetAdd.jsp";
	}
	
	
	//강아지 등록 액션 
   @RequestMapping(value="/addPet.action", method = RequestMethod.POST)
   public String petAddForm(HttpServletRequest request, Model model) throws SQLException, UnsupportedEncodingException
   {
	   request.setCharacterEncoding("UTF-8");
		
	   
	   // 1. 견주코드 받기(신규가입시 세션에 견주코드가 없으니 직접 받아오기)
	  String ownCd = request.getParameter("ownCd");
	   
      // 2. 강아지 등록하기
      PetDTO pet = new PetDTO();
      
      //3. 뷰에서 값 받아오기 
      pet.setPetPhoto(request.getParameter("photo"));			// 사진
      pet.setPetName(request.getParameter("petName"));			// 이름
      pet.setPetBirthday(request.getParameter("petBirthday"));	// 생년월일
      pet.setPetGenderCd(request.getParameter("petGenderCd"));	// 성별코드
      pet.setNeutralDate(request.getParameter("neutralDate"));	// 중성화일시
      pet.setWeight(Double.parseDouble(request.getParameter("weight")));	// 몸무게
      pet.setDogItemCd(request.getParameter("dogItemCd"));		// 견종
      pet.setOwnCd(ownCd);	// 견주코드
      
      String disa = request.getParameter("disa");		// 장애있으면 "1"
      String allerge = request.getParameter("allerge");	// 알러지 있으면 "1"
      String disaName = request.getParameter("disaName"); 			// 장애내용
      String allergeName = request.getParameter("allergeName");	// 알러지내용	  
    
     
      pet.setAllergeName(allergeName);
      pet.setDisaName(disaName);
      
      //4. 강아지 등록 프로시저 실행 
      IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
      petDao.petAdd(pet);
      
      //5. 반환하는 펫코드 담기
      String petCd = pet.getResult();	// 반환하는 펫 코드

      //6. 장애 등록
      if(disa.equals("1"))
      {
    	  PetDTO dto = new PetDTO();
    	  dto.setPetCd(petCd);
    	  dto.setDisaName(disaName);
    	  
    	  // 장애등록 프로시저 실행
    	  petDao.insertDisable(dto);
      }
      
      //7. 알러지 등록
      if(allerge.equals("1"))
      {
    	  PetDTO dto = new PetDTO();
    	  dto.setPetCd(petCd);
    	  dto.setAllergeName(allergeName);
    	  
    	  // 알러지등록 프로시저 실행
    	  petDao.insertAllerge(dto);
      }
      
     
      //8. 예방접종 insert
      String[] vacList =  request.getParameterValues("vacList"); // 예방접종 코드들
      
      if(vacList != null)
      {
    	  for(String vac : vacList )  // 넘어온 예방접종 수만큼 반복
          {
        	  PetDTO dto = new PetDTO();
        	  dto.setPetCd(petCd);
        	  dto.setVacCd(vac);
        	  
        	  petDao.insertVac(dto); // 예방접종 내역 테이블 등록
          }
      }

      // 더 추가할 경우를 고려하여 견주 코드 담아서 보내기
      model.addAttribute("ownCd", ownCd);
      
      // 강아지 더 추가할건지 묻는 페이지 요청하기(수정해야함)
      return "WEB-INF/views/SignupSelect3.jsp";
   }
	
	
	// 견주가입완료 페이지 요청
	@RequestMapping(value="/addOwnComp.action", method= RequestMethod.GET)
	public String addOwnComp() throws SQLException
	{
		return "WEB-INF/views/SignupOwnerComp.jsp";
	}
	
	// 추가 견주 등록 폼 요청(워커 → 견주)
	@RequestMapping(value="/addownform.action", method = RequestMethod.GET)
	public String addownform(Model model) throws SQLException
	{
		// 관심사 항목 리스트
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		List<UserDTO> intrList = dao.getIntrList();
		model.addAttribute("intrList", intrList);
		
		return "WEB-INF/views/SignupOwn.jsp";
	}
	
	// 추가 견주 등록 액션
	@RequestMapping(value = "/addown.action", method = { RequestMethod.POST, RequestMethod.GET})
	public String addown(HttpServletRequest request, Model model) throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		//1. 세션에서 회원코드 받기
		UserDTO userDto = (UserDTO)request.getSession().getAttribute("user");
		
		String userCd = userDto.getCode();
		System.out.println(userCd);
		
		
		//2.. 뷰페이지에서 값 받아오기 
		String intr = request.getParameter("intr");				// 관심사 코드
		String intrDetail = request.getParameter("intrDetail");	// 상세 관심사
		String nickName = request.getParameter("nickName");		// 닉네임
		String dayCd = request.getParameter("day");				// 선호요일 
		
		int favStart = Integer.parseInt(request.getParameter("favStart"));	// 선호 시작시간
		int favEnd = Integer.parseInt(request.getParameter("favEnd"));		// 선호 끝 시간
		
		//2. dto 생성 
		UserDTO dto = new UserDTO();
		dto.setCode(userCd);
		dto.setIntrCd(intr);
		dto.setIntrDetail(intrDetail);
		dto.setNickName(nickName);
		dto.setDayCd(dayCd);
		dto.setFavStart(favStart);
		dto.setFavEnd(favEnd);
		
		//3. IUserDAO 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		//4. 추가견주 등록 프로시저 호출 
		dao.addown(dto);
		
		String ownCd = dto.getResult(); //이런 방식으로 OUT 변수 받는 것 
	
		// 5. 회원타입 변경(워커 → 견주겸워커)
		dao.updateUserType(userCd);
		
		
		// 6. 추천인 포인트 등록
		String recId = request.getParameter("recId"); // 추천인 아이디
		
		if(recId != "");// 추천인이 있으면 
		{
			//추천인 포인트 등록 dao 두번 실행 
			// 내 견주코드 포인트코드 → 6점  
			UserDTO myPoint = new UserDTO();
			myPoint.setPointItemCd("PI9");
			myPoint.setOwnCd(ownCd);
			
			dao.insertPoint(myPoint);
			
			// 상대 아이디로 상대 견주코드 → 3점
			UserDTO yourPoint = new UserDTO();
			yourPoint.setPointItem("PI10");
			yourPoint.setOwnCd(dao.getOwnCd(recId));
			
		}	
		
		model.addAttribute("ownCd", ownCd);
		
		// 강아지 등록여부 선택 페이지 요청
		return "WEB-INF/views/SignupSelect2.jsp";
	}
	
	
	
	// 견주 완료 --------------------------------------------------------------------------
	

	// 워커 시작 ---------------------------------------------------------------------------
	
	// 추가워커신청 화면폼 요청(견주→워커)
	@RequestMapping(value = "/addwokform.action", method = RequestMethod.GET)
	public String addwokForm(Model model) throws SQLException
	{
		// 자격증 리스트
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		List<CrtDTO> crtList = dao.getCrtList();
		model.addAttribute("crtList",crtList);
		
		// 직업리스트
		List<JobDTO> jobList = dao.getjobList();
		model.addAttribute("jobList", jobList);
		
		// 요일리스트
		List<UserDTO> dayList = dao.getDays();
		model.addAttribute("dayList", dayList);
		
		model.addAttribute("type", "worker");
		
		return "WEB-INF/views/SignupWorker.jsp";
	}
	
	// 추가 워커신청 등록 액션
	@RequestMapping(value = "/addworker.action", method = RequestMethod.POST)
	public String addWok(HttpServletRequest request)throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		// 세션에서 회원 dto 얻기 
		UserDTO userDto = (UserDTO)request.getSession().getAttribute("user");
		//System.out.println(userDto.getCode());
		
		// 수신한 데이터 담기
		String jobCd = request.getParameter("jobCd");		
		String careerName = request.getParameter("careerName");
		String nurtureExp = request.getParameter("nurtureExp");
		String question1 = request.getParameter("question1");
		String question2 = request.getParameter("question2");
		String msg = request.getParameter("msg");
		
		
		// dto 구성
		UserDTO dto = new UserDTO();
		dto.setCode(userDto.getCode()); // 회원코드
		dto.setJobCd(jobCd);			// 직업코드
		dto.setCareerName(careerName);	// 경력사항
		dto.setNurtureExp(nurtureExp);	// 양육경험
		dto.setQuestion1(question1); 	// 질문1
		dto.setQuestion2(question2);	// 질문2
		dto.setMsg(msg);				// 신청메세지
		
		// 워커 추가 등록 프로시저 
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		dao.addwok(dto);
		
		// 워커코드 반환 
		String wokCd = dto.getResult();
		
		//System.out.println(wokCd);
		
		// 자격증 등록 
		String[] crtList = request.getParameterValues("crtList");
		
		if(crtList != null)
		{
			for (String crtCd : crtList)
			{
				UserDTO crtDto= new UserDTO();
				crtDto.setCrtCd(crtCd);
				crtDto.setWokCd(wokCd);
				// 자격증 등록
				dao.crtAdd(crtDto);
			}
		}
		
		// 근무 요일 및  시간 등록
		String[] days = request.getParameterValues("selDayCd");			// 근무가능 요일코드들
		//System.out.println(days[0] + " / " + days[1]); 
		
		String[] favStart = request.getParameterValues("selFavStart");	// 시작 시간들
		//System.out.println(favStart[0] + " / " + favStart[1]); 
		
		String[] favEnd = request.getParameterValues("selFavEnd");		// 끝 시간들
		//System.out.print(favEnd[0] + " / " + favEnd[1]);
		
		for(int i=0; i<days.length; i++)
		{
			UserDTO day = new UserDTO();
			day.setWokCd(wokCd);
			day.setDayCd(days[i]);
			day.setFavStart(Integer.parseInt(favStart[i]));
			day.setFavEnd(Integer.parseInt(favEnd[i]));
			
			// 근무가능 입력 프로시저 호출
			dao.addWorkDay(day);
		}
		
		return "WEB-INF/views/WorkerApplyResult.jsp";
	}
	
	// 신규워커 신청 화면폼 요청
	@RequestMapping(value = "/woksignupform.action", method = RequestMethod.GET)
	public String wokSignUpForm(Model model) throws SQLException
	{
		// 자격증 리스트
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		List<CrtDTO> crtList = dao.getCrtList();
		model.addAttribute("crtList",crtList);
		
		// 은행 리스트
		List<UserDTO> bankList = dao.getBankList();
		model.addAttribute("bankList", bankList);
		
		// 주소 시도 리스트
		List<UserDTO> sdList = dao.getSdList();
		model.addAttribute("sdList", sdList);
		
		// 직업리스트
		List<JobDTO> jobList = dao.getjobList();
		model.addAttribute("jobList", jobList);
		
		// 요일리스트
		List<UserDTO> dayList = dao.getDays();
		model.addAttribute("dayList", dayList);
		
		model.addAttribute("type", "worker");
		
		return "WEB-INF/views/SignupCommonWorker.jsp";
	}
	
	// 워커 근무요일 및 시간 추가 시 뷰에 추가되도록..
	@RequestMapping(value = "/addWorkdays.action", method = RequestMethod.POST)
	public String addWorkdays(HttpServletRequest request) throws SQLException
	{
		String dayCd = request.getParameter("dayCd");	
		String favStart = request.getParameter("favStart");
		String favEnd = request.getParameter("favEnd");
		
		String day = "";
		
		if(dayCd.equals("DI1"))
		{
			day = "월요일"; 
		}
		else if(dayCd.equals("DI2"))
		{
			day="화요일";
		}
		else if(dayCd.equals("DI3"))
		{
			day="수요일";
		}
		else if(dayCd.equals("DI4"))
		{
			day="목요일";
		}
		else if(dayCd.equals("DI5"))
		{
			day="금요일";
		}
		else if(dayCd.equals("DI6"))
		{
			day="토요일";
		}
		else if(dayCd.equals("DI7"))
		{
			day="일요일";
		}
		
		request.setAttribute("dayCd", dayCd);
		request.setAttribute("day", day);
		request.setAttribute("favStart", favStart);
		request.setAttribute("favEnd", favEnd);
		
		
		return "WEB-INF/views/ajaxAddWorkdays.jsp";
	}
	
	// 워커 신청 액션 요청
	@RequestMapping( value = "addWorker.action" , method = RequestMethod.POST)
	public String wokSignUp(HttpServletRequest request) throws SQLException, UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		
		// 1. 수신한 데이터 담기
		String id = request.getParameter("id");					// 아이디 
		String addrCd = request.getParameter("addrSel3");		// 주소코드
		String addrDetail = request.getParameter("addrDetail");	// 상세주소
		String bankCd = request.getParameter("bankCd");			// 은행코드
		String accNum = request.getParameter("accNum");			// 계좌번호
		String gender = request.getParameter("gender");			// 성별코드

		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + email2;							//이메일
		
		String pwd = request.getParameter("pwd");				// 비밀번호
		String name = request.getParameter("name");				// 이름
		String birthday = request.getParameter("birthday");		// 생년월일
		String tel = request.getParameter("tel");				// 전화번호
		String jobCd = request.getParameter("jobCd");			// 직업코드
		String nurtureExp = request.getParameter("nurtureExp");	// 양육경험
		String careerName = request.getParameter("careerName");	// 경력사항
		String msg = request.getParameter("msg");				// 신청메세지
		String question1 = request.getParameter("question1");	// 질문1
		String question2 = request.getParameter("question2");	// 질문2
		String photo = request.getParameter("photo");			// 사진
		
		
		// 2. dto 구성
		UserDTO dto = new UserDTO();

		dto.setId(id);
		dto.setUserTypeCd("UT2");
		dto.setAddrCd3(addrCd);
		dto.setAddrDetail(addrDetail);
		dto.setBankCd(bankCd);
		dto.setAccNum(accNum);
		dto.setGenderCd(gender);
		dto.setEmail(email);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setBirthday(birthday);
		dto.setTel(tel);
		dto.setJobCd(jobCd);
		dto.setNurtureExp(nurtureExp);
		dto.setCareerName(careerName);
		dto.setMsg(msg);
		dto.setQuestion1(question1);
		dto.setQuestion2(question2);
		dto.setPhoto(photo);
		
		// dao 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		//워커 신청 프로시저 호출 -- 워커 등록
		dao.wokAdd(dto);
		
		// 반환값(워커코드) 담기
		String wokCd = dto.getResult();
		//System.out.println(wokCd); 확인
		
		//2. 워커 자격증들 등록하기 (입력받은 자격증 배열 길이만큼 반복하게 해야함

		String[] crtList = request.getParameterValues("crtList");	// 자격증 코드들 받아오기
		
		if(crtList.length !=0)
		{
			for(String crtCd : crtList)
			{
				UserDTO crt= new UserDTO();
				crt.setCrtCd(crtCd);
				crt.setWokCd(wokCd);
				// 자격증 등록
				dao.crtAdd(crt);
				
				//System.out.println(crtCd); 확인
				//System.out.println(wokCd); 확인
			}
		}
		
		//3. 워커 근무가능 요일과 시간들 등록하기 
		String[] days = request.getParameterValues("selDayCd");			// 근무가능 요일코드들
		//System.out.println(days[0] + " / " + days[1]); 
		
		String[] favStart = request.getParameterValues("selFavStart");	// 시작 시간들
		//System.out.println(favStart[0] + " / " + favStart[1]); 
		
		String[] favEnd = request.getParameterValues("selFavEnd");		// 끝 시간들
		//System.out.print(favEnd[0] + " / " + favEnd[1]);
		
		for(int i=0; i<days.length; i++)
		{
			UserDTO day = new UserDTO();
			day.setWokCd(wokCd);
			day.setDayCd(days[i]);
			day.setFavStart(Integer.parseInt(favStart[i]));
			day.setFavEnd(Integer.parseInt(favEnd[i]));
			
			// 근무가능 입력 프로시저 호출
			dao.addWorkDay(day);
		}
		
		
		return "WEB-INF/views/WorkerApplyResult.jsp";
	}
	
	
	// 회원가입폼 주소(시군구) ajax 처리 0725 추가 
	@RequestMapping(value="/getsgglist.action", method = RequestMethod.GET)
	public String getSggList(HttpServletRequest request,  Model model) throws SQLException
	{
		String addrSel1 = request.getParameter("addrSel1");
		
		// dao 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		List<UserDTO> result = dao.getSggList(addrSel1);
		
		
		model.addAttribute("result", result);
		return "WEB-INF/views/ajaxAddrSgg.jsp";
	}
	
	// 회원가입폼 주소(동읍면) ajax 처리 0725 추가
	@RequestMapping(value="/getdemlist.action", method = RequestMethod.GET )
	public String getDemList(HttpServletRequest request,  Model model) throws SQLException
	{
		String addrSel2 = request.getParameter("addrSel2");
		
		// dao 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		List<UserDTO> result = dao.getDemList(addrSel2);
		
		
		model.addAttribute("result", result);
		return "WEB-INF/views/ajaxAddrDem.jsp";
	}
	
	
	// 아이디 중복 체크
	@RequestMapping(value="/idCheck.action", method = RequestMethod.GET) 
	public String idCheck(String id, Model model) throws SQLException 
	{
	  // DAO 주입
	  IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	  int result = dao.idCheck(id);  
	  
	  model.addAttribute("result",result);
	  
	  return "WEB-INF/views/ajax.jsp"; 
	 
	}
	
	//닉네임 중복체크 
	@RequestMapping(value="/nickCheck.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String nickCheck(String nickName, Model model) throws SQLException
	{
		// dao 주입
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		int result = dao.nickCheck(nickName);
		
		model.addAttribute("result", result);
		
		return "/WEB-INF/views/ajax.jsp";
	}
	
	// 추천인 존재 확인 
	@RequestMapping(value="recIdCheck.action", method = RequestMethod.GET)
	public String recIdCheck(HttpServletRequest request) throws SQLException
	{
		String recId = request.getParameter("recId");
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		int result = dao.idCheck(recId);
		
		request.setAttribute("result", result);
		
		return "/WEB-INF/views/ajax.jsp";
	}
	
	
	
} 