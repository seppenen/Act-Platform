package model;

public class Services {

	String title, description, tag;
	int service_id, business_id, kuva_id, price;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTag() {
		return tag;
	}
	
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	public int getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(int business_id) {
		this.business_id = business_id;
	}
	public int getKuva_id() {
		return kuva_id;
	}
	public void setKuva_id(int kuva_id) {
		this.kuva_id = kuva_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "service [title=" + title + ", description=" + description + ", tag=" + tag + ", service_id="
				+ service_id + ", business_id=" + business_id + ", kuva_id=" + kuva_id + ", price=" + price + "]";
	}
}
