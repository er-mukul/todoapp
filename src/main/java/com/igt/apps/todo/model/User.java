package com.igt.apps.todo.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="UserDetails")
public class User implements Serializable {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Size(min=3,max=15)
	@Column(name="USER_ID")
	private String userId;

	@Size(min=6)
	@Column(name="PASSWORD")
	private String password;

	@Size(max=30)
	@Column(name="NAME")
	private String name;

	@OneToMany(cascade = CascadeType.ALL,mappedBy = "userDetails",fetch = FetchType.EAGER)
	private Set<Task> tasks;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Task> getTasks() {
		return tasks;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}
}
