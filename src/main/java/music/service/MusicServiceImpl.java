package music.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import music.dao.MusicDao;
import music.model.Album;
import music.model.Music;

@Service
public class MusicServiceImpl implements MusicService{

	private MusicDao musicDao;
	
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
