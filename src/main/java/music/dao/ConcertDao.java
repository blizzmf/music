package music.dao;

import music.model.Concert;

import java.util.List;

public interface ConcertDao extends CrudDao<Concert> {

    List<Concert> findAll();

    Concert getByName(String name);

}
