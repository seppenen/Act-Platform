package model;

public class User {
String username, email, company,password, id;

public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
int status;

public String getEmail() {
	return email;
}
public void setEmail(String string) {
	this.email = string;
}


public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}


@Override
public String toString() {
	return "User [username=" + username + ", email=" + email + ", company=" + company + ", password=" + password
			+ ", id=" + id + ", status=" + status + "]";
}
public void setPassword(String password) {
	this.password = password;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
}
