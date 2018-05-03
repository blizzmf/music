package music.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import music.model.Album;
import music.model.Artist;
import music.model.Band;

@Repository
public class AlbumDaoImpl implements AlbumDao{

	
	private SessionFactory sessionFactory;

	
	private static final Logger LOGGER = Logger.getLogger(AlbumDaoImpl.class);
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void add(Album obj) {
		Session session = sessionFactory.getCurrentSession();
		obj.setReleaseDate(formatter.parse(obj.getFormatDate(), LocalDate::from));
		session.persist(obj);
		LOGGER.info("AlbumDaoImpl successfully saved. AlbumDaoImpl details: " + obj);
	}

	@Override
	public Album getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Album album = (Album) session.load(Album.class, new Integer(id));
		LOGGER.info("Album successfully loaded. Album details: " + album);

		return album;
	}

	@Override
	public void update(Album obj) {
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		obj.setReleaseDate(formatter.parse(obj.getFormatDate(), LocalDate::from));
		session.update(obj);
		LOGGER.info("Album successfully updated. Album details: " + obj);
	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		Album album = (Album) session.load(Album.class, new Integer(id));

		if (album != null) {
			session.delete(album);
		}
		LOGGER.info("Album successfully removed. Album details: " + album);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Album> albumList = session.createQuery("from Album").list();
		LOGGER.info("Album list sucssesfully loaded.");

		return albumList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Album> getByBand(int fkBand) {
		Session session = sessionFactory.getCurrentSession();
		List<Album> albumList = session.createQuery("from Album as a where a.fk_band = :fkBand").setParameter("fkBand", fkBand).list();
		LOGGER.info("Album list sucssesfully loaded.");

		return albumList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Artist> getByArtist(int fkArtist) {
		Session session = sessionFactory.getCurrentSession();
		List<Artist> artistList = session.createQuery("select a.* from Artist as a where a.id=:fkArtist").setParameter("fkArtist", fkArtist).list();
		LOGGER.info("Album list sucssesfully loaded.");

		return artistList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Album getByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		try{
			Query<Album> query = session.createQuery("from Album as a where a.name = :name").setParameter("name", name);
			LOGGER.info("Album successfully loaded. User details: " + query.getSingleResult());
			Album album = query.getSingleResult();
			return album;
		}catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	public List<Album> getByUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("exec CartAlbum @id = :id").setParameter("id", id).addEntity(Album.class);
		
		List<Album> albums = new ArrayList<Album>();
		List result = query.list();
		for(int i=0; i<result.size(); i++){
			Album album = (Album)result.get(i);
			albums.add(album);
			LOGGER.info("Album successfully loaded. Album cart: " + album);
		}
		return albums;
	}

}
