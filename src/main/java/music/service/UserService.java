package music.service;

import java.util.List;

import music.model.User;

public interface UserService {
    void save(User user);
    
    User getUserById(int id);
	
	void updateUser(User user);
	
	void removeUser(int id);
	
	List<User> getAllUsers();
    
	void getDoc(String content, String path);
	
    User findByUsername(String username);
}
