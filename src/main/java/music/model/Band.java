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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Band")
public class Band {

	@Id
	@Column(name = "PK_Band")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "DateOfFoundation")
	private LocalDate dateOfFoundation;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Description")
	private String descript;
	
	@Column(name = "DateOfClose")
	private LocalDate dateOfClose;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "GenreGr", joinColumns = {
			@JoinColumn(name = "FK_Band", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Genre",
					nullable = false, updatable = false) })
	private Set<Genre> genres; 
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="band", cascade = CascadeType.ALL)
    private Set<Album> albums;

	@ManyToMany (mappedBy = "bandsCart")
	private Set<Cart> cart;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="band")
	private Set<Concert> concerts;

	public Set<Cart> getCart() {
		return cart;
	}

	public void setCart(Set<Cart> cart) {
		this.cart = cart;
	}

	public Set<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(Set<Album> albums) {
		this.albums = albums;
	}

	public Set<Genre> getGenres() {
		return genres;
	}

	public void setGenres(Set<Genre> genres) {
		this.genres = genres;
	}

	public Set<Concert> getConcerts() {
		return concerts;
	}

	public void setConcerts(Set<Concert> concerts) {
		this.concerts = concerts;
	}

	@Transient
	private String formatDate;
	@Transient
	private int genreID;
	public int getGenreID() {
		return genreID;
	}
	public void setGenreID(int genreID) {
		this.genreID = genreID;
	}

	@Transient
	private String formatDateClose;
	
	public Band(){}

	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public LocalDate getDateOfFoundation() {
		return dateOfFoundation;
	}


	public void setDateOfFoundation(LocalDate dateOfFoundation) {
		this.dateOfFoundation = dateOfFoundation;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDescript() {
		return descript;
	}



	public void setDescript(String descript) {
		this.descript = descript;
	}



	public LocalDate getDateOfClose() {
		return dateOfClose;
	}



	public void setDateOfClose(LocalDate dateOfClose) {
		this.dateOfClose = dateOfClose;
	}



	public String getFormatDate() {
		return formatDate;
	}



	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}



	public String getFormatDateClose() {
		return formatDateClose;
	}



	public void setFormatDateClose(String formatDateClose) {
		this.formatDateClose = formatDateClose;
	}



	@Override
	public String toString() {
		return "Band [id=" + id + ", dateOfFoundation=" + dateOfFoundation + ", name=" + name + ", descript=" + descript
				+ ", dateOfClose=" + dateOfClose + ", formatDate=" + formatDate + "]";
	}

	
}
