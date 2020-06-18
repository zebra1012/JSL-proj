package model;

public class Shopping { //쇼핑모델, 비회원과 일반회원이 동일한 모델을 이용한다.
	private String shopping_date;
	private Integer shopping_seqno,	shopping_buyer,shopping_item,shopping_quantity, shopping_shipment;
	public String getShopping_date() {
		return shopping_date;
	}
	public void setShopping_date(String shopping_date) {
		this.shopping_date = shopping_date;
	}
	public Integer getShopping_seqno() {
		return shopping_seqno;
	}
	public void setShopping_seqno(Integer shopping_seqno) {
		this.shopping_seqno = shopping_seqno;
	}
	public Integer getShopping_buyer() {
		return shopping_buyer;
	}
	public void setShopping_buyer(Integer shopping_buyer) {
		this.shopping_buyer = shopping_buyer;
	}
	public Integer getShopping_item() {
		return shopping_item;
	}
	public void setShopping_item(Integer shopping_item) {
		this.shopping_item = shopping_item;
	}
	public Integer getShopping_quantity() {
		return shopping_quantity;
	}
	public void setShopping_quantity(Integer shopping_quantity) {
		this.shopping_quantity = shopping_quantity;
	}
	public Integer getShopping_shipment() {
		return shopping_shipment;
	}
	public void setShopping_shipment(Integer shopping_shipment) {
		this.shopping_shipment = shopping_shipment;
	}
	
	
}
