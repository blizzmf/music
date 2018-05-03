package music.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import music.model.Band;
import music.model.Genre;
import music.model.User;

@Repository
public class GenreDaoImpl implements GenreDao {

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(GenreDaoImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public void add(Genre obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		LOGGER.info("Actor successfully saved. Genre details: " + obj);
		
	}

	@Override
	public Genre getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Genre genre = (Genre) session.load(Genre.class, new Integer(id));
		
		LOGGER.info("Actor successfully loaded. Band details: " +  genre);
		return genre;
	}

	@Override
	public void update(Genre obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
		
	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		Genre genre = (Genre) session.load(Genre.class, new Integer(id));

		if (genre != null) {
			session.delete(genre);
		}
		LOGGER.info("Actor successfully removed. Band details: " + genre);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Genre> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Genre> genreList = session.createQuery("from Genre").list();
		LOGGER.info("Genre list sucssesfully loaded.");

		return genreList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Genre getByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		try{
		Query<Genre> query = session.createQuery("from Genre as g where g.name =:name").setParameter("name", name);
		return query.getSingleResult();
		}catch (NoResultException e) {
			return null;
		}
	}

}
