package music.dao;

import java.util.List;

import music.model.Genre;

public interface GenreDao extends CrudDao <Genre> {

	List<Genre> findAll();
	
	Genre getByName(String name);
}