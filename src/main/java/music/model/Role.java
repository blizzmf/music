package music.model;

import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "Role")
public class Role {
    @Id
    @Column(name = "PK_Role")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "RoleName")
    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

    public Role(){}
    
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

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + "]";
	}


}
