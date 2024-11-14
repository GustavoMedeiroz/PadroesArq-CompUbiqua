package com.spectre.Spectre.infrastructure.repository.user;

import com.spectre.Spectre.domain.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
