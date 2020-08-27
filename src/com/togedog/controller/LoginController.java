 package com.togedog.controller;

import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.togedog.model.IUserDAO;
import com.togedog.vo.UserDTO;

@Controller
public class LoginController
{
   @Autowired
   private SqlSession sqlSession;
   
   // 로그인 화면
   @RequestMapping(value="/loginform.action", method=RequestMethod.GET)
   public String LoginForm(UserDTO u) throws SQLException
   {
	   String view = null;
	   
	   view = "WEB-INF/views/Login.jsp";
	   
	   return view;
   }
   
   // 로그인 동작
   @RequestMapping(value="/login.action", method=RequestMethod.POST)
   public String Login(Model model, HttpServletRequest request) throws SQLException
   {
	   HttpSession session = request.getSession(true);
	   session.removeAttribute("user");
	   session.removeAttribute("admin");

	   IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	   
	   String view = null;
	   
	   String id = request.getParameter("id");
	   String pwd = request.getParameter("pwd");
	   
	   // 회원 : 0 , 관리자 : 1
	   String type = request.getParameter("userSelect");
	   
	   // 테스트
	   //System.out.println("id : " + id + " pw : " + pw + "type : " + type);
	   
	   UserDTO dto = new UserDTO();
	   String code = null;
	   String stop = null;
	   String bye = null;
	   
	   dto.setId(id);
	   dto.setPwd(pwd);
	   if(type.equals("0"))
	   {
		   dao.loginUser(dto);
		   
		   code = dto.getCode();
		   stop = dto.getStoped();
		   bye = dto.getBye();
		   
	   }
	   else if(type.equals("1"))
	   {		   
		   dao.loginAdmin(dto);
		   
		   code = dto.getCode();
	   }
	   
	   if(code==null)
	   {
		   request.setAttribute("msg", "아이디 또는 패스워드가 맞지 않습니다.");
		   view = "WEB-INF/views/Login.jsp";
	   }
	   
	   else if(code != null)
	   {
		   if(type.equals("0"))
		   {
			   if(bye == null)
			   {
				   if(stop == null)
				   {
					   session.setAttribute("user", dto);
					   view = "/mainmenuform.action";
				   }
				   else
				   {
					   if(Integer.parseInt(stop) <=0 )
					   {
						   session.setAttribute("user", dto);
						   view = "/mainmenuform.action";
					   }
					   else
					   {
						   request.setAttribute("msg", "정지회원입니다.");
						   view = "WEB-INF/views/Login.jsp";
					   }
				   }
			   }
			   else
			   {
				   request.setAttribute("msg", "탈퇴회원입니다.");
				   view = "WEB-INF/views/Login.jsp";
			   }
			   
		   }
		   else if(type.equals("1"))
		   {
			   session.setAttribute("admin", dto);

			   view = "/adminmain.action";
		   }
	   }
	   
	   return view;
   }
   
   // 아이디 비밀번호 찾기
   @RequestMapping(value="/loginfindform.action", method=RequestMethod.GET)
   public String LoginFind(Model model) throws SQLException
   {
      //IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
      
      //model.addAttribute("list", dao.fdblist());
      
      return "WEB-INF/views/LoginFind.jsp";
   }
   
   // 로그아웃 액션
   @RequestMapping(value="/logout.action", method=RequestMethod.GET)
   public String Logout(HttpServletRequest request) throws SQLException
   {
	   String view = null;
	   
	   HttpSession session = request.getSession();
	   session.removeAttribute("user");
	   session.removeAttribute("admin");
	   
	   view = "WEB-INF/views/Login.jsp";
	   
	   return view; 
   }
   
   // id찾기 0724 추가
   @RequestMapping(value="/idfind.action", method=RequestMethod.GET)
   public String idfind(HttpServletRequest request, Model model) throws SQLException
   {
	   IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	   
	   String name = request.getParameter("name");
	   String tel = request.getParameter("tel");
	   
	   //System.out.println(name + tel);
	   
	   UserDTO dto = new UserDTO();
		
	   dto.setName(name);
	   dto.setTel(tel);
	   
	   String id = dao.findUserId(dto);
	   
	   if(id == null)
	   {
		   //System.out.println("회원정보가 일치하지 않습니다.");
		   request.setAttribute("msg1", "회원정보가 일치하지 않습니다.");
	   }
	   else if(id != null)
	   {
		   //System.out.println("회원님의 아이디는 " + id + "입니다.");
		   request.setAttribute("msg1", "회원님의 아이디는 " + id + "입니다.");
	   }
	   
	   return "WEB-INF/views/LoginFind.jsp";
   }
     
   // 비밀번호 찾고 수정하기 0725 추가
   @RequestMapping(value="/pwdfind.action", method=RequestMethod.GET)
   public String pwdModify(HttpServletRequest request, Model model) throws SQLException
   { 
	   IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	   
	   String id = request.getParameter("id2");
	   String name = request.getParameter("name2");
	   String tel = request.getParameter("tel2");
	   
	   UserDTO dto = new UserDTO();
	   
	   dto.setId(id);
	   dto.setName(name);
	   dto.setTel(tel);
	   
	   String pwd = dao.findUserPwd(dto);
	   
	   //System.out.println(pwd);// 비밀번호가 뭐지,,,
	  
	   if(pwd == null)	
	   {
		   request.setAttribute("msg2", "회원정보가 일치하지 않습니다.");
	   }
	   else if(pwd != null)
	   {   
		   Random r = new Random();
		   int num = r.nextInt(89999) + 10000;
		   String newPwd = "dog" + Integer.toString(num); // 새로운 비밀번호
		   
		   //System.out.println(newPwd);
		   
		   dto.setPwd(newPwd); // 그걸 pwd에 집어넣기
		   
		   dao.modifyPwd(dto);
		   
		   request.setAttribute("msg2", "회원님의 새로운 비밀번호는 " + newPwd + " 입니다.");
	   }
	   
	   return "WEB-INF/views/LoginFind.jsp";
   }

}