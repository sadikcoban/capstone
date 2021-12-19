package com.capstone.rezervation.rezervation.repository;

import com.capstone.rezervation.rezervation.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByName(String name);
    
}
