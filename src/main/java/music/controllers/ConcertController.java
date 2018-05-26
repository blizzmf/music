package music.controllers;

import music.service.ConcertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConcertController {

    @Autowired
    ConcertService concertService;

    @RequestMapping(value = "/concertInfo")
    public String bandInfo(Model model, @RequestParam("id") int id) {
        model.addAttribute("concert", concertService.getConcertById(id));
        return "concertInfo";
    }
}
