package music.model;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Cart")
public class Cart {

	@Id
	@Column(name = "PK_Cart")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_User")
	private User userCart;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "AlbumCart", joinColumns = {
			@JoinColumn(name = "FK_Cart", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Album",
					nullable = false, updatable = false) })
	private Set<Album> albumsCart; 
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "MusicCart", joinColumns = {
			@JoinColumn(name = "FK_Cart", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Music",
					nullable = false, updatable = false) })
	private Set<Music> musicsCart;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "BandCart", joinColumns = {
			@JoinColumn(name = "FK_Cart", nullable = false, updatable = false) },
			inverseJoinColumns = { @JoinColumn(name = "FK_Band",
					nullable = false, updatable = false) })
	private Set<Band> bandsCart;
	public Cart(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + "]";
	}

	public Set<Band> getBandsCart() {
		return bandsCart;
	}

	public void setBandsCart(Set<Band> bandsCart) {
		this.bandsCart = bandsCart;
	}

	public User getUserCart() {
		return userCart;
	}

	public void setUserCart(User userCart) {
		this.userCart = userCart;
	}
	
	public Set<Album> getAlbumsCart() {
		return albumsCart;
	}

	public void setAlbumsCart(Set<Album> albumsCart) {
		this.albumsCart = albumsCart;
	}

	public Set<Music> getMusicsCart() {
		return musicsCart;
	}

	public void setMusicsCart(Set<Music> musicsCart) {
		this.musicsCart = musicsCart;
	}

	
}
