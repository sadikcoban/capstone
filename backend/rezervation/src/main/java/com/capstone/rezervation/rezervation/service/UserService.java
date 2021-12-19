package com.capstone.rezervation.rezervation.service;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository repository;

    public User saveUser(User user) {
        return repository.save(user);
    }

    public List<User> saveUsers(List<User> users) {
        return repository.saveAll(users);

    }


    public List<User> getUsers(){
        return repository.findAll();
    }

    public User getUserById(int id){
        return repository.findById(id).orElse(null);
    }

    public User getUserByName(String name){
        return repository.findByName(name);
    }

    public String deleteUser(int id){
        repository.deleteById(id);
        return "USer Deleted " + id;
    }

    public User updateUser(User user){
       User existingUser = repository.findById(user.getId()).orElse(null);
       existingUser.setName(user.getName());
       existingUser.setSurname(user.getSurname());
       return repository.save(existingUser);
    }
}
