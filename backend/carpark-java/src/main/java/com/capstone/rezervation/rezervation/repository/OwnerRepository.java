package com.capstone.rezervation.rezervation.repository;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Owner;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OwnerRepository extends JpaRepository<Owner, Integer> {


    
}
