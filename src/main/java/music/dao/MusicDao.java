package music.dao;

import java.util.List;

import music.model.Music;

public interface MusicDao extends CrudDao <Music>{
	
	List<Music> findAll();
	
	List<Music> getByFormat(String name);
	
	List<Music> getByName(String name);
	
	List<Music> getByUser(int id);

	List<Music> getPopular();
}
