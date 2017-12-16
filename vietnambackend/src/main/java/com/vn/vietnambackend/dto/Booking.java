package com.vn.vietnambackend.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name_guest")
	private String nameGuest;
	
	@Column(name="address_guest")
	private String addressGuest;
	
	@Column(name="phone_guest")
	private String phoneGuest;
	
	@Column(name="date_arrive")
	private String dateArrive;
	
	@Column(name="date_leave")
	private String dateLeave;
	
	@Column(name="room_id")
	private int roomId;
	
	@Column(name="is_active")
	private boolean active=true;
	
	public Booking() {}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameGuest() {
		return nameGuest;
	}

	public void setNameGuest(String nameGuest) {
		this.nameGuest = nameGuest;
	}

	public String getAddressGuest() {
		return addressGuest;
	}

	public void setAddressGuest(String addressGuest) {
		this.addressGuest = addressGuest;
	}

	public String getPhoneGuest() {
		return phoneGuest;
	}

	public void setPhoneGuest(String phoneGuest) {
		this.phoneGuest = phoneGuest;
	}

	public String getDateArrive() {
		return dateArrive;
	}

	public void setDateArrive(String dateArrive) {
		this.dateArrive = dateArrive;
	}

	public String getDateLeave() {
		return dateLeave;
	}

	public void setDateLeave(String dateLeave) {
		this.dateLeave = dateLeave;
	}



	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	

}
