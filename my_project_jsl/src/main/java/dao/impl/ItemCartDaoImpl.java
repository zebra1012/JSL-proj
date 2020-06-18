package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.ItemCartDao;
import model.Cart;
import model.Unsigned_User;

@Repository
public class ItemCartDaoImpl implements ItemCartDao {
	@Autowired
	SqlSession session;
	public List<Cart> getFormalCart(String id) {
		return session.selectList("ItemCartMapper.getFormalCart", id);	
	}
	public void insertFormalCart(Cart cart) {
		session.insert("ItemCartMapper.insertFormalCart",cart);
	}
	public Integer getMaxSeqno() {
		Integer max= session.selectOne("ItemCartMapper.getMaxSeqno");
		if (max==null) max=1;
		else max+=1;
		return max;
	}
	public void updateFormalCart(Cart cart) {
		session.update("ItemCartMapper.updateFormalCart", cart);	
	}
	public Integer getMaxUnsignedUser() {
		Integer max=session.selectOne("ItemCartMapper.getMaxUnsignedUser");
		if (max==null) max=1;
		else max+=1;
		return max;
	}
	public void insertUnsignedUser(Unsigned_User user) {
		session.insert("ItemCartMapper.insertUnsignedUser",user);
	}
	public List<Cart> getUnsignedCart(Integer owner) {
		return session.selectList("ItemCartMapper.getUnsignedCart", owner);
	}
	public void updateUnsignedCart(Cart cart) {
		session.update("ItemCartMapper.updateUnsignedCart",cart);
	}
	public void insertUnsignedCart(Cart cart) {
		session.insert("ItemCartMapper.insertUnsignedCart", cart);
	}
	
	
}
