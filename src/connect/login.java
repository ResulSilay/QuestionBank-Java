package connect;

import methods.database;

import javax.xml.ws.Response;

public class login {

    database db;
    public login()
    {
        db=new database();
    }

    public void action_login(String username,String password)
    {
        System.out.println(username);
    }
}
