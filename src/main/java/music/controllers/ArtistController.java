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

import music.model.Artist;
import music.service.ArtistService;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;

	@Autowired(required = true)
	@Qualifier(value = "artistService")
	public void setArtistService(ArtistService artistService) {
		this.artistService = artistService;
	}

	@RequestMapping(value = "/artist", method = RequestMethod.GET)
	public String getAllActors(Model model) {
		// model.addAttribute("one", new Artist());
		model.addAttribute("artistList", artistService.getAllArtist());
		return "artist";
	}

	@RequestMapping(value = "/addArtist")
	public String addArtist(Model model) {
		model.addAttribute("one", new Artist());
		return "addArtist";
	}

	@RequestMapping(value = "/addArtist/add", method = RequestMethod.POST)
	public String addRedirArtist(@ModelAttribute("one") Artist art) {
		if (art.getId() == 0) {
			this.artistService.addArtist(art);
		} else {
			this.artistService.updateArtist(art);
		}

		return "redirect:/artist";
	}

	@RequestMapping("/remove/{id}")
	public String removeArtist(@PathVariable("id") int id) {
		this.artistService.removeArtist(id);

		return "redirect:/artist";
	}

	@RequestMapping(value = "/editArtist")
	public String editArtist(@RequestParam("id") int id, Model model) {
		model.addAttribute("one", this.artistService.getArtistById(id));
		// model.addAttribute("artistList", this.artistService.getAllArtist());

		return "addArtist";
	}
}
