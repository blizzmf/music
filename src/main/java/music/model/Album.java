package music.model;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Album")
public class Album {

	@Id
	@Column(name = "PK_Album")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "ReleaseDate")
	private LocalDate releaseDate;

	@Column(name = "FK_Artist")
	private Integer fk_artist;
	
	@ManyToOne
    @JoinColumn(name="FK_Band", nullable=false)
	private Band band;
	
	@Transient
	private String formatDate;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "MusicInAlbum", joinColumns = {
			@JoinColumn(name = "FK_Album", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Music",
					nullable = false, updatable = false) })
	private Set<Music> musics; 
	
	@ManyToMany (mappedBy = "albumsCart")
	private Set<Cart> carts;
	
	public Set<Music> getMusics() {
		return musics;
	}

	public void setMusics(Set<Music> musics) {
		this.musics = musics;
	}

	public Album(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}

	public int getFk_artist() {
		return fk_artist;
	}

	public void setFk_artist(int fk_artist) {
		this.fk_artist = fk_artist;
	}

	public String getFormatDate() {
		return formatDate;
	}

	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}

	public Band getBand() {
		return band;
	}

	public void setBand(Band band) {
		this.band = band;
	}

	@Override
	public String toString() {
		return "Album [id=" + id + ", name=" + name + ", releaseDate=" + releaseDate + ", fk_artist=" + fk_artist
				+ ", formatDate=" + formatDate  + "]";
	}

	public Set<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

}
