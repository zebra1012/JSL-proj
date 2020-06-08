package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.CompanyUser;
import model.FormalUser;

@Controller
public class IndexController {
	@Autowired
	private LoginDao LoginDao;
	private FormalUser FormalUser;
	private CompanyUser CompanyUser;
	@RequestMapping(value="index/showMessage.html")
	public String test() {
		return "index/frontPage";
	}
	
	@RequestMapping(value="/index/login.html", method=RequestMethod.GET)
	public String tryLogin() {
		return "index/login";
	}
	@RequestMapping(value="index/logincheck.html", method=RequestMethod.POST)
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
			}
			}catch(Exception E) {}
		}
		else if (userType.equals("company")) {
			try {
			CompanyUser = LoginDao.companyGetIDPWD((String)request.getParameter("id"));
			System.out.println(CompanyUser.getCompany_id());
			if(CompanyUser.getCompany_pwd().equals((String)request.getParameter("pwd"))) {
				mav.addObject("result","YES");
				session.setAttribute("User",CompanyUser);
				session.setAttribute("Type","Company");
			}
			}catch(Exception E){}
		}
		if(FormalUser==null && CompanyUser ==null) {
			mav.addObject("result","NO");
		}
		return mav;
	}
	@RequestMapping(value="index/entry.html", method=RequestMethod.GET)
	public String Entry() {
		return "index/EntryTry";
	}
	@RequestMapping(value="index/entryform.html", method=RequestMethod.GET)
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
	@RequestMapping(value="index/idcheck.html",method=RequestMethod.GET)
	public ModelAndView idcheck(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult");
		mav.addObject("ID",ID);
		if(LoginDao.formalDupCheck(ID)>0) {
			mav.addObject("result","NOK");
		}
		else mav.addObject("result","OK");
		return mav;
	}
	@RequestMapping(value="index/idcheck_company.html",method=RequestMethod.GET)
	public ModelAndView idcheck_company(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult_Company");
		mav.addObject("ID",ID);
		if(LoginDao.companyDupCheck(ID)>0) {
			mav.addObject("result","NOK");
		}
		else mav.addObject("result","OK");
		return mav;
	}
	@RequestMapping(value="index/EntryDo.html",method=RequestMethod.POST)
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
	@RequestMapping(value="index/EntryDo_Company.html",method=RequestMethod.POST)
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
	@RequestMapping(value="index/logout.html", method=RequestMethod.GET)
	public ModelAndView Logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:../index/showMessage.html");
	}

	
}
