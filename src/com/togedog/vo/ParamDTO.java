package com.togedog.vo;

public class ParamDTO
{
	private String filter, order, by;
	private String walkCd, walkCd2, agcCd, petCd, petRepCd, code, item, schCd, addrDetail, title;
	private String walkDate, startTime, endTime;
	private int price, weight, schDate;

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getWalkDate() {
		return walkDate;
	}

	public void setWalkDate(String walkDate) {
		this.walkDate = walkDate;
	}

	public String getSchCd() {
		return schCd;
	}

	public void setSchCd(String schCd) {
		this.schCd = schCd;
	}

	public int getSchDate() {
		return schDate;
	}

	public void setSchDate(int schDate) {
		this.schDate = schDate;
	}

	public String getAgcCd() {
		return agcCd;
	}

	public void setAgcCd(String agcCd) {
		this.agcCd = agcCd;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getWalkCd2()
	{
		return walkCd2;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setWalkCd2(String walkCd2)
	{
		this.walkCd2 = walkCd2;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getWalkCd() {
		return walkCd;
	}

	public void setWalkCd(String walkCd) {
		this.walkCd = walkCd;
	}

	public String getPetCd() {
		return petCd;
	}

	public void setPetCd(String petCd) {
		this.petCd = petCd;
	}

	public String getPetRepCd() {
		return petRepCd;
	}

	public void setPetRepCd(String petRepCd) {
		this.petRepCd = petRepCd;
	}

	public String getFilter()
	{
		return filter;
	}

	public void setFilter(String filter)
	{
		this.filter = filter;
	}

	public String getOrder()
	{
		return order;
	}

	public void setOrder(String order)
	{
		this.order = order;
	}

	public String getBy()
	{
		return by;
	}

	public void setBy(String by)
	{
		this.by = by;
	}
}