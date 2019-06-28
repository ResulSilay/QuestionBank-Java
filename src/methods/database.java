package methods;

import com.sun.deploy.util.SessionState;
import com.sun.net.httpserver.HttpServer;
import sun.net.httpserver.HttpServerImpl;

import java.sql.*;

public class database {
    private Connection con;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/qbdb";//?characterEncoding=ISO-8859-9
    private Statement stm;
    private ResultSet resultSet = null;

    public database()
    {
        this.stm=connect();
    }

    public Statement connect() {
        try {
            Class.forName(driver).newInstance();
            System.out.println("JDBC surucu basari ile yüklendi.");
        } catch (Exception e) {
            System.out.println("JDBC surucu Yuklenemedi. Hata:" + e.getMessage());
            System.exit(0);
        }

        try {
            con = DriverManager.getConnection(url, "root", "root");
            System.out.println("baglandi");
        } catch (Exception e) {
            System.out.println("Veri Taban. Hata:" + e.getMessage());

        }
        try {
            stm = con.createStatement();
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());

        }

        return stm;
    }

    public String get_Value(String query,int index)
    {
        try {
            resultSet = stm.executeQuery(query);
            resultSet.next();
            return resultSet.getString(index).toString();
            /*finally {
                try {
                    resultSet.close();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }*/
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }

        return null;
    }

    public int get_Value_Int(String query,int index)
    {
        try {
            resultSet = stm.executeQuery(query);
            resultSet.next();
            return resultSet.getInt(index);
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        return -1;
    }

    public boolean get_Value_Bool(String query,int index)
    {
        try {
            resultSet = stm.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        try {
            return resultSet.getBoolean(index);
        } catch (SQLException e) {
            e.printStackTrace();
        }   finally {
            try {
                resultSet.close();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return false;
    }

    public ResultSet get_List(String query) {
        try {
            resultSet = stm.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Hata list:" + e.getMessage());
        }
        return resultSet;
    }

    boolean status = false;
    public boolean set_Command(String query) {
        try {
            stm.execute(query);
            return true;
        } catch (Exception e) {
            System.out.println("Hata:" + e.getMessage());
        }
        return false;
    }

    public boolean Login(String username,String password)
    {
        int ID = get_Value_Int("select id from kullanicilar where username='"+username+"' and password='"+password+"'",1);
        if(ID>0)
        {
            return true;
        }
        else
            return false;
    }

    public int get_Account_ID(String username,String password)
    {
        int ID = get_Value_Int("select id from kullanicilar where username='"+username+"' and password='"+password+"'",1);
        if(ID>0)
        {
            return ID;
        }
        else
            return -1;
    }
}
