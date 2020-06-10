package controller;

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
import model.Item;

@Controller
public class ItemController {
	@Autowired
	ItemDao itemDao;
	@RequestMapping(value="/item/frontpage.html",method=RequestMethod.GET)
	public String ToFrontPage() {
		return "Item/frontpage";
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
		System.out.println(filePath);
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
}
