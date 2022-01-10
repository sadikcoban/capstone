package com.capstone.rezervation.rezervation.controller;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
public class UserController {
    @Autowired
    private UserService service;

    @PostMapping("/adduser")
    public User addUser(@RequestParam(value="id", required=true) String id,@RequestParam(value="name", required=true) String name, @RequestParam(value="surname", required=true) String surname){
        User newUser = new User();
        newUser.setId(id);
        newUser.setName(name);
        newUser.setSurname(surname);
        return service.saveUser(newUser);
    }
    public User addUserEvent(String id,String name,String surname){
        User newUser = new User();
        newUser.setId(id);
        newUser.setName(name);
        newUser.setSurname(surname);
        return service.saveUser(newUser);
    }
    @PostMapping("/addusers")
    public List<User> addUsers(@RequestBody List<User> users){
        return service.saveUsers(users);
    }
    @GetMapping("/user")
    public List<User> getUsers(){
        return service.getUsers();
        }

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable String id){
        return service.getUserById(id);
    }
/*
    @PutMapping(value="/update")
    public User updateUser(@RequestBody User user) {
        return service.updateUser(user);
    }*/

    @DeleteMapping(value="/user/delete/{id}")
    public String deleteUser(@PathVariable String id){
        return service.deleteUser(id);
    }
    
}
