package music.dao;

import java.util.List;

import music.model.User;

public interface UserDao extends CrudDao<User>{
	List<User> getAllUsers();
	User findByUsername(String username);
}