package music.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;



import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import music.model.Artist;

@Repository
public class ArtistDaoImpl implements ArtistDao {

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(ArtistDaoImpl.class);
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void add(Artist obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		//session.save(obj);
		LOGGER.info("Actor successfully saved. Actor details: " + obj);
	}

	public Artist getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Artist artist = (Artist) session.load(Artist.class, new Integer(id));
		LOGGER.info("Actor successfully loaded. Actor details: " + artist);

		return artist;
	}

	public void update(Artist obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
		obj.setBirthday(formatter.parse(obj.getFormatDate(), LocalDate::from));
		LOGGER.info("Actor successfully updated. Actor details: " + obj);
	}
	
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		Artist artist = (Artist) session.load(Artist.class, new Integer(id));

		if (artist != null) {
			session.delete(artist);
		}
		LOGGER.info("Actor successfully removed. Actor details: " + artist);
		
	}
	@SuppressWarnings("unchecked")
	public List<Artist> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Artist> artisList = session.createQuery("from Artist").list();
		LOGGER.info("Actor list sucssesfully loaded.");

		return artisList;
	}

	public List<Artist> getByMusic(int bid) {
		Session session = sessionFactory.getCurrentSession();
		return null;
	}

	public List<Artist> getBySurname(String name) {
		Session session = sessionFactory.getCurrentSession();
		List<Artist> art = session.createQuery("from Artist as a where a.surName =:name").setParameter("name", name).list();
		return art;
	}

	public List<Artist> getByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		List<Artist> art = session.createQuery("from Artist as a where a.name =:name").setParameter("name", name).list();
		return art;
	}


}
