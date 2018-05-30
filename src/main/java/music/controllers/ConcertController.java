package music.controllers;

import music.model.Concert;
import music.service.BandService;
import music.service.ConcertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
public class ConcertController {

    private static final String UPLOAD_ToProject = "D:\\old\\Projekts\\music\\src\\main\\webapp\\img\\concert";

    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

    @Autowired
    ConcertService concertService;

    @Autowired
    BandService bandService;

    @RequestMapping(value = "/concertInfo")
    public String concertInfo(Model model, @RequestParam("id") int id) {
        model.addAttribute("concert", concertService.getConcertById(id));
        return "concertInfo";
    }

    @RequestMapping(value = "/addConcert")
    public String addConcert(Model model) {
        model.addAttribute("one", new Concert());
        model.addAttribute("bands", bandService.getAllBand());
        return "addConcert";
    }

    @RequestMapping(value = "/addConcert/add", method = RequestMethod.POST)
    //@Transactional
    public String addConcert(@ModelAttribute("one") Concert concert, @RequestParam("concertBand") String band,
                               @RequestParam CommonsMultipartFile file){
        byte[] bytes = file.getBytes();
        BufferedOutputStream stream;
        concert.setBand(bandService.getByName(band));
        try {
            stream = new BufferedOutputStream(new FileOutputStream(
                    new File(UPLOAD_ToProject + File.separator + formatter.parse(concert.getFormatDate(), LocalDate::from) + concert.getBand().getName()+"Live.jpg")));
            stream.write(bytes);
            stream.flush();
            stream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(concert.getId() == 0){
            this.concertService.addConcert(concert);
        }else {
            this.concertService.updateConcert(concert);
        }
        return "redirect:/band";
    }
}
