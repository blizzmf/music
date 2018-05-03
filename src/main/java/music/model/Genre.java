package music.model;

import java.util.Set;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import music.model.Genre;

@Entity
@Table(name = "Genre")
public class Genre {
	
	@Id
	@Column(name = "PK_Genre")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Name")
	private String name;
	
	@ManyToMany (mappedBy = "genres")
	private Set<Band> bands;
	
	public Genre(){}

	@Override
	public String toString() {
		return "Genre [id=" + id + ", name=" + name + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Set<Band> getBands() {
		return bands;
	}

	public void setBands(Set<Band> bands) {
		this.bands = bands;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
