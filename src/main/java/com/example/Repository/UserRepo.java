package com.example.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.model.UserModel;
@Repository
public interface UserRepo extends CrudRepository<UserModel, Integer> {

}
