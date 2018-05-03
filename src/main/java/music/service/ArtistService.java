package music.service;

import java.util.List;

import music.model.Artist;

public interface ArtistService {
	
	int addArtist(Artist artist);
	
	Artist getArtistById(int id);
	
	void updateArtist(Artist artist);
	
	void removeArtist(int id);
	
	List<Artist> getAllArtist();
	
	List<Artist> getByMusic(int id);
	
	List<Artist> getByName(String name);

}
