package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.SecondHandDao;
import model.Condition;
import model.Secondhand;

@Repository
public class SecondHandDaoImpl implements SecondHandDao {
	@Autowired
	SqlSession session;
	
	public Integer getMaxSeqno() {
		Integer seqno=session.selectOne("SecondhandMapper.getMaxSeqno");
		System.out.println(seqno);
		if(seqno==null) {
			seqno=1;
		}else seqno+=1;
		return seqno;
	}

	public void insertSecondHand(Secondhand secondhand) {
		session.insert("SecondhandMapper.insertSecondHand", secondhand);
	}

	public List<Secondhand> getSecondHandList(Condition condition) {
		return session.selectList("SecondhandMapper.getSecondHandList",condition);
	}

	public Integer getSecondhandCount() {
		return session.selectOne("SecondhandMapper.getSecondHandCount");
	}
	

}
