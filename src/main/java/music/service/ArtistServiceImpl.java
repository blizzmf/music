package music.service;

import java.time.LocalDate;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.ArtistDao;
import music.model.Artist;

@Service
public class ArtistServiceImpl implements ArtistService {

	private ArtistDao artistDao;
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

	public void setArtistDao(ArtistDao artistDao) {
		this.artistDao = artistDao;
	}

	@Transactional
	public int addArtist(Artist artist) {
//		int check = 0;
//		List<Artist> artists = artistDao.findAll();
//		for (Artist i : artists) {
//			if (i.getName().equals(artist.getName())) {
//				check = 1;
//				return 0;
//			}
//		}
//		if (check == 0) {
//			artistDao.add(artist);
//			return 1;
//		} else {
//			artistDao.update(artist);
//			return 1;
//		}
		artist.setBirthday(formatter.parse(artist.getFormatDate(), LocalDate::from));
		this.artistDao.add(artist);
		
		return 0;
	}

	@Transactional
	public Artist getArtistById(int id) {
		return this.artistDao.getById(id);
	}

	@Transactional
	public void updateArtist(Artist artist) {
		this.artistDao.update(artist);
	}

	@Transactional
	public void removeArtist(int id) {
		this.artistDao.remove(id);
	}

	@Transactional
	public List<Artist> getAllArtist() {
		return this.artistDao.findAll();
	}

	@Transactional
	public List<Artist> getByMusic(int id) {
		return this.artistDao.getByMusic(id);
	}

	@Transactional
	public List<Artist> getByName(String name) {
		return this.artistDao.getBySurname(name);
	}
}
