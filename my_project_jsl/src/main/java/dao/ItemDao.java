package dao;

import java.util.List;

import model.Condition;
import model.Item;

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
}
