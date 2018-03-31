package model;

public class User {
String username, password, id;
String email;
String company;
public String getEmail() {
	return email;
}
public void setEmail(String string) {
	this.email = string;
}
int status;

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


public String getCompany() {
	return company;
}
@Override
public String toString() {
	return "User [username=" + username + ", password=" + password + ", id=" + id + ", email=" + email + ", company="
			+ company + ", status=" + status + "]";
}
public void setCompany(String company) {
	this.company = company;
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
