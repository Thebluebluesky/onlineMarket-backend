package com.backend.adminEnd.dao;

import com.backend.adminEnd.model.SellerEntity;

import java.util.List;

/**
 * Created by kevin on 2017/4/11.
 */
public interface SellerDao {
    public void addSeller(SellerEntity seller);
    public void updateSeller(SellerEntity seller);
    public List<SellerEntity> listSeller();
    public SellerEntity getSellerById(String sellerId);
    public void removeSeller(String sellerId);
}