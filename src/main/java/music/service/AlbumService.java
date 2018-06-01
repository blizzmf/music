package music.service;

import java.util.List;

import music.model.Album;
import music.model.Artist;
import music.model.Band;

public interface AlbumService {
	
	int addAlbum(Album album);

	Album getAlbumById(int id);

	void updateAlbum(Album album);

	void removeAlbum(int id);

	List<Album> getAllAlbum();

	List<Album> getByGenry(int id);

	List<Artist> getByArtist(int fkArtist);
	
	List<Album> getByBand(int fkBand);

	Album getByName(String name);
	
	List<Album> getByUser(int id);
}
