package com.igt.apps.todo.services;

import com.igt.apps.todo.enums.TaskStatus;
import com.igt.apps.todo.model.Task;
import com.igt.apps.todo.model.User;
import com.igt.apps.todo.repository.TaskRepository;
import com.igt.apps.todo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TaskRepository taskRepository;

    @PostConstruct
    public void init(){
        User user1 = new User();
        user1.setUserId("testUser1");
        user1.setPassword("user1234");
        user1.setName("TestUser1");
        save(user1);

        User user2 = new User();
        user2.setUserId("testUser2");
        user2.setPassword("user5678");
        user2.setName("TestUser2");
        save(user2);
    }

    public void save(User user){
        userRepository.save(user);
    }
    public Task saveTask(Task task){
        Task taskR = taskRepository.save(task);
        return taskR;
    }
    public User fetchUser(User user){
        User user2 = userRepository.findByUserIdAndPassword(user.getUserId(),user.getPassword());
        return user2;
    }

    public User getUserById(Long id){
        return userRepository.findOne(id);
    }

    public void deleteTask(Long taskId){
        taskRepository.delete(taskId);
    }

    public void updateTaskStatus(Long taskId){
        Task task = getTask(taskId);
        task.setTaskStatus(TaskStatus.COMPLETED);
        taskRepository.save(task);
    }

    public Task getTask(Long taskId){
        return taskRepository.findOne(taskId);
    }
}
