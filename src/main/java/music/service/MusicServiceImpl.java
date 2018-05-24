package music.service;

import java.sql.Date;
import java.util.List;

import music.dao.AlbumDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.MusicDao;
import music.model.Album;
import music.model.Music;

@Service
public class MusicServiceImpl implements MusicService{

	@Autowired
	private MusicDao musicDao;

	@Autowired
	private AlbumDao albumDao;
	
	public void setMusicDao(MusicDao musicDao) {
		this.musicDao = musicDao;
	}

	@Override
	@Transactional
	public int addMusic(Music music) {
		this.musicDao.add(music);
		
		return 0;
	}

	@Override
	@Transactional
	public Music getMusicById(int id) {
		return this.musicDao.getById(id);
	}

	@Override
	@Transactional
	public void updateMusic(Music music) {
		this.musicDao.update(music);
		
	}

	@Override
	@Transactional
	public void removeMusic(int id) {
		Music music = this.musicDao.getById(id);
		Album album = music.getAlbums().iterator().next();
		System.out.println(album);
		album.getMusics().remove(music);
		music.getAlbums().remove(album);
		albumDao.update(album);
		this.musicDao.remove(id);
		
	}

	@Override
	@Transactional
	public List<Music> getAllMusic() {
		return this.musicDao.findAll();
	}

	@Override
	@Transactional
	public List<Music> getByFormat(String form) {
		return this.musicDao.getByFormat(form);
	}

	@Override
	@Transactional
	public List<Music> getByName(String name) {
		return this.musicDao.getByName(name);
	}
	
	@Override
	@Transactional
	public List<Music> getByUser(int id) {
		return this.musicDao.getByUser(id);
	}

	@Override
	@Transactional
	public List<Music> getPopular() {
		return this.musicDao.getPopular();
	}

}
