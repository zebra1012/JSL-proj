package dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ItemDao;
import model.Item;

@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired 
	SqlSession session;

	public Integer getMaxSeqno() {
		Integer seqno= session.selectOne("ItemMapper.getMaxSeqno");
		if(seqno==null) seqno=1;
		else seqno+=1;
		return seqno;
	}

	public void insertItem(Item item) {
		session.insert("ItemMapper.insertItem",item);
		
	}
	

}
