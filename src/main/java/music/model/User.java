package music.model;

import java.util.Set;


import javax.persistence.*;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@Column(name = "PK_Users")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "Login")
	private String username;
	
	@Column(name = "Pass")
	private String password;
	
	@Transient
	private String confirmPassword;
	
	@ManyToMany
	@JoinTable(name = "UserRole", joinColumns = @JoinColumn(name = "FK_User"),
	        inverseJoinColumns = @JoinColumn(name = "FK_Role"))
	private Set<Role> roles;

	@OneToMany(mappedBy="user")
    private Set<Login> logins;
	
	@OneToOne(mappedBy = "userCart")
	private Cart cart;
	
	public User(){}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Login> getLogins() {
		return logins;
	}

	public void setLogins(Set<Login> logins) {
		this.logins = logins;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", confirmPassword="
				+ confirmPassword  + "]";
	}
	
	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}




}
