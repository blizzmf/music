package music.service;

import java.time.format.DateTimeFormatter;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.GenreDao;
import music.model.Genre;

@Service
public class GenreServiceImpl implements GenreService {

	private GenreDao genreDao;

	public void setGenreDao(GenreDao genreDao) {
		this.genreDao = genreDao;
	}

	@Transactional
	public int addGenre(Genre genre) {
		//genre.setBirthday(formatter.parse(genre.getFormatDate(), LocalDate::from));
		this.genreDao.add(genre);
		
		return 0;
	}

	@Transactional
	public Genre getGenreById(int id) {
		return this.genreDao.getById(id);
	}

	@Transactional
	public void updateGenre(Genre genre) {
		this.genreDao.update(genre);
	}

	@Transactional
	public void removeGenre(int id) {
		this.genreDao.remove(id);
	}

	@Transactional
	public List<Genre> getAllGenre() {
		return this.genreDao.findAll();
	}

	@Transactional
	public Genre getByName(String name) {
		return this.genreDao.getByName(name);
	}
}
