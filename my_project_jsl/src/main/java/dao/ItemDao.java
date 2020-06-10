package dao;

import model.Item;

public interface ItemDao {
	public Integer getMaxSeqno();
	public void insertItem(Item item);
}
