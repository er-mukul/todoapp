package com.igt.apps.todo.repository;

import com.igt.apps.todo.enums.TaskStatus;
import com.igt.apps.todo.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task,Long> {
}
