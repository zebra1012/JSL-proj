package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.AdminUser;
import model.CompanyUser;
import model.FormalUser;

@Controller
public class IndexController {
	@Autowired
	private LoginDao LoginDao;
	private FormalUser FormalUser;
	private CompanyUser CompanyUser;
	private AdminUser AdminUser;
	@RequestMapping(value="index/showMessage.html") //메인으로
	public String test() {
		return "index/frontPage";
	}
	@RequestMapping(value="/index/adminlogin.html",method=RequestMethod.GET) //관리자 로그인JSP로, URL으로만 접속 가능
	public String adminTryLogin() {
		return "index/adminlogin";
	}
	
	@RequestMapping(value="/index/login.html", method=RequestMethod.GET) //일반,업체 로그인JSP로
	public String tryLogin() {
		return "index/login";
	}
	@RequestMapping(value="index/logincheck.html", method=RequestMethod.POST) //로그인 성공 or 실패
	public ModelAndView LoginCheck(HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView("index/loginResult");
		String userType=(String)request.getParameter("userType");
		if(userType.equals("formal")) {
			try {
			FormalUser=LoginDao.formalGetIDPWD((String)request.getParameter("id"));
			if(FormalUser.getUser_pwd().equals((String)request.getParameter("pwd"))) {
				mav.addObject("result","YES");
				session.setAttribute("User", FormalUser);
				session.setAttribute("Type","Formal");
			}else FormalUser=null;
			}catch(Exception E) {}
		}
		else if (userType.equals("company")) {
			try {
			CompanyUser = LoginDao.companyGetIDPWD((String)request.getParameter("id"));
			if(CompanyUser.getCompany_pwd().equals((String)request.getParameter("pwd"))) {
				mav.addObject("result","YES");
				session.setAttribute("User",CompanyUser);
				session.setAttribute("Type","Company");
			}else CompanyUser=null;
			}catch(Exception E){}
		}
		else if (userType.equals("admin")) {
			try {
				AdminUser = LoginDao.adminGetIDPWD((String)request.getParameter("id"));
				if (AdminUser.getAdmin_pwd().equals((String)request.getParameter("pwd"))){
					mav.addObject("result","YES");
					session.setAttribute("User",AdminUser);
					session.setAttribute("Type","Admin");
				}else AdminUser=null;
			}catch(Exception E) {E.printStackTrace();}
		}
		if(FormalUser==null && CompanyUser ==null && AdminUser==null) {
			mav.addObject("result","NO");
		}
		return mav;
	}
	@RequestMapping(value="index/entry.html", method=RequestMethod.GET) //회원유형 선택창으로
	public String Entry() {
		return "index/EntryTry";
	}
	@RequestMapping(value="index/entryform.html", method=RequestMethod.GET) //회원가입 폼
	public ModelAndView Entry(String type) {
		ModelAndView mav = new ModelAndView("index/entryform");
		if (type.equals("formal")) {
			mav.addObject("formal",new FormalUser());
		}
		else if (type.equals("comapny")) {
			mav.addObject("company",new CompanyUser());
		}
		else mav.setViewName("index/EntryTry");
		return mav;
	}
	@RequestMapping(value="index/idcheck.html",method=RequestMethod.GET) //일반회원 ID중복체크
	public ModelAndView idcheck(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult");
		mav.addObject("ID",ID);
		if(LoginDao.formalDupCheck(ID)>0) {
			mav.addObject("result","NOK");
		}
		else mav.addObject("result","OK");
		return mav;
	}
	@RequestMapping(value="index/idcheck_company.html",method=RequestMethod.GET) //업체회원 ID중복체크
	public ModelAndView idcheck_company(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult_Company");
		mav.addObject("ID",ID);
		if(LoginDao.companyDupCheck(ID)>0) {
			mav.addObject("result","NOK");
		}
		else mav.addObject("result","OK");
		return mav;
	}
	@RequestMapping(value="index/EntryDo.html",method=RequestMethod.POST) //일반회원 폼 입력완료
	public ModelAndView EntryDo(FormalUser formal) {
		ModelAndView mav = new ModelAndView("");
		formal.setUser_state(0);
			try {
			LoginDao.formalregister(formal);
			mav.addObject("reg_result","OK");
			mav.setViewName("index/register_result");
			}
			catch (Exception E) {
				E.printStackTrace();
				mav.setViewName("index/entry");
			}
		return mav;
	}
	@RequestMapping(value="index/EntryDo_Company.html",method=RequestMethod.POST) //업체회원 폼 입력 완료
	public ModelAndView EntryDo(CompanyUser company) {
		ModelAndView mav = new ModelAndView("");
		company.setCompany_state(0);
			try {
			LoginDao.companyregister(company);
			mav.addObject("reg_result","OK");
			mav.setViewName("index/register_result");
			}
			catch (Exception E) {
				E.printStackTrace();
				mav.setViewName("index/entry");
			}
		return mav;
	}
	@RequestMapping(value="index/logout.html", method=RequestMethod.GET) //로그아웃
	public ModelAndView Logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:../index/showMessage.html");
	}
	@RequestMapping(value="index/findAccount.html",method=RequestMethod.GET)
	public String findAccount() {
		return "index/findAccount";
	}
	@RequestMapping(value="index/findID.html",method=RequestMethod.POST)
	public ModelAndView findID(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index/findID");
		List list=null;
		String userType=request.getParameter("userType");
		if(userType.equals("formal")) {
			list =LoginDao.formalGetID(request.getParameter("email"));
		}
		else if (userType.equals("company")) {
			list =LoginDao.companyGetID(request.getParameter("email"));
		}
		mav.addObject("ID",list);
		return mav;
	}
	@RequestMapping(value="index/findPWD.html",method=RequestMethod.POST)
	public ModelAndView findIPWD(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index/findPWD");
		String userType=request.getParameter("userType");
		if(userType.equals("formal")) {
			FormalUser=LoginDao.formalGetIDPWD(request.getParameter("ID"));
			if(LoginDao.formalGetPWD(FormalUser) > 0) {
				mav.addObject("User",FormalUser);
				mav.addObject("userType","Formal");
			}
		}
		else if (userType.equals("company")) {
			CompanyUser = LoginDao.companyGetIDPWD(request.getParameter("ID"));
			if(LoginDao.companyGetPWD(CompanyUser) >0) {
				mav.addObject("User",CompanyUser);
				mav.addObject("userType","Company");
			}
		}
		return mav;
	}
	@RequestMapping(value="/index/FormalChangePWD.html",method=RequestMethod.POST)
	public ModelAndView FormalChangePWD (String user_id,String user_pwd ) {
		ModelAndView mav = new ModelAndView("index/changeResult");
		FormalUser=LoginDao.formalGetIDPWD(user_id);
		FormalUser.setUser_pwd(user_pwd);
		try {
			LoginDao.formalChangePWD(FormalUser);
			mav.addObject("result","OK");
			}catch (Exception e) {e.printStackTrace();
			}
		
		return mav;
	}
	@RequestMapping(value="/index/CompanyChangePWD.html",method=RequestMethod.POST)
	public ModelAndView CompanyChangePWD (String company_id,String company_pwd ) {
		ModelAndView mav = new ModelAndView("index/changeResult");
		CompanyUser=LoginDao.companyGetIDPWD(company_id);
		CompanyUser.setCompany_pwd(company_pwd);
		try {
		LoginDao.companyChangePWD(CompanyUser);
		mav.addObject("result","OK");
		}catch (Exception e) {e.printStackTrace();
		}
		return mav;
	}
}