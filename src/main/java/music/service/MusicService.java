package music.service;

import java.util.List;

import music.model.Music;

public interface MusicService {

	int addMusic(Music music);
	
	Music getMusicById(int id);
	
	void updateMusic(Music music);
	
	void removeMusic(int id);
	
	List<Music> getAllMusic();
	
	List<Music> getByFormat(String form);
	
	List<Music> getByName(String name);
	
	List<Music> getByUser(int id);
	
	List<Music> getPopular();
}
