package dao;
import model.User;

import java.util.List;

public interface UserDAO {

    User getOne(int id);

    List<User> getAll();

    void save(User user);

}
