package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ItemDao;
import model.CompanyUser;
import model.Condition;
import model.Item;
import model.Secondhand;

@Controller
public class ItemController {
	@Autowired
	ItemDao itemDao;
	@RequestMapping(value="/item/frontpage.html",method=RequestMethod.GET)
	public ModelAndView ToFrontPage(Integer pageNo) {
		ModelAndView mav = new ModelAndView("Item/frontpage");
		Condition condition = new Condition();
		Integer total=itemDao.getItemCount();
		if(total==null) total=0;
		int startRow=0; int endRow=0; int pageCnt=0;
		int currentPage=0;
		if(pageNo==null) currentPage=1;
		else currentPage=pageNo;
		if(total >0) {
			pageCnt= total/10;
			if(total%10 >0) pageCnt++;
			startRow=(currentPage-1)*10+1;
			endRow=currentPage*10;
			if(endRow > total) endRow=total;
		}
		condition.setStartRow(startRow); condition.setEndRow(endRow);	
		List<Item> list = itemDao.getItemList(condition);
		mav.addObject("Items", list);
		mav.addObject("COUNT",pageCnt);
		return mav;
	}
	@RequestMapping(value="/item/writeform.html",method=RequestMethod.GET)
	public ModelAndView ItemWriteForm(HttpSession session) {
		ModelAndView mav = new ModelAndView("Item/writeform");
		Object user = session.getAttribute("User");
		if (user instanceof CompanyUser) {  
			mav.addObject("Company","YES"); //세션에 일반 사용자 계정이 존재하면 YES
			mav.addObject("Item",new Item());
		}else {
			mav.addObject("Company","NO"); //없으면 NO
		}
		return mav;		
	}
	@RequestMapping(value="/item/write.html",method=RequestMethod.POST) //글 작성
	public ModelAndView WriteSeondHand(Item model,BindingResult br,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/item/frontpage.html");
		ServletContext context= request.getSession().getServletContext();
		String filePath=context.getRealPath("/Item_Image");
		String encType="euc-kr";
		MultipartRequest Multipart = new MultipartRequest(request,filePath,5*1024*1024,encType,new DefaultFileRenamePolicy());
		String picture_url=Multipart.getFilesystemName("item_image");
		model.setItem_seqno(itemDao.getMaxSeqno());
		model.setItem_name(Multipart.getParameter("item_name"));
		model.setItem_writer(Multipart.getParameter("item_writer"));
		model.setItem_price(Integer.parseInt(Multipart.getParameter("item_price")));
		model.setItem_code(Integer.parseInt(Multipart.getParameter("item_code")));
		model.setItem_content(Multipart.getParameter("item_content"));
		model.setItem_image(picture_url);
		model.setItem_state(0);
		model.setItem_stock(0);
		itemDao.insertItem(model);
		return mav; 
	}
	@RequestMapping (value="item/itemDetail.html", method=RequestMethod.GET)
	public ModelAndView ItemDetail(String seqno) {
		ModelAndView mav = new ModelAndView("Item/detail");
		Item target=itemDao.getItem(Integer.parseInt(seqno));
		//List<Review> list = 
		mav.addObject("item", target);
		return mav;
	}
	@RequestMapping(value="item/delete.html",method=RequestMethod.GET)
	public ModelAndView itemDelete(String seqno,HttpSession session) {
		ModelAndView mav = new ModelAndView ("Item/delete");
		Integer no = Integer.parseInt(seqno);
		Item target=itemDao.getItem(no);
		if(session.getAttribute("Type")==null||!session.getAttribute("Type").equals("Company")) { //세션에 로그인 정보가 없거나 업체 회원이 아닐 때
			mav.addObject("result","Fail");
			return mav;
		}
		CompanyUser CU=(CompanyUser)session.getAttribute("User");
		if (!CU.getCompany_id().equals(target.getItem_writer())){ //상품을 등록한 업체와 다를 때
			mav.addObject("reuslt","Fail");
			return mav;
		}
		itemDao.deleteItem(no);
		mav.addObject("result","Success");
		return mav;
	}
	@RequestMapping(value="item/modify.html",method=RequestMethod.GET)
	public ModelAndView itemModify(String seqno,HttpSession session) {
		ModelAndView mav = new ModelAndView("Item/modifyForm");
		Integer no = Integer.parseInt(seqno);
		Item target=itemDao.getItem(no);
		if(session.getAttribute("Type")==null||!session.getAttribute("Type").equals("Company")) { //세션에 로그인 정보가 없거나 업체 회원이 아닐 때
			mav.addObject("result","Fail");
			return mav;
		}
		CompanyUser CU=(CompanyUser)session.getAttribute("User");
		if (!CU.getCompany_id().equals(target.getItem_writer())){ //상품을 등록한 업체와 다를 때
			mav.addObject("reuslt","Fail");
			return mav;
		}
		mav.addObject("result","Success");
		mav.addObject("seqno",no);
		mav.addObject("item",new Item());
		return mav;
	}
	@RequestMapping(value="item/modify.html",method=RequestMethod.POST)
	public ModelAndView itemModify(Item model,BindingResult br, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("Item/Modify");
		ServletContext context= request.getSession().getServletContext();
		String filePath=context.getRealPath("/Item_Image");
		String encType="euc-kr";
		MultipartRequest Multipart = new MultipartRequest(request,filePath,5*1024*1024,encType,new DefaultFileRenamePolicy());
		
			
		model.setItem_seqno(Integer.parseInt(Multipart.getParameter("item_seqno")));
		model.setItem_name(Multipart.getParameter("item_name"));
		model.setItem_writer(Multipart.getParameter("item_writer"));
		model.setItem_price(Integer.parseInt(Multipart.getParameter("item_price")));
		model.setItem_code(Integer.parseInt(Multipart.getParameter("item_code")));
		model.setItem_content(Multipart.getParameter("item_content"));
		String picture_url=Multipart.getFilesystemName("item_image");
		if(picture_url==null) picture_url=itemDao.getItem(model.getItem_seqno()).getItem_image();
		model.setItem_image(picture_url);
		model.setItem_state(0);
		model.setItem_stock(0);
		itemDao.updateItem(model);
		mav.addObject("result","Success");
		mav.addObject("seqno",model.getItem_seqno());
		return mav; 
		
	}
	@RequestMapping(value="item/search.html",method=RequestMethod.GET)
	public ModelAndView ItemSearch(String type, String keyword) {
		ModelAndView mav = new ModelAndView("Item/frontpage");
		if(type.equals("writer")) {
			List<Item> list= itemDao.getItemByWriter(keyword);
			mav.addObject("Items",list);
		}
		if(type.equals("name")) {
			List<Item> list = itemDao.getItemByName(keyword);
			mav.addObject("Items",list);
		}
		if(type.equals("content")) {
			List<Item> list  = itemDao.getItemByContent(keyword);
			mav.addObject("Items",list);
		}
		return mav;
	}
}
