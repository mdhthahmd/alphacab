
    /**
    public void createUser(String userName, String pass, String email){
       String sqlQueryCreate_user = "insert into USERS (username, pass, email) values (?, ?, ?)";
       try{
        
            if (connection == null) {
                this.connect();
            }

            preparedstatement = connection.prepareStatement(sqlQueryCreate_user);
            preparedstatement.setString(1, userName);
            preparedstatement.setString(2, pass);
            preparedstatement.setString(3, email);
            preparedstatement.execute();
            
            preparedstatement.close();
            connection.close();
        }catch(Exception e){
            System.out.println("error: create user " + e);
        }
    }
    
    public void updateUser(String userName, String pass, String email){
       String sqlQuerryUpdate_user = "UPDATE USERS SET username = ?, pass = ?, WHERE email = ?";
       
       try{
        
            if (connection == null) {
                this.connect();
            }

            preparedstatement = connection.prepareStatement(sqlQuerryUpdate_user);
            preparedstatement.setString(1, userName);
            preparedstatement.setString(2, pass);
            preparedstatement.setString(3, email);
            preparedstatement.executeUpdate();
            
            preparedstatement.close();
            connection.close();
        }catch(Exception e){
            System.out.println("error: update user " + e);
        }
    }
    
    public void deleteUser(String email){
       String sqlQuerryDelete_user = "DELETE FROM USERS WHERE email = '"+email+"'";
       
       try{
        
            if (connection == null) {
                this.connect();
            }
            statement.executeUpdate(sqlQuerryDelete_user);
            
            statement.close();
            connection.close();
        }catch(Exception e){
            System.out.println("error: Delete user " + e);
        }
    }
    
    public User readUser(String email){
        ArrayList<User> usr = new ArrayList();
        usr = getUsers();
        for(int i = 0; i < usr.size(); i++)
        {
            if(email.equals(usr.get(i).getEmail()))
            {
                return usr.get(i);
            }
        }
        return null;
    }
    
    public ArrayList<User> getUsers (){
        ArrayList<User> users = new ArrayList();
        try{
        
            if (connection == null) {
                this.connect();
            }

            statement = connection.createStatement();

            resultset = statement.executeQuery("SELCET * FROM users");
            
            while(resultset.next())
            {
                User usr = new User(resultset.getString("username"),resultset.getString("pass"),resultset.getString("email"));
                users.add(usr);
            }
            statement.close();
            resultset.close();
            connection.close();
        }catch(Exception e){
            
        }
       return users;
    }
    
    /* driver 
    /* Journy 
    /* Admin 
    
    private void connect() {
        
        try (InputStream input = new FileInputStream("dbSettings/settings.properties")) {

            Properties dbConfig = new Properties();

            // load a properties file
            dbConfig.load(input);

            String host, port, db, user, password;

            host = dbConfig.getProperty("host");
            port = dbConfig.getProperty("port");
            db = dbConfig.getProperty("db");
            user = dbConfig.getProperty("user");
            password = dbConfig.getProperty("password");

            // jdbc:derby:[subsubprotocol:][databaseName][;attribute=value]*
            // https://db.apache.org/derby/docs/10.7/adminguide/radminnsdatasourcexmp.html
            String connectionURL = String.format("jdbc:derby://%s:%s/%s", host, port, db);

            System.out.println(connectionURL);

            ClientDataSource ds = new ClientDataSource();
            ds.setServerName(host);
            ds.setPortNumber(Integer.parseInt(port));
            ds.setDatabaseName(db);
            ds.setUser(user);
            ds.setPassword(password);

            

            try {
                connection = ds.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
   */