package controller;

import java.io.IOException;
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

import dao.BBSCommentDao;
import dao.BBSDao;
import model.BBS;
import model.BBS_Hot;
import model.Comment;
import model.Condition;
import model.FormalUser;
import model.Item;
import model.Secondhand;

@Controller
public class BBSController {
	@Autowired
	BBSDao bbsDao;
	@Autowired
	BBSCommentDao bbsCommentDao;

	@RequestMapping(value = "bbs/frontpage.html", method = RequestMethod.GET)
	public ModelAndView ToFrontPage() { // 각 게시판 정보를 받아서 넣어준다.
		ModelAndView mav = new ModelAndView("bbs/frontpage");
		Condition c = new Condition();
		c.setStartRow(1);
		c.setEndRow(10);
		mav.addObject("free_list", bbsDao.getFreeBBSList(c));
		c.setEndRow(5);
		mav.addObject("hobbit_list", bbsDao.getHobbitBBSList(c));
		mav.addObject("read_list", bbsDao.getReadBBSList(c));
		return mav;
	}

	@RequestMapping(value = "bbs/toBBS.html", method = RequestMethod.GET)
	public ModelAndView ToBBS(String state) {// 각 게시판으로 보낸다.
		ModelAndView mav = new ModelAndView();
		if (state.equals("free")) {
			mav.setViewName("redirect:../bbs/freebbs.html");
		} else if (state.equals("hobbit")) {
			mav.setViewName("redirect:../bbs/hobbitbbs.html");

		} else if (state.equals("read")) {
			mav.setViewName("redirect:../bbs/readbbs.html");
		}
		return mav;
	}

