package music.dao;

import music.model.Concert;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
public class ConcertDaoImpl implements ConcertDao {

    private SessionFactory sessionFactory;

    private static final Logger LOGGER = Logger.getLogger(BandDaoImpl.class);

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void add(Concert obj) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(obj);

        LOGGER.info("Concert successfully saved. Concert details: " + obj);
    }

    @Override
    public Concert getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Concert concert = (Concert) session.load(Concert.class, new Integer(id));

        LOGGER.info("Concert successfully loaded. Concert details: " + concert);
        return concert;
    }

    @Override
    public void update(Concert obj) {
        Session session = sessionFactory.getCurrentSession();
        session.update(obj);
    }

    @Override
    public void remove(int id) {
        Session session = sessionFactory.getCurrentSession();
        Concert concert  = (Concert) session.load(Concert.class, new Integer(id));

        if (concert != null) {
            session.delete(concert);
        }
        LOGGER.info("Concert successfully removed. Concert details: " + concert);
    }

    @Override
    public List<Concert> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Concert> concertList = session.createQuery("from Concert").list();
        LOGGER.info("Band list sucssesfully loaded.");

        return concertList;
    }

    @Override
    public Concert getByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        try{
            Query<Concert> query = session.createQuery("from Concert as b where b.name = :name").setParameter("name", name);
            LOGGER.info("User successfully loaded. User details: " + query.getSingleResult());
            Concert concert = query.getSingleResult();
            return concert;
        }catch (NoResultException e) {
            return null;
        }
    }
}
