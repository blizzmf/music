package music.dao;



import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;


import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import music.model.Band;
import music.model.Login;
import music.model.User;

@Repository
public class UserDaoImpl implements UserDao{

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(UserDaoImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void add(User obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		LOGGER.info("User successfully saved. User details: " + obj);
	}

	@Override
	public User getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.load(User.class, new Integer(id));
		LOGGER.info("User successfully loaded. User details: " + user);
		return user;
	}

	@Override
	public void update(User obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
		LOGGER.info("User successfully updated. User details: " + obj);
	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.load(User.class, new Integer(id));

		if (user != null) {
			session.delete(user);
		}
		LOGGER.info("user successfully removed. user details: " + user);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public User findByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		try{
			Query<User> query = session.createQuery("from User as u where u.username = :name").setParameter("name", username);
			LOGGER.info("User successfully loaded. User details: " + query.getSingleResult());
			User user = query.getSingleResult();
			session.createNativeQuery("exec insertLogin @id = :id").setParameter("id", user.getId()).executeUpdate();
			return user;
		}catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		Session session = sessionFactory.getCurrentSession();
		List<User> userList = session.createQuery("from User").list();
		LOGGER.info("Genre list sucssesfully loaded.");

		return userList;
	}

}
