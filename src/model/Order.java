package model;

public class Order {
	
	String id, user_id, service_id, business_id, title,  end, date,  phone,   message, status, owner;

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}





	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getService_id() {
		return service_id;
	}

	



	public void setService_id(String service_id) {
		this.service_id = service_id;
	}

	public String getBusiness_id() {
		return business_id;
	}

	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




	@Override
	public String toString() {
		return "Order [id=" + id + ", user_id=" + user_id + ", service_id=" + service_id + ", business_id="
				+ business_id + ", title=" + title + ", end=" + end + ", date=" + date + ", phone=" + phone
				+ ", message=" + message + ", status=" + status + ", owner=" + owner + "]";
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
