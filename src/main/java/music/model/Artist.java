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
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Artist")
public class Artist {
	@Id
	@Column(name = "PK_Artist")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Surname")
	private String surName;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Secondname")
	private String secName;
	
	@Column(name = "Spec")
	private String spec;
	
	@Column(name = "birthday")
	private LocalDate birthday;
	
	@ManyToMany (mappedBy = "artists")
	private Set<Music> musics;
	
	@Transient
	private String formatDate;

	public String getFormatDate() {
		return formatDate;
	}

	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}

	public int getId() {
		return id;
	}
	
	public Artist(){}
	
	public void setId(int i) {
		this.id = i;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSecName() {
		return secName;
	}

	public void setSecName(String secName) {
		this.secName = secName;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "Artist [id=" + id + ", surName=" + surName + ", name=" + name + ", secName=" + secName + ", spec="
				+ spec + ", birthday=" + birthday + "]";
	}
	
}
