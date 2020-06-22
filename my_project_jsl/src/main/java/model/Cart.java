package model;

public class Cart { //카트 모델 일반유저와 비회원유저의 카트 모델은 동일하다.
	private Integer cart_seqno,cart_itemseqno,cart_quantity;
	private String cart_owner;
	private Item item; //정보출력용 상품

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Integer getCart_seqno() {
		return cart_seqno;
	}

	public void setCart_seqno(Integer cart_seqno) {
		this.cart_seqno = cart_seqno;
	}

	public String getCart_owner() {
		return cart_owner;
	}

	public void setCart_owner(String cart_owner) {
		this.cart_owner = cart_owner;
	}

	public Integer getCart_itemseqno() {
		return cart_itemseqno;
	}

	public void setCart_itemseqno(Integer cart_itemseqno) {
		this.cart_itemseqno = cart_itemseqno;
	}

	public Integer getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(Integer cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	
	
}
