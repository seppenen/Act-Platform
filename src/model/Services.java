package model;

public class Services {

	String title, description, to, from, days, owner, price, hours;
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	int service_id, business_id, kuva_id;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public void setDescription(String description) {
		this.description = description;
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

	public String getPrice() {
		return price;
	}
	public void setPrice(String string) {
		this.price = string;
	}
	@Override
	public String toString() {
		return "Services [title=" + title + ", description=" + description + ", to=" + to + ", from=" + from + ", days="
				+ days + ", owner=" + owner + ", service_id=" + service_id + ", business_id=" + business_id
				+ ", kuva_id=" + kuva_id + ", price=" + price + "]";
	}
	

}
