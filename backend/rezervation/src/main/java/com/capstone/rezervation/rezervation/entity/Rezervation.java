package com.capstone.rezervation.rezervation.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "rezervations")

public class Rezervation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int lotId;
    private int start_hour;
    private int end_hour;
    private String date;
    private Double price_calculated;
    private String coupon_id;
    private Double net_price;
    private String vehicle_id;
    private String status;
    private String user_id;

    
}