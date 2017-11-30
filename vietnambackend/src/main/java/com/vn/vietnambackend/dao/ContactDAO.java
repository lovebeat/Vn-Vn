package com.vn.vietnambackend.dao;

import java.util.List;
import com.vn.vietnambackend.dto.Contact;

public interface ContactDAO {

	List<Contact> list();
	Contact get(int contactId);
	boolean add(Contact contact);
}
