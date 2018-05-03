package music.service;
/**
 * Service for Security.
 *
 * @author blz
 * @version 1.0
 */
public interface SecurityService {
	
	String findLoggedInUsername();

	void autoLogin(String username, String password);
}
