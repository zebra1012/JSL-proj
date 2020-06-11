package controller;

import java.io.OutputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.SHCommentDao;
import dao.SecondHandDao;
import model.Comment;
import model.Condition;
import model.FormalUser;
import model.Secondhand;

@Controller
public class SecondhandController {
	@Autowired
	SecondHandDao SecondHandDao;
	@Autowired
	SHCommentDao commentDao;
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
		model.setSecondhand_date(strDate);
		SecondHandDao.insertSecondHand(model);
		return mav; 
	}
	@RequestMapping(value="/secondhand/Detail.html",method=RequestMethod.GET)
	public ModelAndView secondhandDetail(String seqno) {
		ModelAndView mav = new ModelAndView("secondhand/detail");
		Integer no = Integer.parseInt(seqno);
		Secondhand target = SecondHandDao.getSecondhandDetail(no);
		mav.addObject("secondhand",target);
		return mav;
	}
	@RequestMapping(value="/secondhand/delete.html",method=RequestMethod.GET)
	public ModelAndView secondhandDelete(HttpSession session,String seqno) {
		ModelAndView mav = new ModelAndView("secondhand/DeleteResult");
		Integer no = Integer.parseInt(seqno);
		Secondhand target = SecondHandDao.getSecondhandDetail(no);
		FormalUser FU=null;
		try {
			FU =(FormalUser)session.getAttribute("User"); 
			if(FU==null) throw new NullPointerException(); //User가 null일 때 예외를 발생시킨다.
		} catch(Exception E) { //세션속성 유저가 없거나 세션속성 유저가 일반유저가 아닐 때
			mav.addObject("result", "Fail");
			return mav;
		}
		if(target.getSecondhand_writer().equals(FU.getUser_id())) { //세션 유저 아이디가 글쓴이와 같을 때
			SecondHandDao.deleteSecondHand(no);
			mav.addObject("result","Success");
		}
		else mav.addObject("result","Fail"); //세션 유저 아이디가 글쓴이와 같지 않을 때
		return mav;
	}
	@RequestMapping(value="secondhand/modify.html",method=RequestMethod.GET)
	public ModelAndView secondhandModify(HttpSession session,String seqno) { //삭제와 동일하지만 수정폼으로 연결해준다.
		ModelAndView mav = new ModelAndView("secondhand/ModifyForm");
		Integer no = Integer.parseInt(seqno);
		Secondhand target = SecondHandDao.getSecondhandDetail(no);
		FormalUser FU=null;
		try {
			FU =(FormalUser)session.getAttribute("User"); 
			if(FU==null) throw new NullPointerException();
		} catch(Exception E) { 
			mav.addObject("result", "Fail");
			return mav;
		}
		if(target.getSecondhand_writer().equals(FU.getUser_id())) {
			mav.addObject("seqno", target.getSecondhand_seqno());
			mav.addObject("secondhand",target); //폼 작성을 위한 객체 주입
			mav.addObject("result","Success");
			
		}
		else mav.addObject("result","Fail"); 
		return mav;
	}
	@RequestMapping(value="secondhand/modify.html",method=RequestMethod.POST) //수정폼에서 입력한 자료로 업데이트한다.
	public ModelAndView secondhandModify(Secondhand model,BindingResult br,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/secondhand/ModifyResult");
		ServletContext context= request.getSession().getServletContext();
		String filePath=context.getRealPath("/Secondhand_Image");
		String encType="euc-kr";
		
		MultipartFile multiFile=model.getPicture();
		String FileName=null; String path=null;
		OutputStream out = null;
		MultipartRequest Multipart = new MultipartRequest(request,filePath,5*1024*1024,encType,new DefaultFileRenamePolicy());
		String picture_url=Multipart.getFilesystemName("secondhand_image");
		model.setSecondhand_seqno(Integer.parseInt(Multipart.getParameter("secondhand_seqno")));
		model.setSecondhand_title(Multipart.getParameter("secondhand_title"));
		model.setSecondhand_price(Integer.parseInt(Multipart.getParameter("secondhand_price")));
		model.setSecondhand_local(Multipart.getParameter("secondhand_local"));
		model.setSecondhand_image(picture_url);
		model.setSecondhand_content(Multipart.getParameter("secondhand_content"));
	//	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
	//	String strDate = dateFormat.format(Calendar.getInstance().getTime());
	//	model.setSecondhand_date(strDate); 시간은 변경하지 않는다.
		mav.addObject("result", "Success");
		mav.addObject("seqno",model.getSecondhand_seqno());
		SecondHandDao.ModifySecondHand(model);
		return mav; 
	}
	
	@RequestMapping(value="/secondhand/commentWrite.html",method=RequestMethod.POST)
	public ModelAndView commentWrite(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Comment comment=new Comment();
		comment.setComment_writer(request.getParameter("writer"));
		comment.setComment_pwd(request.getParameter("pwd"));
		comment.setComment_content(request.getParameter("content"));
		comment.setParent_seqno(Integer.parseInt(request.getParameter("parent")));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		comment.setComment_date(strDate);
		comment.setComment_seqno(commentDao.getMaxSeqno());
		
		
	}
}
