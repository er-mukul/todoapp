package com.igt.apps.todo.repository;

import com.igt.apps.todo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByUserIdAndPassword(String userId,String password);
}
