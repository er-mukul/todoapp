package com.igt.apps.todo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


import com.igt.apps.todo.enums.TaskStatus;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name="TaskDetails")
public class Task  {
    @Id 
	@Column(name="TASK_ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long taskId;

	@NotEmpty
	@Size(min=3,max=100)
	@Column(name="TASK_DESCRIPTION")
	private String taskDesc;

	@NotEmpty
	@Size(min=3,max=100)
	@Column(name="TASK_NAME")
	private String taskName;

	@Column(name="TASK_STATUS")
	@Enumerated(EnumType.STRING)
	private TaskStatus taskStatus;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USER_ID",nullable = false)
	private User userDetails;

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public TaskStatus getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(TaskStatus taskStatus) {
		this.taskStatus = taskStatus;
	}

	public User getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(User userDetails) {
		this.userDetails = userDetails;
	}
}

