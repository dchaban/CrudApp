package ua.dchaban.javarush.internship.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import ua.dchaban.javarush.internship.entity.User;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        LOGGER.info("User added: " + user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        LOGGER.info("User updated: " + user);
    }

    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        if (user != null)
            session.delete(user);
        LOGGER.info("User remove: " + user);
    }

    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        LOGGER.info("User loaded " + user);
        return user;
    }

    public List<User> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        List<User> users = session.createQuery("from User").list();
        for (User user : users)
            LOGGER.info("User list: " + user);
        return users;
    }

    public List<User> getAdmins() {
        Session session = sessionFactory.getCurrentSession();
        List<User> admins = session.createQuery("from User where isAdmin = true").list();
        for (User admin : admins)
            LOGGER.info("Admin list: " + admin);
        return admins;
    }

    public List<User> searchUsersByName(String searchName) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where name like :NAME", User.class);
        query.setParameter("NAME", "%" + searchName + "%");
        List<User> users = query.list();
        for (User user : users)
            LOGGER.info("User list: " + user);
        return users;
    }

}
