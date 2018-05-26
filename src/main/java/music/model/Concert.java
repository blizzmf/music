package music.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "Concert")
public class Concert {

    @Id
    @Column(name = "PK_Concert")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name="FK_Band", nullable=false)
    private Band band;

    @Column(name = "City")
    private String city;

    @Column(name = "Place")
    private String place;

    @Column(name = "ConcertDate")
    private LocalDate concertDate;

    @Column(name = "ConcertTime")
    private LocalTime concertTime;

    @Column(name = "Age")
    private int age;

    @Transient
    private String formatDate;

    @Transient
    private String formatTime;

    @Transient
    private int day;

    @Transient
    private String month;

    @Transient
    private String dayOfWeek;

    public String getDayOfWeek() {
        switch (concertDate.getDayOfWeek()){
            case MONDAY:
                dayOfWeek = "понедельник";
                break;
            case TUESDAY:
                dayOfWeek = "вторник";
                break;
            case WEDNESDAY:
                dayOfWeek = "среда";
                break;
            case THURSDAY:
                dayOfWeek = "четверг";
                break;
            case FRIDAY:
                dayOfWeek = "пятница";
                break;
            case SATURDAY:
                dayOfWeek = "суббота";
                break;
            case SUNDAY:
                dayOfWeek = "воскресенье";
                break;

        }
        return dayOfWeek;
    }

    public String getMonth() {
        switch (concertDate.getMonthValue()){
            case 1:
                month = "ЯНВ";
                break;
            case 2:
                month = "ФЕВ";
                break;
            case 3:
                month = "МАР";
                break;
            case 4:
                month = "АПР";
                break;
            case 5:
                month = "МАЙ";
                break;
            case 6:
                month = "ИЮН";
                break;
            case 7:
                month = "ИЮЛ";
                break;
            case 8:
                month = "АВГ";
                break;
            case 9:
                month = "СЕН";
                break;
            case 10:
                month = "ОКТ";
                break;
            case 11:
                month = "НОЯ";
                break;
            case 12:
                month = "ДЕК";
                break;
        }
        return month;
    }

    public int getDay() {
        return concertDate.getDayOfMonth();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Band getBand() {
        return band;
    }

    public void setBand(Band band) {
        this.band = band;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public LocalDate getConcertDate() {
        return concertDate;
    }

    public void setConcertDate(LocalDate concertDate) {
        this.concertDate = concertDate;
    }

    public LocalTime getConcertTime() {
        return concertTime;
    }

    public void setConcertTime(LocalTime concertTime) {
        this.concertTime = concertTime;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getFormatDate() {
        return formatDate;
    }

    public void setFormatDate(String formatDate) {
        this.formatDate = formatDate;
    }

    public String getFormatTime() {
        return formatTime;
    }

    public void setFormatTime(String formatTime) {
        this.formatTime = formatTime;
    }

    @Override
    public String toString() {
        return "Concert{" +
                "id=" + id +
                ", band=" + band +
                ", city='" + city + '\'' +
                ", place='" + place + '\'' +
                ", concertDate=" + concertDate +
                ", concertTime=" + concertTime +
                ", age=" + age +
                ", formatDate='" + formatDate + '\'' +
                ", formatTime='" + formatTime + '\'' +
                '}';
    }
}
