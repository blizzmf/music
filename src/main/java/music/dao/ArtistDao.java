package music.dao;

import java.util.List;



import music.model.Artist;

public interface ArtistDao extends CrudDao <Artist> {

	List<Artist> findAll();
	
	List<Artist> getByMusic(int bid);
	
	List<Artist> getBySurname(String name);
	
	List<Artist> getByName(String name);
}