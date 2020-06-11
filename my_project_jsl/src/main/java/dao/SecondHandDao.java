package dao;

import java.util.List;

import model.Condition;
import model.Secondhand;

public interface SecondHandDao {
	public Integer getMaxSeqno();
	public void insertSecondHand(Secondhand secondhand);
	public List<Secondhand> getSecondHandList(Condition condition);
	public Integer getSecondhandCount();
	public Secondhand getSecondhandDetail(Integer seqno);
	public void deleteSecondHand(Integer seqno);
	public void ModifySecondHand(Secondhand secondhand);
}
