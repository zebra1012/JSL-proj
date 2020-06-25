package model;

public class Customer {
	private Integer shopping_seqno, item_seqno, item_price, shopping_quantity, shopping_shipment;
	private String shopping_buyer, item_name;
	public Integer getShopping_seqno() {
		return shopping_seqno;
	}
	public void setShopping_seqno(Integer shopping_seqno) {
		this.shopping_seqno = shopping_seqno;
	}
	public Integer getItem_seqno() {
		return item_seqno;
	}
	public void setItem_seqno(Integer item_seqno) {
		this.item_seqno = item_seqno;
	}
	public Integer getItem_price() {
		return item_price;
	}
	public void setItem_price(Integer item_price) {
		this.item_price = item_price;
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
	public String getShopping_buyer() {
		return shopping_buyer;
	}
	public void setShopping_buyer(String shopping_buyer) {
		this.shopping_buyer = shopping_buyer;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	
	
	
}