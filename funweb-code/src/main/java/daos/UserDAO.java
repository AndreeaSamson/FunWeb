package daos;


import oracle.jdbc.driver.DBConversion;
import user.User;
import db.DBConnection;

public class UserDAO {

    //private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    // private JdbcTemplate jdbcTemplate;
    //private SimpleJdbcInsert insert;

    // add crud methods here
    private DBConnection connection;
    public UserDAO(DBConnection connection){
        this.connection = connection;
    }

    public User getUser(Long id){
        //String sql = "select name from User where id=" + id +";";

        //HashMap<String, Long> parameters  = new HashMap<String, Long>();
        //parameters.put("id" , id);

        //List<User> query = namedParameterJdbcTemplate.query(sql , parameters , userRowMapper);

        return null;
    }

    public boolean createUser(User user){
        return true;
    }

    public boolean updateUser(User user){
        return true;
    }

    public boolean removeUser(User user){
        return true;
    }

}