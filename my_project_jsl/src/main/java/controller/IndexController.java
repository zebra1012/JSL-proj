package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSDao;
import dao.ItemCartDao;
import dao.ItemDao;
import dao.LoginDao;
import dao.SecondHandDao;
import model.AdminUser;
import model.Cart;
import model.CompanyUser;
import model.Condition;
import model.FormalUser;
import model.Item;
import model.Secondhand;

@Controller
public class IndexController {
	@Autowired
	private ItemCartDao ItemCartDao;
	@Autowired
	private LoginDao LoginDao;
	@Autowired
	private SecondHandDao secondHandDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private BBSDao bbsdao;
	private Cart cart;
	private FormalUser FormalUser;
	private CompanyUser CompanyUser;
	private AdminUser AdminUser;

	@RequestMapping(value = "index/showMessage.html") // 메인으로
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("index/frontPage");
		Condition c = new Condition();
		Integer total = itemDao.getItemCount();
		if (total == null)
			total = 0;
		int startRow = 0;
		int endRow = 0;
		int pageCnt = 0;
		if (total > 0) {
			pageCnt = total / 10;
			int reminder = total % 10;
			if (total % 10 > 0)
				pageCnt++;
			endRow = (pageCnt - 1) * 10 + reminder;
			if (pageCnt - 1 == 0)
				startRow = 1;
			else
				startRow = (pageCnt - 2) * 10 + reminder + 1;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		List<Item> item_list = itemDao.getItemList(c);
		mav.addObject("item_list", item_list);
		
		total = secondHandDao.getMaxSeqno();
		startRow = 0;
		endRow = 0;
		pageCnt = 0;
		if (total > 0) {
			pageCnt = total / 5;
			int reminder = total % 5;
			if (total % 5 > 0)
				pageCnt++;
			endRow = (pageCnt - 1) * 5 + reminder;
			if (pageCnt - 1 == 0)
				startRow = 1;
			else
				startRow = (pageCnt - 2) * 5 + reminder + 1;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		mav.addObject("second_list", secondHandDao.getSecondHandList(c));
		
		total = bbsdao.getFreeBBSTotal();
		startRow = 0;
		endRow = 0;
		pageCnt = 0;
		if (total > 0) {
			pageCnt = total / 5;
			int reminder = total % 5;
			if (total % 5 > 0)
				pageCnt++;
			endRow = (pageCnt - 1) * 5 + reminder;
			if (pageCnt - 1 == 0)
				startRow = 1;
			else
				startRow = (pageCnt - 2) * 5 + reminder + 1;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		mav.addObject("free_list", bbsdao.getFreeBBSList(c));
		return mav;
	}

	@RequestMapping(value = "/index/adminlogin.html", method = RequestMethod.GET) // 관리자 로그인JSP로, URL으로만 접속 가능
	public String adminTryLogin() {
		return "index/adminlogin";
	}

	@RequestMapping(value = "/index/login.html", method = RequestMethod.GET) // 일반,업체 로그인JSP로
	public String tryLogin() {
		return "index/login";
	}

	@RequestMapping(value = "index/logincheck.html", method = RequestMethod.POST) // 로그인 성공 or 실패
	public ModelAndView LoginCheck(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("index/loginResult");
		String userType = (String) request.getParameter("userType");
		if (userType.equals("formal")) {
			try {
				System.out.println("1");
				FormalUser = LoginDao.formalGetIDPWD((String) request.getParameter("id"));
				if (FormalUser.getUser_pwd().equals((String) request.getParameter("pwd"))) { // 로그인 성공
					mav.addObject("result", "YES");
					System.out.println("2");
					session.setAttribute("User", FormalUser);
					session.setAttribute("Type", "Formal");
					List<Cart> cart = ItemCartDao.getFormalCart(FormalUser.getUser_id());
					session.setAttribute("Cart", cart);
					System.out.println("3");
					session.setMaxInactiveInterval(60 * 60);
				} else
					FormalUser = null;
			} catch (Exception E) {
				mav.addObject("result", "NO");
			}
		} else if (userType.equals("company")) {
			try {
				CompanyUser = LoginDao.companyGetIDPWD((String) request.getParameter("id"));
				if (CompanyUser.getCompany_pwd().equals((String) request.getParameter("pwd"))) {
					mav.addObject("result", "YES");
					session.setAttribute("User", CompanyUser);
					session.setAttribute("Type", "Company");
					session.setMaxInactiveInterval(60 * 60);
				} else
					CompanyUser = null;
			} catch (Exception E) {
				mav.addObject("result", "NO");
			}
		} else if (userType.equals("admin")) {
			try {
				AdminUser = LoginDao.adminGetIDPWD((String) request.getParameter("id"));
				if (AdminUser.getAdmin_pwd().equals((String) request.getParameter("pwd"))) {
					mav.addObject("result", "YES");
					session.setAttribute("User", AdminUser);
					session.setAttribute("Type", "Admin");
					session.setMaxInactiveInterval(60 * 60);
				} else
					AdminUser = null;
			} catch (Exception E) {
				mav.addObject("result", "NO");
			}
		}
		if (FormalUser == null && CompanyUser == null && AdminUser == null) {
			mav.addObject("result", "NO");
		}
		return mav;
	}

	@RequestMapping(value = "index/entry.html", method = RequestMethod.GET) // 회원유형 선택창으로
	public String Entry() {
		return "index/EntryTry";
	}

	@RequestMapping(value = "index/entryform.html", method = RequestMethod.GET) // 회원가입 폼
	public ModelAndView Entry(String type) {
		ModelAndView mav = new ModelAndView("index/entryform");
		if (type.equals("formal")) {
			mav.addObject("formal", new FormalUser());
		} else if (type.equals("comapny")) {
			mav.addObject("company", new CompanyUser());
		} else
			mav.setViewName("index/EntryTry");
		return mav;
	}

	@RequestMapping(value = "index/idcheck.html", method = RequestMethod.GET) // 일반회원 ID중복체크
	public ModelAndView idcheck(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult");
		mav.addObject("ID", ID);
		if (LoginDao.formalDupCheck(ID) > 0) {
			mav.addObject("result", "NOK");
		} else
			mav.addObject("result", "OK");
		return mav;
	}

	@RequestMapping(value = "index/idcheck_company.html", method = RequestMethod.GET) // 업체회원 ID중복체크
	public ModelAndView idcheck_company(String ID) {
		ModelAndView mav = new ModelAndView("index/dupCheckResult_Company");
		mav.addObject("ID", ID);
		if (LoginDao.companyDupCheck(ID) > 0) {
			mav.addObject("result", "NOK");
		} else
			mav.addObject("result", "OK");
		return mav;
	}

	@RequestMapping(value = "index/EntryDo.html", method = RequestMethod.POST) // 일반회원 폼 입력완료
	public ModelAndView EntryDo(FormalUser formal) {
		ModelAndView mav = new ModelAndView("");
		formal.setUser_state(0);
		try {
			LoginDao.formalregister(formal);
			mav.addObject("reg_result", "OK");
			mav.setViewName("index/register_result");
		} catch (Exception E) {
			E.printStackTrace();
			mav.setViewName("index/entry");
		}
		return mav;
	}

	@RequestMapping(value = "index/EntryDo_Company.html", method = RequestMethod.POST) // 업체회원 폼 입력 완료
	public ModelAndView EntryDo(CompanyUser company) {
		ModelAndView mav = new ModelAndView("");
		company.setCompany_state(0);
		try {
			LoginDao.companyregister(company);
			mav.addObject("reg_result", "OK");
			mav.setViewName("index/register_result");
		} catch (Exception E) {
			E.printStackTrace();
			mav.setViewName("index/entry");
		}
		return mav;
	}

	@RequestMapping(value = "index/logout.html", method = RequestMethod.GET) // 로그아웃
	public ModelAndView Logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:../index/showMessage.html");
	}

	@RequestMapping(value = "index/findAccount.html", method = RequestMethod.GET)
	public String findAccount() {
		return "index/findAccount";
	}

	@RequestMapping(value = "index/findID.html", method = RequestMethod.POST)
	public ModelAndView findID(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index/findID");
		List list = null;
		String userType = request.getParameter("userType");
		if (userType.equals("formal")) {
			list = LoginDao.formalGetID(request.getParameter("email"));
		} else if (userType.equals("company")) {
			list = LoginDao.companyGetID(request.getParameter("email"));
		}
		mav.addObject("ID", list);
		return mav;
	}

	@RequestMapping(value = "index/findPWD.html", method = RequestMethod.POST)
	public ModelAndView findIPWD(HttpServletRequest request) { // 비밀번호 찾기
		ModelAndView mav = new ModelAndView("index/findPWD");
		String userType = request.getParameter("userType");
		if (userType.equals("formal")) {
			FormalUser = LoginDao.formalGetIDPWD(request.getParameter("ID"));
			if (FormalUser != null && FormalUser.getUser_email().equals(request.getParameter("email"))
					&& LoginDao.formalGetPWD(FormalUser) > 0) {
				mav.addObject("tempUser", FormalUser);
				mav.addObject("userType", "Formal");
			} else
				mav.addObject("result", "Fail");
		} else if (userType.equals("company")) {
			CompanyUser = LoginDao.companyGetIDPWD(request.getParameter("ID"));
			if (CompanyUser != null && LoginDao.companyGetPWD(CompanyUser) > 0) {
				mav.addObject("tempUser", CompanyUser);
				mav.addObject("userType", "Company");
			} else
				mav.addObject("result", "Fail");
		}
		return mav;
	}

	@RequestMapping(value = "/index/FormalChangePWD.html", method = RequestMethod.POST)
	public ModelAndView FormalChangePWD(String user_id, String user_pwd) {
		ModelAndView mav = new ModelAndView("index/changeResult");
		FormalUser = LoginDao.formalGetIDPWD(user_id);
		FormalUser.setUser_pwd(user_pwd);
		try {
			LoginDao.formalChangePWD(FormalUser);
			mav.addObject("result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/index/CompanyChangePWD.html", method = RequestMethod.POST)
	public ModelAndView CompanyChangePWD(String company_id, String company_pwd) {
		ModelAndView mav = new ModelAndView("index/changeResult");
		CompanyUser = LoginDao.companyGetIDPWD(company_id);
		CompanyUser.setCompany_pwd(company_pwd);
		try {
			LoginDao.companyChangePWD(CompanyUser);
			mav.addObject("result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/index/cookiesCheck.html", method = RequestMethod.GET)
	public String cookiesCheck(HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView mav = new ModelAndView("index/frontPage");
		Cookie[] cookies = request.getCookies();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String strDate = dateFormat.format(Calendar.getInstance().getTime()); // 오늘 날짜
		for (int i = 0; i < cookies.length; i++) { // 현재 쿠키에서 방문정보를 담은 쿠키 검사. 있으면 종료
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("visit") && cookie.getValue().equals("OK"))
				return "index/frontPage";
		}
		Cookie visit = new Cookie("visit", "OK"); // 없으면 쿠키를 생성한다.
		visit.setMaxAge(60 * 60 * 3); // 쿠키 기간 3시간
		visit.setPath("/");
		Integer date = LoginDao.visitorCheck(strDate); // 해당날짜가 있는지 조회
		if (date != null)
			LoginDao.visitorAdder(strDate);
		else
			LoginDao.visitrCreate(strDate);
		response.addCookie(visit);
		return "index/frontPage";
	}
}
