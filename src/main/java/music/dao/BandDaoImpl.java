package music.dao;

import java.sql.ResultSet;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.model.Band;
import music.model.Genre;
import music.model.User;
import music.service.GenreService;

@Repository
public class BandDaoImpl implements BandDao {
	
	@Autowired
	private GenreService genreService;
	
	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(BandDaoImpl.class);

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Band obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		/*String sql = String.format("INSERT INTO GenreGr (FK_Band,FK_Genre) VALUES(%d,%d);", obj.getId(),
				obj.getGenreID());
		session.createNativeQuery(sql).executeUpdate();*/
		// session.getTransaction().commit();
		/*
		 * Query query =
		 * session.createQuery("insert into GenreGr(fkBand, fkGenre)" +
		 * " select  id from Band as b where b.id = :bandId" +
		 * ", select  id from Genre as g where g.id = :genreId");
		 * query.setParameter("bandId", obj.getId());
		 * query.setParameter("genreId", obj.getGenreID()); int result =
		 * query.executeUpdate();
		 */
		// session.save(obj);
		LOGGER.info("Actor successfully saved. Band details: " + obj);
	}

	@Override
	public Band getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Band band = (Band) session.load(Band.class, new Integer(id));

		LOGGER.info("Actor successfully loaded. Band details: " + band);
		return band;
	}

	@Override
	public void update(Band obj) {
		Session session = sessionFactory.getCurrentSession();
		session.update(obj);
		//session.flush();
		//String sql = String.format("INSERT INTO GenreGr (FK_Band,FK_Genre) VALUES(%d,%d);", obj.getId(),
		//		obj.getGenreID());
		//session.createNativeQuery(sql).executeUpdate();

	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		Band band = (Band) session.load(Band.class, new Integer(id));

		if (band != null) {
			session.delete(band);
		}
		LOGGER.info("Actor successfully removed. Band details: " + band);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Band> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Band> bandList = session.createQuery("from Band").list();
		LOGGER.info("Band list sucssesfully loaded.");

		return bandList;
	}

	@Override
	public List<Band> getByGenre(int id) {
		Session session = sessionFactory.getCurrentSession();
		List<Band> bands = new ArrayList<Band>();// = session.createQuery("select Search("+find+")").list();
		
		Query query = session.createSQLQuery(
				"exec Similar @find = :find")
				.addEntity(Band.class)
				.setParameter("find", id);

			List result = query.list();
			for(int i=0; i<result.size(); i++){
				Band stock = (Band)result.get(i);
				bands.add(stock);
				LOGGER.info("band successfully loaded. Genre search: " + stock);
			}
		return bands;
	}

	@Override
	public List<Band> getByArtist(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Band getByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		try{
			Query<Band> query = session.createQuery("from Band as b where b.name = :name").setParameter("name", name);
			LOGGER.info("User successfully loaded. User details: " + query.getSingleResult());
			Band band = query.getSingleResult();
			return band;
		}catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Band> search(String find) {
		Session session = sessionFactory.getCurrentSession();
		List<Band> bands = new ArrayList<Band>();// = session.createQuery("select Search("+find+")").list();
		
		Query query = session.createSQLQuery(
				"exec Search @find = :find")
				.addEntity(Band.class)
				.setParameter("find", find);

			List result = query.list();
			for(int i=0; i<result.size(); i++){
				Band stock = (Band)result.get(i);
				bands.add(stock);
				LOGGER.info("band successfully loaded. band search: " + stock);
			}
		return bands;
	}

	@SuppressWarnings("deprecation")
	@Override
	public List<Band> getRecommendation(int userID) {
		Session session = sessionFactory.getCurrentSession();
		 Object[] obj = (Object[]) session.createSQLQuery(
				"exec recomend @find = :find")
				.setParameter("find", userID).addScalar("PK_count", StandardBasicTypes.INTEGER).addScalar("Name", StandardBasicTypes.STRING).getSingleResult();
         LOGGER.info("recomend successfully loaded. result: id="+obj[0] + "name="+obj[1]);
         Genre genre = genreService.getByName(obj[1].toString());
         LOGGER.info("genre successfully loaded. genre:" + genre);
         return this.getByGenre(genre.getId());
		
	}

	@Override
	public Band getByAlbum(String name) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("nameBand="+name);
		Object[] obj = (Object[]) session.createSQLQuery(
				"exec albumBand @find = :find")
				.setParameter("find", name).addScalar("PK_Band", StandardBasicTypes.INTEGER).addScalar("Name", StandardBasicTypes.STRING).getSingleResult();
		LOGGER.info("recomend successfully loaded. result:name="+obj[1]);
        return this.getByName(obj[1].toString());
	}

}
