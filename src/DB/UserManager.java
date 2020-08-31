package DB;

import Model.User;
import util.Online;
import util.Roles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserManager implements UserDAO {

    private Connection conn;

    public UserManager() {
        conn = DBConnection.getConnection();
    }

    @Override
    public void addUser(User user) {

        try {
            PreparedStatement pstmt = conn.prepareStatement("Insert into user(name,username,email,password) " +
                                        "values(?,?,?,SHA(?))");

            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getUsername());
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4,user.getPassword());

            pstmt.executeUpdate();


        }catch (SQLException e){
            e.printStackTrace();
        }


    }

    @Override
    public void addUserAdmin(User user) {

        try {
            PreparedStatement pstmt = conn.prepareStatement("Insert into user(name,username,email,password,path,contactnumber,role,active)" +
                    "values(?,?,?,?,?,?,?,?)");

            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getUsername());
            pstmt.setString(3,user.getEmail());
            pstmt.setString(4,user.getPassword());
            pstmt.setString(5,user.getPath());
            pstmt.setString(6,user.getContactNumber());
            pstmt.setString(7,user.getRole());
            pstmt.setInt(8,user.getActive());

            pstmt.executeUpdate();


        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public void removeUser(int id) {

        try {

            PreparedStatement pstmt = conn.prepareStatement("Delete from user where id = ? ");
            pstmt.setInt(1,id);

            pstmt.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(int userId, User user) {

        try {
            PreparedStatement pstmt = conn.prepareStatement("update user set name=?,email=?,active=?,role=?,path=? where id = ?");

            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setInt(3,user.getActive());
            pstmt.setString(4,user.getRole());
            pstmt.setString(5,user.getPath());
            pstmt.setInt(6,userId);
            pstmt.executeUpdate();


        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public List<User> getUsers() {

        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id,name,username,email,cart_count from user");
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()){
                User user = new User();
                user.setName(resultSet.getString("name"));
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setCart_count(resultSet.getInt("cart_count"));

                userList.add(user);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }

        return userList;

    }

    @Override
    public List<User> getUsersAdmin(int userId) {

        List<User> userList = new ArrayList<>();

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id,name,username,email,cart_count,role,active,online from user");
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()){
                User user = new User();
                int id = resultSet.getInt("id");
                user.setName(resultSet.getString("name"));
                user.setId(id);
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setCart_count(resultSet.getInt("cart_count"));
                user.setRole(resultSet.getString("role"));
                user.setActive(resultSet.getInt("active"));
                user.setOnline(resultSet.getInt("online"));

                if(userId == id){
                    userList.add(0,user);
                }else {
                    userList.add(user);
                }

            }


        }catch (SQLException e){
            e.printStackTrace();
        }

        return userList;

    }

    @Override
    public User getUserAdmin(int userId) {
        User user = new User();
        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id,name,username,email,path,role,active,online,contactnumber,password from user where id=?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()){
                user.setName(resultSet.getString("name"));
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                String role = resultSet.getString("role").equals("Administrator") ? "Administrator":"User";
                user.setRole(role);
                user.setPassword(resultSet.getString("password"));
                user.setPath(resultSet.getString("path"));
                user.setContactNumber(resultSet.getString("contactnumber"));
                user.setActive(resultSet.getInt("active"));
                user.setOnline(resultSet.getInt("online"));
            }


        }catch (SQLException e){
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean isActive(int userId) {
        boolean isActive = false;

        try{
            PreparedStatement pstmt = conn.prepareStatement("Select active from user where id=?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()){
                isActive = resultSet.getInt("active") == 1;
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }

        return isActive;

    }

    @Override
    public void activateUser(int userId) {
        try{
            PreparedStatement pstmt = conn.prepareStatement("Update user set active=1 where id=?");
            pstmt.setInt(1,userId);
            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deActivateUser(int userId) {
        try{
            PreparedStatement pstmt = conn.prepareStatement("Update user set active=0 where id=?");
            pstmt.setInt(1,userId);
            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isOnline(int userId) {
        boolean isOnline = false;

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select online from user where userid = ?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                isOnline = (resultSet.getInt("online") == 1 );
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }


        return isOnline;
    }

    @Override
    public void setOnline(int userId, Online online) {

        String status = (online == Online.ONLINE ? "1":"0");

        try {
            PreparedStatement pstmt = conn.prepareStatement("Update user set online = ? where id = ?");
            pstmt.setString(1,status);
            pstmt.setInt(2,userId);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUser(int userId) {

        User user = new User();

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id,name,username,email,cart_count from user where id = ?");
            pstmt.setInt(1,userId);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()){

                user.setName(resultSet.getString("name"));
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setCart_count(resultSet.getInt("cart_count"));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean isAdmin(int userId) {

        boolean isAdmin = false;

        try {

            PreparedStatement pstmt = conn.prepareStatement("Select role from user where id = ?");
            pstmt.setInt(1,userId);
            ResultSet resultSet =  pstmt.executeQuery();

            while (resultSet.next()) {

                String role = resultSet.getString("role");
                if(role.equals(Roles.Administrator.toString())){
                    isAdmin = true;
                }

            }


        }catch (SQLException e) {
            e.printStackTrace();
        }

        return isAdmin;
    }

    @Override
    public int userExist(String username, String password) {

        int userId = -1;

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id from user where username = ? and password = ?");
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                userId = resultSet.getInt("id");
            }

        }
        catch (SQLException e) {

        }


        return userId;
    }

    @Override
    public boolean userExist(int id) {
        int userId = -1;

        try {
            PreparedStatement pstmt = conn.prepareStatement("Select id from user where id = ?");
            pstmt.setInt(1,id);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                userId = resultSet.getInt("id");
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }


        return userId > 0;
    }

    @Override
    public boolean userExist(String userName) {

        String name = "";
        try {
            PreparedStatement pstmt = conn.prepareStatement("Select username from user where username = ?");
            pstmt.setString(1,userName);

            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
               name =  resultSet.getString("username");
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }


        return !name.equals("");
    }
}
