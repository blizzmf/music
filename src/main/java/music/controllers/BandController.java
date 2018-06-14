package music.controllers;


import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import music.model.Band;
import music.model.Genre;
import music.model.Role;
import music.service.AlbumService;
import music.service.BandService;
import music.service.GenreService;

@Controller
public class BandController {

    private static final String UPLOAD_DIRECTORY = File.separator + "img";
    private static final String UPLOAD_ToProject = "D:\\old\\Projekts\\music\\src\\main\\webapp\\img";

    @Autowired
    private BandService bandService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private GenreService genreService;

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setBandService(BandService bandService) {
        this.bandService = bandService;
    }

    @RequestMapping(value = {"/", "/band"}, method = RequestMethod.GET)
    public String getAllBands(Model model) {
        model.addAttribute("bands", bandService.getAllBand());
        return "band";
    }

    @RequestMapping(value = "/addBand")
    public String addBand(Model model) {
        model.addAttribute("one", new Band());
        model.addAttribute("genres", genreService.getAllGenre());
        return "addBand";
    }

    @RequestMapping(value = "/bandInfo")
    @Transactional
    public String bandInfo(Model model, @RequestParam("id") int id) {
        Band band = bandService.getBandById(id);
        Hibernate.initialize(band.getConcerts());

        Iterator<Genre> iter = band.getGenres().iterator();
        model.addAttribute("band", band);
        model.addAttribute("albums", band.getAlbums());
        model.addAttribute("similar", bandService.getByGenre(iter.next().getId()));
        return "bandInfo";
    }

    @RequestMapping(value = "/addBand/add", method = RequestMethod.POST)
    @Transactional
    public String addBand(@ModelAttribute("one") Band band, @RequestParam("genreBand") String genre, @RequestParam CommonsMultipartFile file,
                          HttpSession session) {
        Set<Genre> genres = new HashSet<>();
        genres.add(genreService.getByName(genre));
        band.setGenres(genres);
    /*	List<Genre> gr = genreService.getByName(genre);
        for (Genre g : gr) {
        	band.setGenreID(g.getId());
        }*/
        ServletContext context = session.getServletContext();
        String realPathtoUploads = context.getRealPath(UPLOAD_DIRECTORY);
        if (!new File(realPathtoUploads).exists()) {
            new File(realPathtoUploads).mkdir();
        }
        byte[] bytes = file.getBytes();
        BufferedOutputStream stream;
        try {
            stream = new BufferedOutputStream(new FileOutputStream(
                    new File(UPLOAD_ToProject + File.separator + band.getName() + ".jpg")));
            stream.write(bytes);
            stream.flush();
            stream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (band.getId() == 0) {
            this.bandService.addBand(band);
        } else {
            this.bandService.updateBand(band);
        }

        return "redirect:/band";
    }

    @RequestMapping("/band/remove/{id}")
    public String removeBand(@PathVariable("id") int id) {
        Band band = this.bandService.getBandById(id);
        this.bandService.removeBand(id);
        new File(UPLOAD_ToProject + File.separator + band.getName() + ".jpg").delete();
        return "redirect:/band";
    }

    @RequestMapping(value = "/editBand")
    public String editArtist(@RequestParam("id") int id, Model model) {
        model.addAttribute("one", this.bandService.getBandById(id));
        model.addAttribute("genres", genreService.getAllGenre());

        return "addBand";
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search(Model model, @RequestParam("search") String search) {
        if (search.equals("")) {
            model.addAttribute("bands", bandService.getAllBand());
        } else {
            model.addAttribute("bands", bandService.search("%" + search + "%"));
        }
        return "band";

    }

    @RequestMapping(value = "/genreInfo")
    public String genres(Model model, @RequestParam("id") int id) {
        Genre genre = genreService.getGenreById(id);
        model.addAttribute("bands", bandService.getByGenre(genre.getId()));
        return "band";
    }
}	
