package music.service;

import music.model.Concert;

import java.util.List;

public interface ConcertService {
    int addConcert(Concert concert);

    Concert getConcertById(int id);

    void updateConcert(Concert concert);

    void removeConcert(int id);

    List<Concert> getAllConcert();

    Concert getByName(String name);
}
