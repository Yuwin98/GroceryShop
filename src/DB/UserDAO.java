package DB;

import Model.User;
import util.Online;

import java.util.List;

public interface UserDAO {

     void addUser(User user);
     void addUserAdmin(User user);
     void removeUser(int userId);
     void updateUser(int userId, User user);

     List<User> getUsers();
     User getUser(int userId);
     List<User> getUsersAdmin(int userId);
     User getUserAdmin(int userId);

     boolean isAdmin(int userId);

     int userExist(String username,String password);
     boolean userExist(int userId);
     boolean userExist(String userName);

     boolean isActive(int userId);
     void activateUser(int userId);
     void deActivateUser(int userId);

     boolean isOnline(int userId);
     void setOnline(int userId, Online online);
}
