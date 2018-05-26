package music.service;

import music.dao.ConcertDao;
import music.model.Concert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class ConcertServiceImpl implements ConcertService {

    @Autowired
    ConcertDao concertDao;

    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

    private DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("HH:mm");

    public void setConcertDao(ConcertDao concertDao) {
        this.concertDao = concertDao;
    }

    @Override
    @Transactional
    public int addConcert(Concert concert) {
        if(!concert.getFormatDate().equals("")){
            concert.setConcertDate(formatter.parse(concert.getFormatDate(), LocalDate::from));
        }else{
            concert.setConcertDate(null);
        }
        if(!concert.getFormatTime().equals("")){
            concert.setConcertTime(formatterTime.parse(concert.getFormatTime(), LocalTime::from));
        }else{
            concert.setConcertTime(null);
        }
        this.concertDao.add(concert);
        return 0;
    }

    @Override
    @Transactional
    public Concert getConcertById(int id) {
        return this.concertDao.getById(id);
    }

    @Override
    @Transactional
    public void updateConcert(Concert concert) {
        concert.setConcertDate(formatter.parse(concert.getFormatDate(), LocalDate::from));
        concert.setConcertTime(formatterTime.parse(concert.getFormatTime(), LocalTime::from));

        this.concertDao.update(concert);
    }

    @Override
    @Transactional
    public void removeConcert(int id) {
        this.concertDao.remove(id);
    }

    @Override
    @Transactional
    public List<Concert> getAllConcert() {
        return this.concertDao.findAll();
    }

    @Override
    @Transactional
    public Concert getByName(String name) {
        return this.concertDao.getByName(name);
    }
}
