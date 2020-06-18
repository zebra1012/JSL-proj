package controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ItemCartDao;
import dao.ItemDao;
import model.Cart;
import model.FormalUser;
import model.Unsigned_User;

@Controller
public class ItemCartController {
	@Autowired
	ItemCartDao itemCartDao;
	@Autowired
	ItemDao itemDao;
	
	@RequestMapping(value="ItemCart/showCart.html",method=RequestMethod.GET)
	public ModelAndView showCart(HttpSession session) {
		ModelAndView mav =new ModelAndView("Item/ShowCart");
		List<Cart> list = (List<Cart>) session.getAttribute("Cart");
		if(list.size() >0) {
		Iterator it=list.iterator();
		while(it.hasNext()) {
			Cart c = (Cart)it.next();
			c.setItem(itemDao.getItem(c.getCart_itemseqno()));
		}
		}
		mav.addObject("CartList",list);
		return mav;
		
	}
	
	@RequestMapping(value = "itemCart/goCart.html", method = RequestMethod.GET)
	public ModelAndView goCart(String seqno, String quantity, HttpSession session) {
		ModelAndView mav = new ModelAndView("Item/CartResult");
		String type = (String) session.getAttribute("Type");
		if (type == null) { // 로그인 정보가 없다 ! 로그인 창을 띄우고 비회원 주문을 추가한다.
			mav.addObject("result", "Login");
		} else if (type.equals("Formal")) { // 일반회원이므로 바로 카트에 담는다.
			FormalUser User = (FormalUser) session.getAttribute("User");
			List<Cart> list = (List<Cart>) session.getAttribute("Cart");
			Cart cart = new Cart();
			int count=0;
			cart.setCart_itemseqno(Integer.parseInt(seqno));
			cart.setCart_quantity(Integer.parseInt(quantity));
			cart.setCart_seqno(itemCartDao.getMaxSeqno());
			cart.setCart_owner(User.getUser_id());
			if (list.size() > 0) { //세션에 있는 카트에서 검사 후 같은 항목의 갯수를 늘린다.
				java.util.Iterator it = list.iterator();
				while (it.hasNext()) {
					Cart c = (Cart) it.next();
					if (c.getCart_itemseqno() == cart.getCart_itemseqno()) {
						itemCartDao.updateFormalCart(cart);
						count+=1;
					}
				}
				if(count==0) itemCartDao.insertFormalCart(cart); //검사결과 같은 항목이 없으면 DB에 추가한다.
			}
			else itemCartDao.insertFormalCart(cart);//세션 카트에 담긴게 없으면 바로 DB에 삽입한다.
			list = itemCartDao.getFormalCart(User.getUser_id()); //카트 정보를 다시 받는다.
			session.setAttribute("Cart", list);
			mav.addObject("result", "Success");
		} else if (type.equals("Unsigned")) {//비회원일 경우
			Unsigned_User user =(Unsigned_User)session.getAttribute("User");
			List<Cart> list = (List<Cart>) session.getAttribute("Cart");
			Cart cart = new Cart();
			int count=0;
			cart.setCart_itemseqno(Integer.parseInt(seqno));
			cart.setCart_quantity(Integer.parseInt(quantity));
			cart.setCart_seqno(itemCartDao.getMaxSeqno());
			cart.setCart_owner(String.valueOf(user.getUnsigned_no()));
			if (list.size() > 0) { //세션에 있는 카트에서 검사 후 같은 항목의 갯수를 늘린다.
				java.util.Iterator it = list.iterator();
				while (it.hasNext()) {
					Cart c = (Cart) it.next();
					if (c.getCart_itemseqno() == cart.getCart_itemseqno()) {
						itemCartDao.updateUnsignedCart(cart);
						count+=1;
					}
				}
				if(count==0) itemCartDao.insertUnsignedCart(cart); //검사결과 같은 항목이 없으면 DB에 추가한다.
			}
			else itemCartDao.insertUnsignedCart(cart);//세션 카트에 담긴게 없으면 바로 DB에 삽입한다.
			list = itemCartDao.getUnsignedCart(user.getUnsigned_no()); //카트 정보를 다시 받는다.
			session.setAttribute("Cart", list);
			mav.addObject("result", "Success");
		}
		return mav;
	}
	@RequestMapping (value="ItemCart/cartLogin.html",method=RequestMethod.GET) 
	public String cartLogin() {
		return "Item/login";
	}
	@RequestMapping(value="ItemCart/unsigned.html",method=RequestMethod.GET)
	public ModelAndView unsigned(HttpSession session) {
		session.invalidate(); //비회원 정보를 받기 위헤 세션 초기화
		ModelAndView mav = new ModelAndView("Item/Unsigned_Entry");
		mav.addObject("Unsigned",new Unsigned_User()); //객체주입
		return mav;
	}
	@RequestMapping(value="ItemCart/unsigned.html",method=RequestMethod.POST)
	public ModelAndView unsigned(Unsigned_User user,BindingResult br,HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView("redirect:../item/frontpage.html");
		user.setUnsigned_no(itemCartDao.getMaxUnsignedUser());
		List<Cart> list = itemCartDao.getUnsignedCart(user.getUnsigned_no());
		itemCartDao.insertUnsignedUser(user);
		session.setAttribute("Type", "Unsigned");
		session.setAttribute("User", user);
		session.setAttribute("Cart", list);
		session.setMaxInactiveInterval(60*60*2); //유효시간 2시간.
		return mav;
	}
}
