package com.example.cnw.entity;

public class Cart {
	 private int accountID;
	 private int productID;
	 private int amount;
	 private int maCart;
	 private String memory;
	public Cart(int accountID, int productID, int amount, int maCart, String memory) {
	
		this.accountID = accountID;
		this.productID = productID;
		this.amount = amount;
		this.maCart = maCart;
		this.memory = memory;
	}
	public Cart() {
		
	}
	public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMaCart() {
		return maCart;
	}
	public void setMaCart(int maCart) {
		this.maCart = maCart;
	}
	public String getMemory() {
		return memory;
	}
	public void setMemory(String memory) {
		this.memory = memory;
	}
	@Override
	public String toString() {
		return "Cart [accountID=" + accountID + ", productID=" + productID + ", amount=" + amount + ", maCart=" + maCart
				+ ", memory=" + memory + "]";
	} 
	 
	
}
