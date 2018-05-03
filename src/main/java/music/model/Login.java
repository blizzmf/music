package music.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Login")
public class Login {

	@Id
	@Column(name = "PK_Login")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
    @JoinColumn(name="FK_Users", nullable=false)
	private User user;
	
	@Column(name = "DateLogin")
	private LocalDate dateLogin;
	
	@Column(name = "DateLogout")
	private LocalDate dateLogout;
	
	@Transient
	private String formatDateLogin;
	
	@Transient
	private String formatDateLogout;
	
	public Login(){}
	
	public Login(LocalDate dateLogin, LocalDate dateLogout){
		this.dateLogin = dateLogin;
		this.dateLogout = dateLogout;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public LocalDate getDateLogin() {
		return dateLogin;
	}

	public void setDateLogin(LocalDate dateLogin) {
		this.dateLogin = dateLogin;
	}

	public LocalDate getDateLogout() {
		return dateLogout;
	}

	public void setDateLogout(LocalDate dateLogout) {
		this.dateLogout = dateLogout;
	}

	public String getFormatDateLogin() {
		return formatDateLogin;
	}

	public void setFormatDateLogin(String formatDateLogin) {
		this.formatDateLogin = formatDateLogin;
	}

	public String getFormatDateLogout() {
		return formatDateLogout;
	}

	public void setFormatDateLogout(String formatDateLogout) {
		this.formatDateLogout = formatDateLogout;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", user=" + user + ", dateLogin=" + dateLogin + ", dateLogout=" + dateLogout
				+ ", formatDateLogin=" + formatDateLogin + ", formatDateLogout=" + formatDateLogout + "]";
	}


}
