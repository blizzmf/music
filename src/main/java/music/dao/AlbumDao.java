package music.dao;

import music.model.Album;
import music.model.Artist;
import java.util.List;

public interface AlbumDao extends CrudDao<Album>{

	List<Album> findAll();
	
	List<Album> getByBand(int fkBand);
	
	List<Artist> getByArtist(int fkArtist);
	
	Album getByName(String name);
	
	List<Album> getByUser(int id);
	
}
