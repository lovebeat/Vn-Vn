package com.vn.vietnambackend.dao;

import com.vn.vietnambackend.dto.User;

public interface UserDAO {
	
	boolean addUser(User user);
	User getByEmail(String email);

}
