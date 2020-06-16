package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ItemDao;
import model.Condition;
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

	public Integer getItemCount() {
		return session.selectOne("ItemMapper.getItemCount");
	}

	public List<Item> getItemList(Condition c) {
		return session.selectList("ItemMapper.getItemList", c);
	}

	public Item getItem(Integer seqno) {
		return session.selectOne("ItemMapper.getItem",seqno);
	}

	public void deleteItem(Integer seqno) {
		session.delete("ItemMapper.deleteItem",seqno);
		
	}

	public void updateItem(Item item) {
		session.update("ItemMapper.updateItem", item);
		
	}

	public List<Item> getItemByWriter(String writer) {
		return session.selectList("ItemMapper.getItemByWriter", writer);
	}

	public List<Item> getItemByName(String name) {
		return session.selectList("ItemMapper.getItemByName", name);
	}

	public List<Item> getItemByContent(String content) {
		return session.selectList("ItemMapper.getItemByContent", content);
	}
	
	
	
	
	

}
