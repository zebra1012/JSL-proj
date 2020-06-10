package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import dao.SecondHandDao;
import model.Condition;
import model.FormalUser;
import model.Secondhand;

@Controller
public class SecondhandController {
	@Autowired
	SecondHandDao SecondHandDao;
	@RequestMapping (value="/secondhand/frontpage.html")
	public ModelAndView TofrontPage(Integer pageNo) {
		ModelAndView mav = new ModelAndView("secondhand/frontpage");
		Condition condition = new Condition();
		Integer total=SecondHandDao.getSecondhandCount();
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
		List<Secondhand> list = SecondHandDao.getSecondHandList(condition);
		mav.addObject("Secondhand", list);
		mav.addObject("COUNT",pageCnt);
		return mav;
	}
	@RequestMapping(value="/secondhand/writeform.html") //글 작성폼
	public ModelAndView WriteFormSecondHand(HttpSession session) {
		ModelAndView mav = new ModelAndView("secondhand/writeform");
		Object user = session.getAttribute("User");
		if (user instanceof FormalUser) {  
			mav.addObject("Formal","YES"); //세션에 일반 사용자 계정이 존재하면 YES
			mav.addObject("secondhand",new Secondhand());
		}else {
			mav.addObject("Formal","NO"); //없으면 NO
		}
		return mav;	
	}
	@RequestMapping(value="/secondhand/write.html",method=RequestMethod.POST) //글 작성
	public ModelAndView WriteSeondHand(Secondhand model,BindingResult br,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/secondhand/frontpage.html");
		ServletContext context= request.getSession().getServletContext();
		String filePath=context.getRealPath("/Secondhand_Image");
		System.out.println(filePath);
		String encType="euc-kr";
		MultipartRequest Multipart = new MultipartRequest(request,filePath,5*1024*1024,encType,new DefaultFileRenamePolicy());
		String picture_url=Multipart.getFilesystemName("secondhand_image");
		model.setSecondhand_seqno(SecondHandDao.getMaxSeqno());
		model.setSecondhand_title(Multipart.getParameter("secondhand_title"));
		model.setSecondhand_price(Integer.parseInt(Multipart.getParameter("secondhand_price")));
		model.setSecondhand_local(Multipart.getParameter("secondhand_local"));
		model.setSecondhand_writer(Multipart.getParameter("secondhand_writer"));
		model.setSecondhand_image(picture_url);
		model.setSecondhand_content(Multipart.getParameter("secondhand_content"));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		System.out.println(strDate);
		model.setSecondhand_date(strDate);
		SecondHandDao.insertSecondHand(model);
		System.out.println("끝!");
		return mav; 
	}
	//@RequestMapping(value="/secondhand/search.html" method=RequestMethod.POST)
	//public ModelAndView WriteSecond
}
