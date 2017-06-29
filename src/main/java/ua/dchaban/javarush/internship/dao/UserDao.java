package ua.dchaban.javarush.internship.dao;

import ua.dchaban.javarush.internship.entity.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getAllUsers();

    List<User> getAdmins();

    List<User> searchUsersByName(String searchName);
}
