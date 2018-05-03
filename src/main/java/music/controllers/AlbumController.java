package music.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import music.model.Album;
import music.model.Artist;
import music.model.Band;
import music.service.AlbumService;
import music.service.ArtistService;
import music.service.BandService;
import music.service.MusicService;

@Controller
public class AlbumController {
	
	private static final String UPLOAD_ToProject = "D:\\old\\Tataryn\\Program\\workspace\\music\\src\\main\\webapp\\img\\album";  

	@Autowired
	private BandService bandService;

	@Autowired
	private ArtistService artistService;

	@Autowired
	private AlbumService albumService;

	@Autowired(required = true)
	@Qualifier(value = "albumService")
	public void setAlbumService(AlbumService albumService) {
		this.albumService = albumService;
	}

	@RequestMapping(value = "/addAlbum")
	public String addAlbum(Model model) {
		model.addAttribute("one", new Album());
		model.addAttribute("artists", artistService.getAllArtist());
		model.addAttribute("bands", bandService.getAllBand());
		return "addAlbum";
	}

	@RequestMapping(value = "/addAlbum/add", method = RequestMethod.POST)
	@Transactional
    public String addAlbumRedr(@ModelAttribute("one") Album album, @RequestParam("albumArtist") String art, @RequestParam("albumBand") String albBand,
    		@RequestParam CommonsMultipartFile file, HttpSession session){
    	//if(art != ""){
	 	List<Artist> a =  artistService.getByName(art);
	        for (Artist tmp : a) {
	        	album.setFk_artist(tmp.getId());
	        }
    	//}
	        byte[] bytes = file.getBytes();  
	        BufferedOutputStream stream;
			try {
				stream = new BufferedOutputStream(new FileOutputStream(  
				     new File(UPLOAD_ToProject + File.separator + album.getName()+".jpg")));
		        stream.write(bytes);  
		        stream.flush();  
		        stream.close();  
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
	    album.setBand(bandService.getByName(albBand));
        if(album.getId() == 0){
            this.albumService.addAlbum(album);
        }else {
            this.albumService.updateAlbum(album);
        }
		return "redirect:/band";
    }

	@RequestMapping("/album/remove/{id}")
	public String removeAlbum(@PathVariable("id") int id) {
		Album album = albumService.getAlbumById(id);
		Band band = bandService.getByAlbum(album.getName());
		this.albumService.removeAlbum(id);
		new File(UPLOAD_ToProject + File.separator + album.getName()+".jpg").delete();
		return "redirect:/bandInfo.html?id=" + band.getId();
	}

	@RequestMapping(value = "editAlbum")
	public String editAlbum(@RequestParam("id") int id, Model model) {
		model.addAttribute("one", this.albumService.getAlbumById(id));
		model.addAttribute("artists", artistService.getAllArtist());
		model.addAttribute("bands", bandService.getAllBand());
		return "addAlbum";
	}

	@RequestMapping(value = "albumInfo")
	@Transactional
	public String albumInfo(@RequestParam("id") int id, Model model) {
		Album album = this.albumService.getAlbumById(id);
		model.addAttribute("album", album);
		model.addAttribute("band", album.getBand());
		return "albumInfo";
	}
}
