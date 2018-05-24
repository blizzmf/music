package music.service;

import java.time.LocalDate;


import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.BandDao;
import music.dao.GenreDao;
import music.model.Band;

@Service
public class BandServiceImpl implements BandService{

	private BandDao bandDao;
	
	private GenreDao genreDao;
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	
	public void setBandDao(BandDao bandDao) {
		this.bandDao = bandDao;
	}
	
	@Override
	@Transactional
	public int addBand(Band band) {
		if(!band.getFormatDate().equals("")){
			band.setDateOfFoundation(formatter.parse(band.getFormatDate(), LocalDate::from));
		}else{
			band.setDateOfFoundation(null);
		}
		if(!band.getFormatDateClose().equals("")){
			band.setDateOfClose(formatter.parse(band.getFormatDateClose(), LocalDate::from));
		}else{
			band.setDateOfClose(null);
		}
		this.bandDao.add(band);
		return 0;
	}

	@Override
	@Transactional
	public Band getBandById(int id) {
		return this.bandDao.getById(id);
	}

	@Override
	@Transactional
	public void updateBand(Band band) {
		band.setDateOfFoundation(formatter.parse(band.getFormatDate(), LocalDate::from));
		System.out.println("data=" + band.getFormatDateClose()+ "]");
		if(!band.getFormatDateClose().equals("")){
			band.setDateOfClose(formatter.parse(band.getFormatDateClose(), LocalDate::from));
		}else{
			band.setDateOfClose(null);
		}
		this.bandDao.update(band);
	}

	@Override
	@Transactional
	public void removeBand(int id) {
		Band band = getBandById(id);
		band.getGenres().removeAll(band.getGenres());
		this.bandDao.remove(id);
	}

	@Override
	@Transactional
	public List<Band> getAllBand() {
		return this.bandDao.findAll();
	}

	@Override
	@Transactional
	public List<Band> getByArtist(String name) {
		return this.bandDao.getByArtist(name);
	}

	@Override
	@Transactional
	public Band getByName(String name) {
		return this.bandDao.getByName(name);
	}

	@Override
	@Transactional
	public List<Band> search(String find) {
		return this.bandDao.search(find);
	}

	@Override
	@Transactional
	public List<Band> getByGenre(int id) {
		return this.bandDao.getByGenre(id);
	}

	@Override
	@Transactional
	public List<Band> getRecommendatio(int userID) {
		return this.bandDao.getRecommendation(userID);
	}

	@Override
	@Transactional
	public Band getByAlbum(String name) {
		return this.bandDao.getByAlbum(name);
	}

	@Override
	public List<Band> getByUser(int id) {
		return this.bandDao.getByUser(id);
	}

}
