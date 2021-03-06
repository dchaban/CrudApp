package ua.dchaban.javarush.internship.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.dchaban.javarush.internship.dao.UserDao;
import ua.dchaban.javarush.internship.entity.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Transactional
    public List<User> getAllUsers() {
        return this.userDao.getAllUsers();
    }

    @Transactional
    public List<User> getAdmins() {
        return this.userDao.getAdmins();
    }

    @Transactional
    public List<User> searchUsersByName(String searchName) {
        return this.userDao.searchUsersByName(searchName);
    }

}
