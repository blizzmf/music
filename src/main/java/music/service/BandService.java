package music.service;

import java.util.List;

import music.model.Band;

public interface BandService {

	int addBand(Band band);

	Band getBandById(int id);

	void updateBand(Band band);

	void removeBand(int id);

	List<Band> getAllBand();

	List<Band> getByArtist(String name);

	Band getByName(String name);
	
	List<Band> getByGenre(int id);

	List<Band> search(String find);
	
	List<Band> getRecommendatio(int userID);
	
	Band getByAlbum(String name);

	List<Band> getByUser(int id);
}
