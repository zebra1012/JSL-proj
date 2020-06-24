package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.BBSCommentDao;
import model.Comment;
import model.Condition;

@Repository
public class BBSCommentDaoImpl implements BBSCommentDao {
	@Autowired
	SqlSession session;
	public Integer getMaxSeqno() {
		Integer max = session.selectOne("BBSCommentMapper.getMaxSeqno");
		if (max ==null) max=1;
		else max+=1;
		return max;
	}
	public Integer getMaxGroup(Integer parent) {
		Integer max= session.selectOne("BBSCommentMapper.getMaxGroup", parent);
		if(max==null) max=1;
		else max+=1;
		return max;
	}
	public Integer getMaxOrder(Condition c) {
		Integer max= session.selectOne("BBSCommentMapper.getMaxOrder", c);
		if(max==null) max=1;
		else max+=1;
		return max;
	}
	public void insertBBSComment(Comment comment) {
		session.insert("BBSCommentMapper.insertBBSComment", comment);
	}
	public List<Comment> getBBSCommentList(Integer parent) {
		return session.selectList("BBSCommentMapper.getBBSCommentList", parent);
	}
	public Comment getBBSComment(Integer seqno) {
		return session.selectOne("BBSCommentMapper.getBBSComment",seqno);
	}
	public void deleteBBSComment(Integer seqno) {
		session.delete("BBSCommentMapper.deleteBBSComment",seqno);
	}
	public void updateBBSComment(Comment comment) {
		session.update("BBSCommentMapper.updateBBSComment", comment);
	}
	

}
