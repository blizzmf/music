package music.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.AlbumDao;
import music.dao.BandDao;
import music.model.Album;
import music.model.Artist;
import music.model.Band;

@Service
public class AlbumServiceImpl implements AlbumService{

	@Autowired
	private AlbumDao albumDao;
	@Autowired
	private BandDao bandDao;
	
	public void setAlbumDao(AlbumDao albumDao) {
		this.albumDao = albumDao;
	}
	
	@Override
	@Transactional
	public int addAlbum(Album album) {
		this.albumDao.add(album);
		return 0;
	}

	@Override
	@Transactional
	public Album getAlbumById(int id) {
		return this.albumDao.getById(id);
	}

	@Override
	@Transactional
	public void updateAlbum(Album album) {
		this.albumDao.update(album);
	}

	@Override
	@Transactional
	public void removeAlbum(int id) {
		Album album = this.albumDao.getById(id);
		Band band = bandDao.getByAlbum(album.getName());
		band.getAlbums().remove(album);
		this.albumDao.remove(id);
	}

	@Override
	@Transactional
	public List<Album> getAllAlbum() {
		return this.albumDao.findAll();
	}

	@Override
	public List<Album> getByGenry(int id) {
		return this.albumDao.getByGenre(id);
	}

	@Override
	@Transactional
	public List<Artist> getByArtist(int fkArtist) {
		return this.albumDao.getByArtist(fkArtist);
	}
	
	@Override
	@Transactional
	public List<Album> getByBand(int fkBand) {
		return this.albumDao.getByBand(fkBand);
	}

	@Override
	@Transactional
	public Album getByName(String name) {
		return this.albumDao.getByName(name);
	}

	@Override
	@Transactional
	public List<Album> getByUser(int id) {
		return this.albumDao.getByUser(id);
	}

}
