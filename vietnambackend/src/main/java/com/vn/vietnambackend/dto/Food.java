package com.vn.vietnambackend.dto;


import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Food {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter the name of Food !")
	private String name;
	
	private String code;
	
	@NotBlank(message="Please enter the description of food !")
	private String description;
	
	@JsonIgnore
	/*@NotBlank(message="Please enter the content of food !")*/
	private String content;
	
	@NotBlank(message="Please enter the address of food !")
	private String address;
	
	@Column(name = "price_min")
	@Min(value=1, message="Price is not be less than 1 !")
	private double priceMin;
	
	@Column(name = "price_max")
	@Max(value=999999000, message="Price is less than 999999000 !")
	private double priceMax;
	
	
	@Column(name = "hours_open")
	private String hoursOpen;
	
	
	@Column(name = "hours_close")
	private String hoursClose;
	
	@NotBlank(message="Please enter some information to contact !")
	private String contact;
	
	@Column(name = "is_active")
	private boolean active=true;
	
	@ManyToOne
	@JoinColumn(name = "city_id")
	private City city;
	
	@Transient
	private String ct;
	
	@Transient
	private MultipartFile file;
	

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	//Default constructor
	public Food() {
		this.code ="VN_FOOD_" + UUID.randomUUID().toString().substring(26).toUpperCase();
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(double priceMin) {
		this.priceMin = priceMin;
	}
	public double getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(double priceMax) {
		this.priceMax = priceMax;
	}
	public String getHoursOpen() {
		return hoursOpen;
	}
	public void setHoursOpen(String hoursOpen) {
		this.hoursOpen = hoursOpen;
	}
	public String getHoursClose() {
		return hoursClose;
	}
	public void setHoursClose(String hoursClose) {
		this.hoursClose = hoursClose;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}


	public String getCt() {
		return ct;
	}

	public void setCt(String ct) {
		this.ct = ct;
	}



}
