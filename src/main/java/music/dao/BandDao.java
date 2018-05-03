package music.dao;

import java.util.List;

import music.model.Band;

public interface BandDao extends CrudDao<Band>{
	
	List<Band> findAll();
	
	List<Band> getByGenre(int id);
	
	List<Band> getByArtist(String name);
	
	Band getByName(String name);
	
	List<Band> search(String find);
	
	List<Band> getRecommendation(int userID);
	
	Band getByAlbum(String name);
}
