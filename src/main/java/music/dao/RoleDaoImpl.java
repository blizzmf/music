package music.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import music.model.Role;

@Repository
public class RoleDaoImpl implements RoleDao{

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(RoleDaoImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void add(Role obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		
	}

	@Override
	public Role getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Role role = (Role) session.load(Role.class, new Integer(id));
		LOGGER.info("Role successfully loaded. Role details: " + role);
		return role;
	}

	@Override
	public void update(Role obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		Role role = (Role) session.load(Role.class, new Integer(id));

		if (role != null) {
			session.delete(role);
		}
		LOGGER.info("role successfully removed. role details: " + role);
		
	}

}
