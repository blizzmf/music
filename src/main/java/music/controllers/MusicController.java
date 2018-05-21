package music.controllers;

import java.io.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Transient;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import music.dao.AlbumDaoImpl;
import music.model.Album;
import music.model.Artist;
import music.model.Genre;
import music.model.Music;
import music.model.User;
import music.service.AlbumService;
import music.service.ArtistService;
import music.service.BandService;
import music.service.MusicService;
import music.service.UserService;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class MusicController {

	private static final String UPLOAD_ToProject = "D:\\old\\Projekts\\music\\src\\main\\webapp\\mus";

	@Autowired
	MusicService musicService;
	
	@Autowired
	ArtistService artistService;
	
	@Autowired
	AlbumService albumService;
	
	@Autowired
	BandService bandService;
	
	@Autowired
	UserService userService;

	private static final Logger LOGGER = Logger.getLogger(MusicController.class);
	
	private static String us;
	
	@Autowired(required = true)
    @Qualifier(value = "musicService")
    public void setMusicService(MusicService musicService) {
        this.musicService = musicService;
    }
	
	@RequestMapping(value = "/music", method = RequestMethod.GET)
	public String getAllMusic(Model model, @RequestParam("username") String name) {
		User user = userService.findByUsername(name);
		us = name;
		model.addAttribute("recomend", bandService.getRecommendatio(user.getId()));
		model.addAttribute("musics", musicService.getAllMusic());
		model.addAttribute("pop", musicService.getPopular());
		return "music";
	}
	
    @RequestMapping(value = "/addMusic")
    public String addMusic(Model model) {
    	model.addAttribute("one", new Music());
    	model.addAttribute("artists", artistService.getAllArtist());
    	model.addAttribute("albums", albumService.getAllAlbum());
        return "addMusic";
    }
    
    @RequestMapping(value = "/addMusic/add", method = RequestMethod.POST)
    @Transactional
    public String addMusicRedr(@ModelAttribute("one") Music music, @RequestParam("musicArtist") String art, 
    		@RequestParam("musicAlbum") String mAlmub, @RequestParam CommonsMultipartFile file, HttpSession session){
    	List<Artist> a =  artistService.getByName(art);
        for (Artist tmp : a) {
        	music.setArtistID(tmp.getId());
        }
        /*Set<Album> albums = new HashSet<>();
        albums.add(albumService.getByName(mAlmub));
        music.setAlbums(albums);*/
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream;
		try {
			stream = new BufferedOutputStream(new FileOutputStream(
					new File(UPLOAD_ToProject + File.separator + music.getName()+".mp3")));
			stream.write(bytes);
			stream.flush();
			stream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Album album = albumService.getByName(mAlmub);
        if(album != null)
        	music.setAlbumID(album.getId());
        if(music.getId() == 0){
            this.musicService.addMusic(music);
        }else {
            this.musicService.updateMusic(music);
        }
		return "redirect:/music?username=" + us;
    }
    
    @RequestMapping("deleteMusic")
	public String removeMusic(@RequestParam("id") int id, @RequestParam("username") String username) {
	    Music music = this.musicService.getMusicById(id);
		this.musicService.removeMusic(id);
        new File(UPLOAD_ToProject + File.separator + music.getName()+".mp3");
		return "redirect:/music?username=" + username;
	}

	@RequestMapping(value = "editMusic")
	public String editMusic(@RequestParam("id") int id, Model model) {
		model.addAttribute("one", this.musicService.getMusicById(id));
		model.addAttribute("artists", artistService.getAllArtist());
    	model.addAttribute("albums", albumService.getAllAlbum());

		return "addMusic";
	}
	
	@RequestMapping(value = "/welcome.html")
	public String welcomPage(Model model) {
		LOGGER.info("Hallo ");
		model.addAttribute("musics", this.musicService.getAllMusic());
		model.addAttribute("similar", bandService.getByGenre(9));
		LOGGER.info("WTF");
		return "welcome";
	}
}
