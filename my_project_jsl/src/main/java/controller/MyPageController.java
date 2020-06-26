package controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.BBSDao;
import dao.ItemCartDao;
import dao.ItemDao;
import dao.LoginDao;
import model.AdminUser;
import model.BBS;
import model.Cart;
import model.CompanyUser;
import model.Customer;
import model.FormalUser;
import model.Item;
import model.Shopping;

@Controller
public class MyPageController {
	@Autowired
	LoginDao loginDao;
	@Autowired
	ItemDao itemDao;
	@Autowired
	ItemCartDao itemCartDao;
	@Autowired
	BBSDao bBSDao;

	@RequestMapping(value = "mypage/frontpage.html", method = RequestMethod.GET)
	public String ToFrontPage() {
		return "mypage/frontpage";
	}

	@RequestMapping(value = "mypage/FormalInfo.html", method = RequestMethod.GET)
	public ModelAndView FormalInfo() { // 정보출력 출력할 정보는 세션에서 취득한다.
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("body", "../mypage/FormalInfo.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/pwdCheck.html", method = RequestMethod.GET)
	public ModelAndView pwdCheck() { // 정보변경하기 전 비밀번호를 한 번 더 묻는다.
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("body", "../mypage/pwdCheck.jsp"); // 비밀번호 확인화면
		return mav;
	}

	@RequestMapping(value = "mypage/FormalChange.html", method = RequestMethod.GET)
	public ModelAndView FormalChange(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		FormalUser sessionUser = (FormalUser) session.getAttribute("User");

		if (loginDao.formalGetIDPWD(sessionUser.getUser_id()).getUser_pwd().equals(request.getParameter("pwd"))) {
			mav.addObject("body", "../mypage/FormalChange.jsp"); // 변경 정보 입력 화면
			mav.addObject("FU", new FormalUser());
		} else {
			mav.addObject("result", "Fail");
		}
		return mav;
	}

	@RequestMapping(value = "mypage/FormalChange.html", method = RequestMethod.POST)
	public ModelAndView FormalChange(FormalUser FU, HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/ChangeResult");
		FormalUser sessionUser = (FormalUser) session.getAttribute("User");
		FU.setUser_id(sessionUser.getUser_id());
		FU.setUser_state(sessionUser.getUser_state());
		loginDao.formalChangeInfo(FU);
		mav.addObject("result", "Success");
		session.invalidate();// 비밀번호가 바뀌었으므로 세션 무효화
		return mav;
	}

	@RequestMapping(value = "mypage/deleteUser.html")
	public ModelAndView FormalDelete(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/ChangeResult");
		FormalUser user = (FormalUser) session.getAttribute("User");
		String id = user.getUser_id();
		loginDao.formalDelete(id);
		mav.addObject("result", "DeleteSuccess");
		session.invalidate();// 계정이 삭제됐으므로 세션 무효화
		return mav;
	}

	@RequestMapping(value = "mypage/FormalCart.html")
	public ModelAndView FormalCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		List<Cart> list = (List<Cart>) session.getAttribute("Cart");
		if (list.size() == 0)
			list = null;
		if (list != null && list.size() > 0) {
			Iterator it = list.iterator();
			while (it.hasNext()) {
				Cart c = (Cart) it.next();
				c.setItem(itemDao.getItem(c.getCart_itemseqno()));
			}
		}
		mav.addObject("CartList", list);
		mav.addObject("body", "../mypage/showCart.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/FormalShopping.html")
	public ModelAndView FormalShopping(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		String type = (String) session.getAttribute("Type");
		if (type.equals("Formal")) {
			FormalUser user = (FormalUser) session.getAttribute("User");
			List<Shopping> list = itemCartDao.getFormalShopping(user.getUser_id());
			if (list.size() == 0)
				list = null;
			else {
				Iterator it = list.iterator();
				while (it.hasNext()) {
					Shopping s = (Shopping) it.next();
					s.setItem(itemDao.getItem(s.getShopping_item())); // 상품정보 추가
				}
			}
			mav.addObject("Shopping", list);
			mav.addObject("body", "../mypage/showShopping.jsp");
		}
		return mav;
	}

	@RequestMapping(value = "mypage/FormalWrited.html")
	public ModelAndView FormalWrited(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		FormalUser user = (FormalUser) session.getAttribute("User");
		List<BBS> list = bBSDao.getMineBBS(user.getUser_id());
		mav.addObject("BBS", list);
		mav.addObject("body", "../mypage/showBBS.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/CompanyInfo.html")
	public ModelAndView CompanyInfo() {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("body", "../mypage/CompanyInfo.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/CompanyChange.html", method = RequestMethod.GET)
	public ModelAndView Companyinfo(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		CompanyUser sessionUser = (CompanyUser) session.getAttribute("User");

		if (loginDao.companyGetIDPWD(sessionUser.getCompany_id()).getCompany_pwd()
				.equals(request.getParameter("pwd"))) {
			mav.addObject("body", "../mypage/CompanyChange.jsp"); // 변경 정보 입력 화면
			mav.addObject("CU", new CompanyUser());
		} else {
			mav.addObject("result", "Fail");
		}
		return mav;
	}

	@RequestMapping(value = "mypage/CompanyChange.html", method = RequestMethod.POST)
	public ModelAndView CompanyChange(CompanyUser CU, HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/ChangeResult");
		CompanyUser sessionUser = (CompanyUser) session.getAttribute("User");
		CU.setCompany_id(sessionUser.getCompany_id());
		CU.setCompany_state(sessionUser.getCompany_state());
		loginDao.companyChangeInfo(CU);
		mav.addObject("result", "Success");
		session.invalidate();// 비밀번호가 바뀌었으므로 세션 무효화
		return mav;
	}

	@RequestMapping(value = "mypage/deleteCompany.html")
	public ModelAndView CompanyDelete(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/ChangeResult");
		CompanyUser user = (CompanyUser) session.getAttribute("User");
		String id = user.getCompany_id();
		loginDao.companyDelete(id);
		mav.addObject("result", "DeleteSuccess");
		session.invalidate();// 계정이 삭제됐으므로 세션 무효화
		return mav;
	}

	@RequestMapping(value = "mypage/ItemManage.html")
	public ModelAndView ItemManage(HttpSession session) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		CompanyUser CU = (CompanyUser) session.getAttribute("User");
		List<Item> list = itemDao.getItemByWriter(CU.getCompany_id());
		mav.addObject("Items", list);
		mav.addObject("body", "../mypage/ItemManage.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/CustomerManage.html", method = RequestMethod.GET)
	public ModelAndView CustomerManage(HttpSession session) {// 구매번호(target)
																// 고객명(target),상품명(target),금액(target),배송상태(target)
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		CompanyUser CU = (CompanyUser) session.getAttribute("User");
		List<Item> list = itemDao.getItemByWriter(CU.getCompany_id());// 기업이 올린 상품 조회
		List<Customer> target = new ArrayList<Customer>(); // 고객정보를 담는다.
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Item i = (Item) it.next(); // 각 상품을 저장하고
			List<Customer> customerList = itemDao.getBuyer(i); // 해당 상품을 구매한 회원을 조회
			target.addAll(customerList);
		}
		mav.addObject("Customer", target);
		mav.addObject("body", "../mypage/CustomerManage.jsp");
		return mav;
	}

	@RequestMapping(value = "mypage/AdminStatics.html", method = RequestMethod.GET)
	public ModelAndView AdminStatics() {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("body", "../mypage/AdminStatics.jsp");
		Integer sum = loginDao.visitSum();
		Integer Today = loginDao.visitToday();
		mav.addObject("Sum", sum);
		mav.addObject("Today", Today);
		return mav;
	}

	@RequestMapping(value = "mypage/UserManage.html", method = RequestMethod.GET)
	public ModelAndView AdminUserManage(HttpSession session,String Types) {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		AdminUser AU = (AdminUser) session.getAttribute("User");
		mav.addObject("body", "../mypage/AdminUserManage.jsp");
		if(Types==null || Types.equals("Formal")) {
			if(AU.getAdmin_power()==2) {
				mav.addObject("Authorization","Negative"); //업체담당 관리자는 볼 수 없다.
				return mav;
			}
			else {
				mav.addObject("Authorization","Positive");
				mav.addObject("Types","Formal");
				List<FormalUser> list = loginDao.getFormalAll();
				mav.addObject("Users", list);
			}
		}
		else if (Types.equals("Company")) {
			if(AU.getAdmin_power()==1 && AU.getAdmin_power()==3) { //중고담당, 게시판담당은 볼 수 없다.
				mav.addObject("Authoriztion","Negative");
				return mav;
			}
			else {
				mav.addObject("Authorization","Positive");
				mav.addObject("Types","Company");
				List<CompanyUser> list = loginDao.getComapnyAll();
				mav.addObject("Users",list);
			}
		}
		else if (Types.equals("Admin")) {
			if(AU.getAdmin_power()!=0) { //총관리자만 볼 수 있다.
				mav.addObject("Authorization","Negative");
				return mav;
			}
			else {
				mav.addObject("Authorization", "Positive");
				mav.addObject("Types", "Admin");
				List<AdminUser> list = loginDao.getAdminAll();
				mav.addObject("Users",list);
			}
		}
		return mav;
	}

	@RequestMapping(value = "mypage/AdminChange.html", method = RequestMethod.GET)
	public ModelAndView AdminChange() {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("body", "../mypage/AdminChange.jsp");
		return mav;
	}
	@RequestMapping(value="mypage/AdminChange.html",method=RequestMethod.POST)
	public ModelAndView AdminChange(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mypage/ChangeResult");
		AdminUser AU = (AdminUser) session.getAttribute("User");
		if(AU.getAdmin_pwd().equals(request.getParameter("present"))) {
			AU.setAdmin_pwd(request.getParameter("new"));
			loginDao.adminChangePWD(AU);
			mav.addObject("result", "Success");
			session.invalidate();
		}
		else mav.addObject("result","Fail");
		return mav;	
	}
	@RequestMapping(value="mypage/AdminAdd.html",method=RequestMethod.GET)
	public ModelAndView AdminAdd() {
		ModelAndView mav = new ModelAndView("mypage/frontpage");
		mav.addObject("admin",new AdminUser());
		mav.addObject("body","../mypage/Adminadd.jsp");
		return mav;
	}
	@RequestMapping(value="mypage/Adminadd.html",method=RequestMethod.POST)
	public ModelAndView AdminAdd(AdminUser AU, BindingResult br) {
		ModelAndView mav = new ModelAndView("redirect:../mypage/UserManage.html?Types=Admin");
		loginDao.insertAdmin(AU);
		return mav;
	}
}