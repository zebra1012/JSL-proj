package dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.SHCommentDao;
import model.Condition;

@Repository
public class SHCommentDaoImpl implements SHCommentDao {
	
	@Autowired
	SqlSession session;
	public Integer getMaxSeqno() {
		Integer seqno=session.selectOne("SecondhandCommentMapper.getMaxSeqno");
		if (seqno == null) seqno=1;
		else seqno+=1;
		return seqno;
	}
	public Integer getMaxGroup(Integer parent) {
		Integer seqno=session.selectOne("SecondhandCommentMapper.getMaxGroup",parent);
		if (seqno==null) seqno=1;
		else seqno+=1;
		return seqno;
	}
	public Integer getMaxOrder(Condition c) {
		Integer seqno = session.selectOne("SecondhandCommentMapper.getMaxOrder",c);
		if(seqno==null) seqno=1;
		else seqno+=1;
		return seqno;
	}

}