	@RequestMapping(value = "bbs/freebbs.html", method = RequestMethod.GET)
	public ModelAndView ToFree(Integer pageNo) {
		ModelAndView mav = new ModelAndView("bbs/freebbs");
		Condition c = new Condition();
		Integer total = bbsDao.getFreeBBSTotal(); // 11개 1페이지 11~2 2페이지 2~1
		if (total == null)
			total = 0;
		int startRow = 0;
		int endRow = 0;
		int pageCnt = 0;
		int currentPage = 0;
		if (pageNo == null)
			currentPage = 1;
		else
			currentPage = pageNo;
		if (total > 0) {
			pageCnt = total / 10;
			if (total % 10 > 0)
				pageCnt++;
			startRow = (currentPage - 1) * 10 + 1; // 1페이지 맥스~맥스-10...
			endRow = currentPage * 10;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		List<BBS> list = bbsDao.getFreeBBSList(c);
		;
		mav.addObject("freebbs", list);
		mav.addObject("COUNT", pageCnt);
		return mav;
	}

	@RequestMapping(value = "bbs/hobbitbbs.html", method = RequestMethod.GET)
	public ModelAndView ToHobbit(Integer pageNo) {
		ModelAndView mav = new ModelAndView("bbs/hobbitbbs");
		Condition c = new Condition();
		Integer total = bbsDao.getHobbitBBSTotal();
		if (total == null)
			total = 0;
		int startRow = 0;
		int endRow = 0;
		int pageCnt = 0;
		int currentPage = 0;
		if (pageNo == null)
			currentPage = 1;
		else
			currentPage = pageNo;
		if (total > 0) {
			pageCnt = total / 10;
			if (total % 10 > 0)
				pageCnt++;
			startRow = (currentPage - 1) * 10 + 1;
			endRow = currentPage * 10;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		List<BBS> list = bbsDao.getHobbitBBSList(c);
		;
		mav.addObject("hobbitbbs", list);
		mav.addObject("COUNT", pageCnt);
		return mav;
	}

	@RequestMapping(value = "bbs/readbbs.html", method = RequestMethod.GET)
	public ModelAndView ToRead(Integer pageNo) {
		ModelAndView mav = new ModelAndView("bbs/readbbs");
		Condition c = new Condition();
		Integer total = bbsDao.getReadBBSTotal();
		if (total == null)
			total = 0;
		int startRow = 0;
		int endRow = 0;
		int pageCnt = 0;
		int currentPage = 0;
		if (pageNo == null)
			currentPage = 1;
		else
			currentPage = pageNo;
		if (total > 0) {
			pageCnt = total / 10;
			if (total % 10 > 0)
				pageCnt++;
			startRow = (currentPage - 1) * 10 + 1;
			endRow = currentPage * 10;
			if (endRow > total)
				endRow = total;
		}
		c.setStartRow(startRow);
		c.setEndRow(endRow);
		List<BBS> list = bbsDao.getReadBBSList(c);
		;
		mav.addObject("readbbs", list);
		mav.addObject("COUNT", pageCnt);
		return mav;
	}

	@RequestMapping(value = "bbs/writeform.html", method = RequestMethod.GET)
	public ModelAndView BBSWriteForm(String type) {
		ModelAndView mav = new ModelAndView("bbs/writeform");
		mav.addObject("BBS", new BBS());
		if (type.equals("free")) {
			mav.addObject("bbstype", 1);
		} else if (type.equals("hobbit")) {
			mav.addObject("bbstype", 2);
		} else if (type.equals("read")) {
			mav.addObject("bbstype", 3);
		}
		return mav;
	}

	@RequestMapping(value = "bbs/write.html", method = RequestMethod.POST)
	public ModelAndView BBSWrite(BBS bbs, BindingResult br, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();

		ServletContext context = request.getSession().getServletContext();
		String filePath = context.getRealPath("/BBS_Image");
		String encType = "euc-kr";
		MultipartRequest Multipart = new MultipartRequest(request, filePath, 5 * 1024 * 1024, encType,
				new DefaultFileRenamePolicy());
		Integer code = Integer.parseInt(Multipart.getParameter("bbs_code")); // 게시판 종류
		String bbsType = "";
		if (code == 1)
			bbsType = "free";
		else if (code == 2)
			bbsType = "hobbit";
		else if (code == 3)
			bbsType = "read";
		String picture_url = Multipart.getFilesystemName("bbs_image");
		bbs.setBbs_seqno(bbsDao.getMaxSeqno());
		bbs.setBbs_title(Multipart.getParameter("bbs_title"));
		bbs.setBbs_content(Multipart.getParameter("bbs_content"));
		bbs.setBbs_writer(Multipart.getParameter("bbs_writer"));
		bbs.setBbs_hot(0);
		bbs.setBbs_password(Multipart.getParameter("bbs_password"));
		bbs.setBbs_state(1);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		bbs.setBbs_date(strDate);
		bbs.setBbs_code(code);
		bbs.setBbs_image(picture_url);
		bbsDao.insertBBS(bbs);
		mav.setViewName("redirect:../bbs/toBBS.html?state=" + bbsType);
		return mav;
	}

	@RequestMapping(value = "bbs/bbsDetail.html", method = RequestMethod.GET)
	public ModelAndView bbsDetail(Integer seqno, Integer rn, String hot, String id) {
		ModelAndView mav = new ModelAndView("bbs/bbsDetail");
		BBS_Hot model = new BBS_Hot();
		BBS bbs = bbsDao.getBBSDetail(seqno);
		if (hot != null && hot.equals("yes")) {
			model.setBbs_seqno(seqno);
			model.setFormal_user_id(id);
			if (bbsDao.checkHot(model) == 0) {
				bbsDao.addHot(seqno);
				bbsDao.addHotTable(model);
			}
		}
		List<Comment> bbsComment = bbsCommentDao.getBBSCommentList(seqno);
		if (bbsComment.size() <= 0)
			bbsComment = null;
		if (bbs == null)
			mav.addObject("result", "Fail");
		else {
			bbs.setRn(rn);
			mav.addObject("comment", bbsComment);
			mav.addObject("result", "Success");
			mav.addObject("target", bbs);
		}
		return mav;
	}

	@RequestMapping(value = "bbs/commentWrite.html", method = RequestMethod.POST)
	public ModelAndView bbsCommentWrite(HttpSession session, HttpServletRequest request) {
		int parent = Integer.parseInt(request.getParameter("parent"));
		int rn = Integer.parseInt(request.getParameter("RN"));
		ModelAndView mav = new ModelAndView("redirect:../bbs/bbsDetail.html?seqno=" + parent + "&rn=" + rn);
		Comment comment = new Comment();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		comment.setComment_seqno(bbsCommentDao.getMaxSeqno());
		comment.setComment_content(request.getParameter("content"));
		comment.setComment_writer(request.getParameter("writer"));
		comment.setComment_pwd(request.getParameter("pwd"));
		comment.setParent_seqno(parent);
		comment.setComment_group(bbsCommentDao.getMaxGroup(comment.getParent_seqno()));
		comment.setComment_order(1); // 첫 번째 댓글이므로 무조건 1
		comment.setComment_date(strDate);
		bbsCommentDao.insertBBSComment(comment);
		return mav;
	}

	@RequestMapping(value = "bbs/askpwd.html", method = RequestMethod.GET)
	public ModelAndView AskPWD(String request, Integer seqno) {
		ModelAndView mav = new ModelAndView("bbs/askresult");
		mav.addObject("seqno", seqno);
		if (request.equals("delete")) {
			mav.addObject("request", "delete");

		} else if (request.equals("modify")) {
			mav.addObject("request", "modify");
		} else if (request.equals("reply")) {
			mav.addObject("request", "reply");
			mav.addObject("reply", new Comment());
		}
		return mav;
	}

	@RequestMapping(value = "bbs/deleteComment.html", method = RequestMethod.GET)
	public ModelAndView deleteComment(String pwd, Integer seqno) {
		ModelAndView mav = new ModelAndView("secondhand/CommentResult");
		if (pwd.equals(bbsCommentDao.getBBSComment(seqno).getComment_pwd())) {
			bbsCommentDao.deleteBBSComment(seqno);
			mav.addObject("result", "Success");
		} else
			mav.addObject("result", "Fail");
		return mav;
	}

	@RequestMapping(value = "bbs/modifyComment.html", method = RequestMethod.GET)
	public ModelAndView modifyComment(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("bbs/CommentResult");
		Integer seqno = Integer.parseInt(request.getParameter("seqno"));
		String pwd = request.getParameter("pwd");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		Comment temp = new Comment();
		System.out.println(pwd);
		temp.setComment_seqno(seqno);
		temp.setComment_writer(writer);
		temp.setComment_content(content);
		if (pwd.equals(bbsCommentDao.getBBSComment(seqno).getComment_pwd())) {
			bbsCommentDao.updateBBSComment(temp);
			mav.addObject("result", "Success");
		} else
			mav.addObject("result", "Fail");
		return mav;
	}

	@RequestMapping(value = "/bbs/commentReply.html", method = RequestMethod.POST)
	public ModelAndView CommentReply(Comment reply, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("secondhand/CommentResult");
		Condition c = new Condition();
		Integer parent = Integer.parseInt(request.getParameter("parent_seqno"));// 답글이 달릴 답글번호
		Comment parentComment = bbsCommentDao.getBBSComment(parent);
		String content = reply.getComment_content();
		reply.setParent_seqno(parentComment.getParent_seqno());
		reply.setComment_content("→" + content);
		reply.setComment_seqno(bbsCommentDao.getMaxSeqno());
		reply.setComment_group(parentComment.getComment_group());
		c.setParent_seqno(reply.getParent_seqno());
		c.setComment_group(reply.getComment_group());
		reply.setComment_order(bbsCommentDao.getMaxOrder(c));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());
		reply.setComment_date(strDate);
		bbsCommentDao.insertBBSComment(reply);
		mav.addObject("result", "Success");
		return mav;
	}

	@RequestMapping(value = "/bbs/delete.html", method = RequestMethod.GET)
	public ModelAndView bbsDelete(HttpSession session, String seqno) {
		ModelAndView mav = new ModelAndView("bbs/DeleteResult");
		Integer no = Integer.parseInt(seqno);
		BBS target = bbsDao.getBBSDetail(no);
		Integer code = target.getBbs_code();
		String bbsType = "";
		if (code == 1)
			bbsType = "free";
		else if (code == 2)
			bbsType = "hobbit";
		else if (code == 3)
			bbsType = "read";
		FormalUser FU = null;
		try {
			FU = (FormalUser) session.getAttribute("User");
			if (FU == null)
				throw new NullPointerException(); // User가 null일 때 예외를 발생시킨다.
		} catch (Exception E) { // 세션속성 유저가 없거나 세션속성 유저가 일반유저가 아닐 때
			mav.addObject("result", "Fail");
			return mav;
		}
		if (target.getBbs_writer().equals(FU.getUser_id())) { // 세션 유저 아이디가 글쓴이와 같을 때
			bbsDao.deleteBBS(no);
			mav.addObject("result", "Success");
		} else
			mav.addObject("result", "Fail"); // 세션 유저 아이디가 글쓴이와 같지 않을 때
		mav.addObject("Type", bbsType);
		return mav;
	}

	@RequestMapping(value = "bbs/modify.html", method = RequestMethod.GET)
	public ModelAndView secondhandModify(HttpSession session, String seqno, Integer rn) { // 삭제와 동일하지만 수정폼으로 연결해준다.
		ModelAndView mav = new ModelAndView("bbs/ModifyForm");
		Integer no = Integer.parseInt(seqno);
		BBS target = bbsDao.getBBSDetail(no);
		target.setRn(rn);
		FormalUser FU = null;
		try {
			FU = (FormalUser) session.getAttribute("User");
			if (FU == null)
				throw new NullPointerException();
		} catch (Exception E) {
			mav.addObject("result", "Fail");
			return mav;
		}
		if (target.getBbs_writer().equals(FU.getUser_id())) {
			mav.addObject("seqno", target.getBbs_seqno());
			mav.addObject("bbs", target); // 폼 작성을 위한 객체 주입
			mav.addObject("result", "Success");

		} else
			mav.addObject("result", "Fail");
		return mav;
	}

	@RequestMapping(value = "bbs/modify.html", method = RequestMethod.POST) // 수정폼에서 입력한 자료로 업데이트한다.
	public ModelAndView bbsModify(BBS model, BindingResult br, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/bbs/ModifyResult");
		ServletContext context = request.getSession().getServletContext();
		String filePath = context.getRealPath("/BBS_Image");
		String encType = "euc-kr";
		MultipartRequest Multipart = new MultipartRequest(request, filePath, 5 * 1024 * 1024, encType,
				new DefaultFileRenamePolicy());
		model.setBbs_seqno(Integer.parseInt(Multipart.getParameter("bbs_seqno")));
		model.setBbs_title(Multipart.getParameter("bbs_title"));
		model.setBbs_writer(Multipart.getParameter("bbs_writer"));
		model.setBbs_content(Multipart.getParameter("bbs_content"));
		String picture_url = Multipart.getFilesystemName("bbs_image");
		if (picture_url == null)
			picture_url = bbsDao.getBBSImage(model.getBbs_seqno()); // 이미지 변경을 안 하면 기존 이미지 사용
		model.setBbs_image(picture_url);
		model.setRn(Integer.parseInt(Multipart.getParameter("rn")));
		mav.addObject("seqno", model.getBbs_seqno());
		mav.addObject("rn", model.getRn());
		mav.addObject("result", "Success");
		bbsDao.modifyBBS(model);
		return mav;
	}

	@RequestMapping(value = "bbs/search.html", method = RequestMethod.GET)
	public ModelAndView search(String bbs, String type, String keyword) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		String decoded = URLDecoder.decode(keyword,"UTF-8");
		List<BBS> list= null;
		System.out.println(decoded);
		if (bbs.equals("free")) {
			mav.setViewName("bbs/freebbs");
			if (type.equals("writer")) {
				list =bbsDao.getFreeByWriter(decoded);
				mav.addObject("freebbs", list);
			} else if (type.equals("content")) {
				list =bbsDao.getFreeByContent(decoded);
				mav.addObject("freebbs", list);
			} else if (type.equals("title")) {
				list =bbsDao.getFreeByTitle(decoded);
				mav.addObject("freebbs", list);
			}
		} else if (bbs.equals("hobbit")) {
			mav.setViewName("bbs/hobbitbbs");
			if (type.equals("writer")) {
				list =bbsDao.getHobbitByTitle(decoded);
				mav.addObject("hobbitbbs", list);
			} else if (type.equals("content")) {
				list =bbsDao.getHobbitByContent(decoded);
				mav.addObject("hobbitbbs", list);
			} else if (type.equals("title")) {
				list =bbsDao.getHobbitByTitle(decoded);
				mav.addObject("hobbitbbs", list);
			}
		} else if (bbs.equals("read")) {
			mav.setViewName("bbs/readbbs");
			if (type.equals("writer")) {
				list =bbsDao.getReadByTitle(decoded);
				mav.addObject("readbbs", list);
			} else if (type.equals("content")) {
				list =bbsDao.getReadByContent(decoded);
				mav.addObject("readbbs", list);
			} else if (type.equals("title")) {
				list =bbsDao.getReadByTitle(decoded);
				mav.addObject("readbbs", list);
			}
		}
		
		return mav;
	}

}
