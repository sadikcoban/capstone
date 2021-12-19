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
    public User addUser(@RequestParam(value="name", required=true) String name, @RequestParam(value="surname", required=true) String surname){
        User newUser = new User();
        newUser.setName(name);
        newUser.setSurname(surname);
        return service.saveUser(newUser);
    }
    @PostMapping("/addusers")
    public List<User> addUsers(@RequestBody List<User> users){
        return service.saveUsers(users);
    }

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable int id){
        return service.getUserById(id);
    }

    @PutMapping(value="/update")
    public User updateUser(@RequestBody User user) {
        return service.updateUser(user);
    }

    @DeleteMapping(value="/delete/{id}")
    public String deleteUser(@PathVariable int id){
        return service.deleteUser(id);
    }
    
}
