### UWE BSCS ESD Assignment - 2019 (Group 2)
A JSP/Servlet web application demonstrating the use of the MVC design pattern that implements a basic CRUD application for the ficitious alphacab startup.

### Getting Started

- clone the repo
```
git clone https://github.com/mdhthahmd/alphacab.git
```

- open the project in netbeans(must have java EE features installed in Netbeans including GlassFish Server)

- Create a JavaDB from Netbeans and setting user, password, databse and port

- run the **db.sql file** commands to set up the newly created database, **make sure the correct db is selcted**

- move **dbconfig.sample.properties** to the GlassFish directory and rename it to **dbconfig.properties**, and edit the fields to match up the database you created in previous step. *see the GlassFish Server Output in Netbeans if you ran into errors, probably path is wrong and the error will sepecify the proper directory to place the **dbconfig.properties** file*
  
- build and run the project in Netbeans
