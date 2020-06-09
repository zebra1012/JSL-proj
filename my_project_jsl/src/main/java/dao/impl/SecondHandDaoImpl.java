package dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.SecondHandDao;
import model.Secondhand;

@Repository
public class SecondHandDaoImpl implements SecondHandDao {
	@Autowired
	SqlSession session;
	
	public Integer getMaxSeqno() {
		Integer seqno=session.selectOne("SecondhandMapper.getMaxSeqno");
		if(seqno==null) {
			seqno=1;
		}else seqno+=1;
		return seqno;
	}

	public void insertSecondHand(Secondhand secondhand) {
		session.insert("SecondhandMapper.insertSecondHand", secondhand);
		
	}

}
