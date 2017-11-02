package com.vn.vietnambackend.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Generated;

@Entity
public class place {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String code;
	private String description;
	private String content;
	@Column(name="is_active")
	private boolean isActive;
	@Column(name="city_id")
	private int cityId;
	
	public place() {
		this.code = "PLACE"+UUID.randomUUID().toString().substring(26).toUpperCase();
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
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	@Override
	public String toString() {
		return "place [id=" + id + ", name=" + name + ", code=" + code + ", description=" + description + ", content="
				+ content + ", isActive=" + isActive + ", cityId=" + cityId + "]";
	}
	
	

}
