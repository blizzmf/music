package music.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;

import music.model.Album;
import music.model.Genre;
import music.model.Music;
@Repository
public class MusicDaoImpl implements MusicDao {

	private SessionFactory sessionFactory;

	private static final Logger LOGGER = Logger.getLogger(MusicDaoImpl.class);

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void add(Music obj) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(obj);
		LOGGER.info("Artist id " + obj.getArtistID() + "Album ID = " +obj.getAlbumID() );
		if(obj.getArtistID() != 0){
			String sql = String.format("INSERT INTO SongArtist (FK_Artist, FK_Music, WhoIs) VALUES(%d,%d,?);", obj.getArtistID(), obj.getId());
			session.createNativeQuery(sql).setParameter(1, "Author").executeUpdate();
		}
		if(obj.getAlbumID() != 0){
			String sql = String.format("INSERT INTO MusicInAlbum (FK_Music, FK_Album) VALUES(%d,%d);", obj.getId(), obj.getAlbumID());
			session.createNativeQuery(sql).executeUpdate();
		}
		LOGGER.info("Music successfully saved. Music details: " + obj);
	}

	@Override
	public Music getById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Music music = (Music) session.load(Music.class, new Integer(id));
		LOGGER.info("Music successfully loaded. Music details: " + music);

		return music;
	}

	@Override
	public void update(Music obj) {
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.update(obj);
		if(obj.getArtistID() != 0){
			String sql = String.format("UPDATE SongArtist SET FK_Artist = ?, FK_Music = ?, WhoIs = ? where FK_Artist = ?");
			session.createNativeQuery(sql).setParameter(1, obj.getArtistID()).setParameter(2, obj.getId())
			.setParameter(3, "Autor").setParameter(4, obj.getId()).executeUpdate();
		}
		if(obj.getAlbumID() != 0){
			String sql = String.format("UPDATE MusicInAlbum SET FK_Music = ?, FK_Album = ? where FK_Music = ?");
			session.createNativeQuery(sql).setParameter(1, obj.getId()).setParameter(2, obj.getAlbumID()).setParameter(3, obj.getId()).executeUpdate();
			//session.createNativeQuery(sql).setParameter(2, obj.getAlbumID());
			//session.createNativeQuery(sql).setParameter(3, obj.getId()).executeUpdate();
		}
		/*String sql = String.format("UPDATE Music SET PK_Music = ?, Name = ?, Duration = ?, MusFormat = ?, Cost = ? where PK_Music = ?");
		session.createNativeQuery(sql).setParameter(1, obj.getName()).
				setParameter(2, obj.getDuration()).setParameter(3,obj.getMusFormat()).
				setParameter(4, obj.getCost()).executeUpdate();*/
		LOGGER.info("Music successfully updated. Music details: " + obj);
		
	}

	@Override
	public void remove(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		Music music = (Music) session.load(Music.class, new Integer(id));
		//music.getAlbums().iterator().next().getMusics().remove(music);
		if (music != null) {
			session.delete(music);
		}
		LOGGER.info("music successfully removed. music details: " + music);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Music> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Music> musicList = session.createQuery("from Music order by id desc").list();
		LOGGER.info("musicList list sucssesfully loaded.");

		return musicList;
	}

	@Override
	public List<Music> getByFormat(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Music> getByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		List<Music> music = session.createQuery("from Music as m where m.name =:name").setParameter("name", name).list();
		return music;
	}

	@Override
	public List<Music> getByUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("exec CartMusic @id = :id").setParameter("id", id).addEntity(Music.class);
		
		List<Music> musics = new ArrayList<Music>();
		List result = query.list();
		for(int i=0; i<result.size(); i++){
			Music music = (Music)result.get(i);
			musics.add(music);
			LOGGER.info("Album successfully loaded. Album cart: " + music);
		}
		return musics;
	}

	@SuppressWarnings("deprecation")
	@Override
	public List<Music> getPopular() {
		Session session = sessionFactory.getCurrentSession();
		List list = session.createSQLQuery(
				"exec pop")
				 .addScalar("PK_count", StandardBasicTypes.INTEGER).addScalar("PK_Music", StandardBasicTypes.INTEGER).addScalar("Name", StandardBasicTypes.STRING).list();
		List<Music> musics = new ArrayList<Music>();
		for(Iterator iterator = list.iterator();iterator.hasNext();){  
			Object[] objects = (Object[]) iterator.next();
			musics.add(getById(Integer.valueOf(objects[1].toString())));
		}
        return musics;
	}

}
