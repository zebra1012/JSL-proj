package dao;

import java.util.List;

import model.Cart;
import model.Shopping;
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
	public void clearFormalCart(String id);
	public void clearUnsignedCart(Integer no);
	public Integer getMaxFormalShopping();
	public Integer getMaxUnsignedShopping();
	public void insertFormalShopping(Shopping target);
	public void insertUnsignedShopping(Shopping target);
	public List<Shopping> getFormalShopping(String id);
	public List<Shopping> getUnsignedShopping(Integer no);
	public List<Shopping> getItemFromUserShopping(String buyer);
	
	
}
