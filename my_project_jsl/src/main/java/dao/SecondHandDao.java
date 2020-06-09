package dao;

import model.Secondhand;

public interface SecondHandDao {
	public Integer getMaxSeqno();
	public void insertSecondHand(Secondhand secondhand);
}
