package music.controllers;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.model.Album;
import music.model.Music;
import music.model.User;
import music.service.AlbumService;
import music.service.MusicService;
import music.service.UserService;

@Controller
public class CartController {

	private static final String UPLOAD_ToProject = "D:\\old\\Tataryn\\Program\\workspace\\";  
	
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private MusicService musicService;
	
	@Autowired
	private UserService userService;
	
	 @RequestMapping("/cart")
		public String getCart(Model model, @RequestParam("username") String name) {
		 	User user = userService.findByUsername(name);
			model.addAttribute("albums", albumService.getByUser(user.getId()));
			model.addAttribute("musics", musicService.getByUser(user.getId()));
			return "cart";
		}
	 
	 	@RequestMapping(value = "/AlbumToCart")
	    @Transactional
	    public String addAlbum(Model model, @RequestParam("id") int idAlbum, @RequestParam("username") String username) {
	 		User user = userService.findByUsername(username);
	 		Set<Album> albums = user.getCart().getAlbumsCart();
	 		if(albums == null) albums = new HashSet<>();
	 		albums.add(albumService.getAlbumById(idAlbum));
	 		user.getCart().setAlbumsCart(albums);
	 		
	 		model.addAttribute("albums", albumService.getByUser(user.getId()));
	 		model.addAttribute("musics", musicService.getByUser(user.getId()));
	 		
	        return "redirect:/albumInfo?username=" + username;
	    }
	 	
	 	@RequestMapping("removeAlbumFromCart")
	 	@Transactional
	 	public String removeAlbumCart(Model model, @RequestParam("id") int idAlbum, @RequestParam("username") String username) {
	 		User user = userService.findByUsername(username);
	 		Set<Album> albums = user.getCart().getAlbumsCart();
	 		albums.remove(albumService.getAlbumById(idAlbum));
	 		user.getCart().setAlbumsCart(albums);
	 		
	 		model.addAttribute("albums", albumService.getByUser(user.getId()));
	 		model.addAttribute("musics", musicService.getByUser(user.getId()));
	 		
	 		return "redirect:/cart?username=" + username;
	 	}
	 	
	 	@RequestMapping(value = "/MusicToCart")
	    @Transactional
	    public String addMusic(Model model, @RequestParam("id") int idMusic, @RequestParam("username") String username) {
	 		User user = userService.findByUsername(username);
	 		Set<Music> musics = user.getCart().getMusicsCart();
	 		if(musics == null) musics = new HashSet<>();
	 		musics.add(musicService.getMusicById(idMusic));
	 		user.getCart().setMusicsCart(musics);
	 		
	 		model.addAttribute("albums", albumService.getByUser(user.getId()));
	 		model.addAttribute("musics", musicService.getByUser(user.getId()));
	 		
	        return "redirect:/music?username=" + username;
	    }
	 	
	 	@RequestMapping("removeMusicFromCart")
	 	@Transactional
	 	public String removeMusicCart(Model model, @RequestParam("id") int idMusic, @RequestParam("username") String username) {
	 		User user = userService.findByUsername(username);
	 		Set<Music> musics = user.getCart().getMusicsCart();
	 		musics.remove(musicService.getMusicById(idMusic));
	 		user.getCart().setMusicsCart(musics);


	 		model.addAttribute("albums", albumService.getByUser(user.getId()));
	 		model.addAttribute("musics", musicService.getByUser(user.getId()));
	 		
	 		return "redirect:/cart?username=" + username;
	 	}
	 	@RequestMapping("doc/{name}")
	 	public String createDoc(@PathVariable("name") String username) {
	 		User user = userService.findByUsername(username);
	 		String listString = "������� " + username + "\n";

	 		for (Album a : albumService.getByUser(user.getId()))
	 		{
	 		    listString += a.toString() + "\n";
	 		}
	 		listString += "������ " + username+ "\n";
	 		for (Music mus :  musicService.getByUser(user.getId()))
	 		{
				listString += mus.toString() + "\n";
	 		}
	 		Date date = new Date();
	 		userService.getDoc(listString, UPLOAD_ToProject + username+" " +date.getDate()+"."+ date.getMonth()+".doc");
	 		return "redirect:/cart?username=" + username;
	 	}
}
