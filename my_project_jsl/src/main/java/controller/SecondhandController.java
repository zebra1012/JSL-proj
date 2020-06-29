package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

import dao.SHCommentDao;
import dao.SecondHandDao;
import model.AdminUser;
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
		if (total > 0) {
			pageCnt = total / 10;
			int reminder = total%10;
			if (total % 10 > 0)
				pageCnt++; //10개 1페이지 1~10 12개 총2개 1페이지 3-12
			if (reminder==0) reminder=10;
			endRow = (pageCnt-currentPage)*10+reminder;
			startRow = (pageCnt-currentPage-1)*10+reminder+1;
			if (endRow > total)
				endRow = total;
			if(startRow<0) 
				startRow=1;
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
	public ModelAndView secondhandDetail(String seqno) { //글 정보와 댓글 정보를 함께 담는다.
		ModelAndView mav = new ModelAndView("secondhand/detail");
		Integer no = Integer.parseInt(seqno);
		Secondhand target = SecondHandDao.getSecondhandDetail(no);
		List<Comment> target_comment=commentDao.getCommentList(no);
		mav.addObject("CommentList",target_comment); //댓글 정보
		mav.addObject("secondhand",target); //글 정보 
		return mav;
	}
	@RequestMapping(value="/secondhand/delete.html",method=RequestMethod.GET)
	public ModelAndView secondhandDelete(HttpSession session,String seqno) {
		ModelAndView mav = new ModelAndView("secondhand/DeleteResult");
		Integer no = Integer.parseInt(seqno);
		Secondhand target = SecondHandDao.getSecondhandDetail(no);
		String usertype=(String)session.getAttribute("Type");
		if (usertype.equals("Admin")) { //관리자이면
			AdminUser AU = (AdminUser) session.getAttribute("User");
			if(AU.getAdmin_power()==0 || AU.getAdmin_power()==1) { //관리자의 권한이 마스터거나 중고거래이ㅕㄴ
				SecondHandDao.deleteSecondHand(no);
				mav.addObject("result","Success");
			}
			else  //그 외
				mav.addObject("result","Fail");
			return mav;
			
		}
		else {
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
		MultipartRequest Multipart = new MultipartRequest(request,filePath,5*1024*1024,encType,new DefaultFileRenamePolicy());	
		model.setSecondhand_seqno(Integer.parseInt(Multipart.getParameter("secondhand_seqno")));
		model.setSecondhand_title(Multipart.getParameter("secondhand_title"));
		model.setSecondhand_price(Integer.parseInt(Multipart.getParameter("secondhand_price")));
		model.setSecondhand_local(Multipart.getParameter("secondhand_local"));
		String picture_url=Multipart.getFilesystemName("secondhand_image");
		if (picture_url==null) picture_url=SecondHandDao.getImage(model.getSecondhand_seqno()); //이미지 변경을 안 하면 기존 이미지 사용
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
	
	@RequestMapping(value="/secondhand/commentWrite.html",method=RequestMethod.POST) //기본댓글
	public ModelAndView commentWrite(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Comment comment=new Comment();
		if (request.getParameter("Type").equals("Formal")) comment.setComment_type(1); //일반회원
		else comment.setComment_type(0); //일반회원이 아님
		comment.setComment_writer(request.getParameter("writer"));
		comment.setComment_pwd(request.getParameter("pwd"));
		comment.setComment_content(request.getParameter("content"));
		comment.setParent_seqno(Integer.parseInt(request.getParameter("parent")));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		comment.setComment_date(strDate);
		comment.setComment_seqno(commentDao.getMaxSeqno());
		comment.setComment_group(commentDao.getMaxGroup(comment.getParent_seqno())); //그룹, 이 컨트롤러가 실행될 때 마다 +1
		comment.setComment_order(1); //정렬, 기본 댓글이므로 무조건 1
		commentDao.insertComment(comment);
		mav.setViewName("redirect:../secondhand/Detail.html?seqno="+comment.getParent_seqno());
		return mav;
	}
	@RequestMapping(value="secondhand/askpwd.html", method=RequestMethod.GET)
	public ModelAndView AskPWD(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("secondhand/askresult");
		Integer seqno = Integer.parseInt(request.getParameter("seqno"));
		String req = request.getParameter("request");
		String temp = request.getParameter("type");
		Integer type=null;
		if(temp!=null) {
			type=Integer.parseInt(temp);
		}
		mav.addObject("seqno",seqno);
		if(req.equals("delete")) {
			mav.addObject("request","delete");
			mav.addObject("type",type);
			
		}
		else if (req.equals("modify")) {
			mav.addObject("request","modify");
			mav.addObject("type",type);
		}
		else if (req.equals("reply")) {
			mav.addObject("request","reply");
			mav.addObject("reply",new Comment());
			
		}
		return mav;
	}
	@RequestMapping(value="secondhand/deleteComment.html",method=RequestMethod.GET)
	public ModelAndView deleteComment(HttpServletRequest request,HttpSession session) {
		ModelAndView mav = new ModelAndView("secondhand/CommentResult");
		String pwd = request.getParameter("pwd");
		Integer seqno = Integer.parseInt(request.getParameter("seqno"));
		if (pwd!=null) {
			if(pwd.equals(commentDao.getComment(seqno).getComment_pwd())) {
				commentDao.deleteComment(seqno);
				mav.addObject("result", "Success");
			}else mav.addObject("result","Fail");
		}
		else { //비밀번호가 없다. =일반회원이다.
			String type=(String)session.getAttribute("Type");
			FormalUser user=(FormalUser)session.getAttribute("User");
			Comment c = commentDao.getComment(seqno);
			if (c.getComment_writer().equals(user.getUser_id())) {
				commentDao.deleteComment(seqno);
				mav.addObject("result","Success");
			}else mav.addObject("result","Fail");
		}
		return mav;
	}
	@RequestMapping(value="secondhand/modifyComment.html",method=RequestMethod.GET)
	public ModelAndView modifyComment(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("secondhand/CommentResult");
		Integer seqno=Integer.parseInt(request.getParameter("seqno"));
		String pwd=request.getParameter("pwd");
		String content = request.getParameter("content");
		String writer=request.getParameter("writer");
		System.out.println(content);
		Comment temp = new Comment();
		temp.setComment_seqno(seqno); temp.setComment_writer(writer);
		temp.setComment_content(content);
		if(pwd.equals(commentDao.getComment(seqno).getComment_pwd())) {
			commentDao.updateComment(temp);
			mav.addObject("result", "Success");
		}else mav.addObject("result","Fail");
		return mav;
	}
	@RequestMapping(value="/secondhand/commentReply.html",method=RequestMethod.POST)
	public ModelAndView CommentReply(Comment reply,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("secondhand/CommentResult");
		Condition c=new Condition();
		Integer parent = Integer.parseInt(request.getParameter("parent_seqno"));//답글이 달릴  답글번호
		Comment parentComment=commentDao.getComment(parent);
		String content=reply.getComment_content();
		reply.setParent_seqno(parentComment.getParent_seqno());
		reply.setComment_content("→"+content);
		reply.setComment_seqno(commentDao.getMaxSeqno());
		reply.setComment_group(parentComment.getComment_group());
		c.setParent_seqno(reply.getParent_seqno());
		c.setComment_group(reply.getComment_group());
		reply.setComment_order(commentDao.getMaxOrder(c));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		reply.setComment_date(strDate);
		commentDao.insertComment(reply);
		mav.addObject("result","Success");
		return mav;
		
	}
	@RequestMapping(value="/secondhand/search.html",method=RequestMethod.GET)
	public ModelAndView Search(String type,String keyword) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView("secondhand/frontpage");
		String decoded = URLDecoder.decode(keyword,"UTF-8");
		if(type.equals("writer")) {
			List<Secondhand> list= SecondHandDao.getSecondHandByWriter(decoded);
			mav.addObject("Secondhand",list);
		}
		if(type.equals("title")) {
			List<Secondhand> list = SecondHandDao.getSecondHandByTitle(decoded);
			mav.addObject("Secondhand",list);
		}
		if(type.equals("content")) {
			List<Secondhand> list  = SecondHandDao.getSecondhandByContent(decoded);
			mav.addObject("Secondhand",list);
		}
		return mav;
	}
}