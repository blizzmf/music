package music.model;

import java.text.DecimalFormat;
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
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Music")
public class Music {

	@Id
	@Column(name = "PK_Music")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Duration")
	private double duration;
	
	@Column(name = "MusFormat")
	private String musFormat;
	
	@Column(name = "Cost")
	private double cost;
	
	@ManyToMany (mappedBy = "musics")
	private Set<Album> albums;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name = "SongArtist", joinColumns = {
			@JoinColumn(name = "FK_Music", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Artist",
					nullable = false, updatable = false) })
	private Set<Artist> artists; 
	
	@ManyToMany (mappedBy = "musicsCart")
	private Set<Cart> cart;

	@Transient
	private int artistID;
	
	@Transient
	private int albumID;
	
	public Music(){}
	
	public Set<Artist> getArtists() {
		return artists;
	}



	public void setArtists(Set<Artist> artists) {
		this.artists = artists;
	}



	public int getArtistID() {
		return artistID;
	}



	public void setArtistID(int artistID) {
		this.artistID = artistID;
	}



	public int getAlbumID() {
		return albumID;
	}



	public void setAlbumID(int albumID) {
		this.albumID = albumID;
	}



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

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public String getMusFormat() {
		return musFormat;
	}

	public void setMusFormat(String musFormat) {
		this.musFormat = musFormat;
	}

	public double getCost() {
		return cost;
	}



	@Override
	public String toString() {
		return "Music [id=" + id + ", name=" + name + ", duration=" + duration + ", musFormat=" + musFormat + ", cost="
				+ cost  + ", artistID=" + artistID + ", albumID=" + albumID + "]";
	}



	public Set<Album> getAlbums() {
		return albums;
	}



	public void setAlbums(Set<Album> albums) {
		this.albums = albums;
	}



	public Set<Cart> getCart() {
		return cart;
	}



	public void setCart(Set<Cart> cart) {
		this.cart = cart;
	}



	public void setCost(double cost) {
//		String formattedDouble = new DecimalFormat("#0.00").format(cost);
//		this.cost = Double.parseDouble(formattedDouble);
		this.cost = cost;
	}
	
}
