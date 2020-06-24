package dao;

import java.util.List;

import model.Condition;
import model.Customer;
import model.Item;
import model.Review;

public interface ItemDao {
	public Integer getMaxSeqno();
	public void insertItem(Item item);
	public Integer getItemCount();
	public List<Item> getItemList(Condition c);
	public Item getItem(Integer seqno);
	public void deleteItem(Integer seqno);
	public void updateItem(Item item);
	public List<Item> getItemByWriter(String writer);
	public List<Item> getItemByName(String name);
	public List<Item> getItemByContent(String content);
	
	public List<Review> getItemReview(Integer seqno);
	public Integer getItemReviewMax();
	public Integer getItemReviewGroup(Integer parent);
	public void insertItemReview(Review review);
	public void deleteItemReview(Integer seqno);
	public Review getSingleItemReview(Integer seqno);
	public void modifyItemReview(Review review);
	public List<Customer> getBuyer(Item item);
	
}
