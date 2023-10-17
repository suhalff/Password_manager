package com;

import java.io.Serializable;

public class PasswordDTO implements Serializable{
	public String website;
	public String username;
	public String password;
	@Override
	public String toString() {
		return "PasswordDTO [website=" + website + ", username=" + username + ", password=" + password + "]";
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
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
	public void setPassword(String password) {
		this.password = password;
	}
	public PasswordDTO(String website, String username, String password) {
		super();
		this.website = website;
		this.username = username;
		this.password = password;
	}
	public PasswordDTO() {
	}
	
}
