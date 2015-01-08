package com.verigo.supplier.service;

import com.verigo.supplier.model.User;
import java.util.List;

public interface UserService {
    
    void createUser(User user);
    User readUser(int userId);
    void updateUser(User user);
    void deleteUser(User user);
    
    List getAllUsers();
    User getUserByLogin(String login);
    
    boolean CheckUser(String login);
}
