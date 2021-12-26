package com.capstone.rezervation.rezervation.service;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.CouponRespository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponService {
    @Autowired
    private CouponRespository repository;

    public Coupon saveCoupon(Coupon coupon) {
        return repository.save(coupon);
    }


    public List<Coupon> getCoupons(){
        return repository.findAll();
    }
    public Coupon getCouponById(String id){
        return repository.findById(id).orElse(null);
    }

    public String deleteCoupon(String id){
        repository.deleteById(id);
        return "coupon Deleted " + id;
    }
  
}
