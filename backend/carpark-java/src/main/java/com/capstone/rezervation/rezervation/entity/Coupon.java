package com.capstone.rezervation.rezervation.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table( name = "coupons")

public class Coupon {
    @Id
    private String id;
    private String name;
    private String explanation;
    private Double discount_rate;
    private String user_id;

    
}
