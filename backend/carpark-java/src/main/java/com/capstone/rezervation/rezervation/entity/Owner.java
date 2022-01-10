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
@Table( name = "owners")

public class Owner {
    @Id
    private String id;
    private String name;
    private String surname;
    private String phone;
    private String company;
    private String iban;
    private String address;
    private String mail;
    private String password;

    
}
