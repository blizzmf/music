package music.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import music.model.Band;
import music.model.Genre;
import music.service.BandService;
import music.service.GenreService;

@Controller
public class GenreController {
	@Autowired
	private GenreService genreService;
	
	@Autowired(required = true)
    @Qualifier(value = "genreService")
    public void setGenreService(GenreService genreService) {
        this.genreService = genreService;
    }
	
	@RequestMapping(value = "/genre", method = RequestMethod.GET)
	public String getAllGenre(Model model) {
		model.addAttribute("genres", genreService.getAllGenre());
		return "genre";
	}
	
    @RequestMapping(value = "/addGenre")
    public String addGenre(Model model) {
    	model.addAttribute("one", new Genre());
        return "addGenre";
    }
    
    @RequestMapping(value = "/addGenre/add", method = RequestMethod.POST)
    public String addRedirGenre(@ModelAttribute("one") Genre genre){
        if(genre.getId() == 0){
            this.genreService.addGenre(genre);
        }else {
            this.genreService.updateGenre(genre);
        }

        return "redirect:/genre";
    }
    @RequestMapping("/genre/remove/{id}")
	public String removeGenre(@PathVariable("id") int id) {
		this.genreService.removeGenre(id);

		return "redirect:/genre";
	}

	@RequestMapping(value = "/editGenre")
	public String editGenre(@RequestParam("id") int id, Model model) {
		model.addAttribute("one", this.genreService.getGenreById(id));
		// model.addAttribute("artistList", this.artistService.getAllArtist());

		return "addGenre";
	}
}
