package model;

public class Order {
	
	String id, user_id, service_id, business_id, title, start, end, status, kpl;

	public String getKpl() {
		return kpl;
	}

	public void setKpl(String kpl) {
		this.kpl = kpl;
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

	

	@Override
	public String toString() {
		return "Order [id=" + id + ", user_id=" + user_id + ", service_id=" + service_id + ", business_id="
				+ business_id + ", title=" + title + ", start=" + start + ", end=" + end + ", status=" + status
				+ ", kpl=" + kpl + "]";
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



	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
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
