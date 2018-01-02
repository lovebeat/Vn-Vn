package com.vn.vietnambackend.dto;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

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
	private Date dateArrive;
	
	@Column(name="date_leave")
	private Date dateLeave;
	
	@ManyToOne
    @JoinColumn(name = "room_id")
	private Room room;
	
	@ManyToOne
    @JoinColumn(name = "hotel_id")
	private Hotel hotel;
	
	@Column(name="is_active")
	private boolean active=true;
	
	@ManyToOne
    @JoinColumn(name = "city_id")
	private City city;
	
	@Transient
	private String ct;
	
	@Transient
	private String ht;
	
	@Transient
	private String ro;
	
	@Transient
	private String dateArrString;
	@Transient
	private String dateLeaString;
	
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

	public Date getDateArrive() {
		return dateArrive;
	}

	public void setDateArrive(Date dateArrive) {
		this.dateArrive = dateArrive;
	}

	public Date getDateLeave() {
		return dateLeave;
	}

	public void setDateLeave(Date dateLeave) {
		this.dateLeave = dateLeave;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
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

	public String getHt() {
		return ht;
	}

	public void setHt(String ht) {
		this.ht = ht;
	}

	public String getRo() {
		return ro;
	}

	public void setRo(String ro) {
		this.ro = ro;
	}

	public String getDateArrString() {
		return dateArrString;
	}

	public void setDateArrString(String dateArrString) {
		this.dateArrString = dateArrString;
	}

	public String getDateLeaString() {
		return dateLeaString;
	}

	public void setDateLeaString(String dateLeaString) {
		this.dateLeaString = dateLeaString;
	}
	

}
