package com.spectre.Spectre.application.core.user;

import com.spectre.Spectre.application.core.dtos.user.UserDto;
import com.spectre.Spectre.domain.entity.user.User;
import com.spectre.Spectre.domain.service.persona.PersonaContext;
import com.spectre.Spectre.domain.service.user.UserContext;
import com.spectre.Spectre.domain.vo.enums.UserRole;
import com.spectre.Spectre.domain.vo.exception.BadRequestException;
import com.spectre.Spectre.domain.vo.exception.NotFoundException;
import com.spectre.Spectre.domain.vo.utils.Functions;
import com.spectre.Spectre.infrastructure.repository.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.spectre.Spectre.domain.vo.utils.Functions.notNullAndNotEmptyValue;

@Service
@RequiredArgsConstructor
public class UserService implements UserContext {

    private static final String USER_NOT_FOUND = "Usuário não encontrado";
    private static final String PERSONA_NOT_INFORMED = "É necessário informar uma pessoa";

    private final UserRepository userRepository;
    private final PersonaContext personaService;

    @Override
    public Page<User> findAll(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    @Override
    public User findUserById(Long id) {
        return this.userRepository.findById(id).orElseThrow(() -> new NotFoundException(USER_NOT_FOUND));
    }

    @Override
    @Transactional
    public User create(UserDto userDto) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(userDto.getPersona()),
                () -> new BadRequestException(PERSONA_NOT_INFORMED)
        );

        User user = userDto.mapDtoToEntity();
        user.setRole(UserRole.OWNER);
        Functions.acceptTrueOrElse(
                this.personaService.existsById(userDto.getPersona().getId()),
                () -> user.setPersona(this.personaService.findById(userDto.getPersona().getId())),
                () -> user.setPersona(this.personaService.create(userDto.getPersona()))
        );
        return this.userRepository.save(user);
    }

    @Override
    @Transactional
    public void update(UserDto user) {
        Functions.acceptFalseThrows(
                notNullAndNotEmptyValue(user.getId()) && this.existsById(user.getId()),
                () -> new NotFoundException(USER_NOT_FOUND)
        );

        User userToUpdate = this.findUserById(user.getId());

        this.mapUserToUpdate(user, userToUpdate);

        this.userRepository.save(userToUpdate);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Functions.acceptFalseThrows(
                this.existsById(id),
                () -> new NotFoundException(USER_NOT_FOUND)
        );
        this.userRepository.deleteById(id);
    }

    private Boolean existsById(Long id) {
        return this.userRepository.existsById(id);
    }

    private void mapUserToUpdate(UserDto user, User userToUpdate) {
        userToUpdate.setEmail(user.getEmail());
        userToUpdate.setPassword(user.getPassword());
        userToUpdate.setPersona(user.getPersona().mapDtoToEntity());
    }
}
