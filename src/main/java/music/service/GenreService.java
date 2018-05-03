package music.service;

import java.util.List;

import music.model.Genre;

public interface GenreService {
	
	int addGenre(Genre genre);
	
	Genre getGenreById(int id);
	
	void updateGenre(Genre genre);
	
	void removeGenre(int id);
	
	List<Genre> getAllGenre();
	
	Genre getByName(String name);

}
