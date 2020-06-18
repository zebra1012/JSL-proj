package dao;

import java.util.List;

import model.Cart;
import model.Unsigned_User;

public interface ItemCartDao {
	
	public List<Cart> getFormalCart(String id);
	public void insertFormalCart(Cart cart);
	public Integer getMaxSeqno();
	public void updateFormalCart(Cart cart);
	public Integer getMaxUnsignedUser();
	public void insertUnsignedUser(Unsigned_User user);
	public List<Cart> getUnsignedCart(Integer owner);
	public void updateUnsignedCart(Cart cart);
	public void insertUnsignedCart(Cart cart);
}
