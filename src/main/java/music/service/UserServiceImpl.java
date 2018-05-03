package music.service;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import org.springframework.security.crypto.bcrypt.;
import music.dao.RoleDao;
import music.dao.UserDao;
import music.model.Role;
import music.model.User;

/**
 * Implementation of {@link UserService} interface.
 * @author blizz
 * @version 1.0
 */

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	
	@Override
	@Transactional
	public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getById(2));
        user.setRoles(roles);
        userDao.add(user);
		
	}

	@Override
	@Transactional
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	@Transactional
	public User getUserById(int id) {
		return this.userDao.getById(id);
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		this.userDao.update(user);
		
	}

	@Override
	@Transactional
	public void removeUser(int id) {
		this.userDao.remove(id);
		
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		return this.userDao.getAllUsers();
	}

	@Override
	public void getDoc(String content, String path) {
		try {
			POIFSFileSystem fs = new POIFSFileSystem();
			DirectoryEntry directory = fs.getRoot();
			directory.createDocument("WordDocument", new ByteArrayInputStream(content.getBytes()));
			FileOutputStream out = new FileOutputStream(path);
			fs.writeFilesystem(out);
			out.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

}
