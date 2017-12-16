package com.vn.vietnambackend.dao;

import java.util.List;

import com.vn.vietnambackend.dto.Banner;


public interface BannerDAO {
	List<Banner> list();
	Banner get(int bannerId);
	boolean add(Banner banner);
	boolean update(Banner banner);
	boolean delete(Banner banner);
	List<Banner> listActive();
}
