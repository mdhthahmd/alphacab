
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>User Page</title>
        <link rel="stylesheet" href="bundle.css" type="text/css" />
        <script async src="bundle.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    </head>

    <body class="mdc-typography">

    <header class="mdc-top-app-bar">
        <div class="mdc-top-app-bar__row">
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">menu</button>
                <span class="mdc-top-app-bar__title">AlphaCab Dashboard</span>
            </section>
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
                <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Download">file_download</button>
                <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Print this page">print</button>
                <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Bookmark this page">bookmark</button>
            </section>
        </div>
    </header>

    <aside class="mdc-drawer mdc-top-app-bar--fixed-adjust">
        <div class="mdc-drawer__header">
            <h3 class="mdc-drawer__title">Welcome <%=session.getAttribute("userName")%></h3>
            <h6 class="mdc-drawer__subtitle"><%=session.getAttribute("Email")%>(<%=session.getAttribute("Role")%>)</h6>
        </div>

        <div class="mdc-drawer__content">
            <nav class="mdc-list">

                <%if (session.getAttribute("Role") == "Admin") {%>
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Administrator</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Account</span>
                </a>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Menu</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">person_add</i>
                    <span class="mdc-list-item__text">Add Driver</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">person_add_disabled</i>
                    <span class="mdc-list-item__text">Remove Driver</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">how_to_reg</i>
                    <span class="mdc-list-item__text">Customers List</span>
                </a>


                <a class="mdc-list-item mdc-list-item--activated" href="#" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">directions_car</i>
                    <span class="mdc-list-item__text">Drivers List</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">attach_money</i>
                    <span class="mdc-list-item__text">Change Price of Destination</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Daily Report</span>
                </a>

                <%}%>




                <%if (session.getAttribute("Role") == "Driver") {%>
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Driver</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Profile</span>
                </a>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Menu</h6>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/takejourney">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Take a Journey</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/map">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">near_me</i>
                    <span class="mdc-list-item__text">Map</span>
                </a>


                <a class="mdc-list-item" href="<%=request.getContextPath()%>/assignedjobs">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">assignment</i>
                    <span class="mdc-list-item__text">Assigned Jobs</span>
                </a>

                <a class="mdc-list-item mdc-list-item--activated" href="<%=request.getContextPath()%>/customersserved" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">people</i>
                    <span class="mdc-list-item__text">Customers Served</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/createinvoice">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">receipt</i>
                    <span class="mdc-list-item__text">Create Invoice</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/dailyreport">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Daily Report</span>
                </a>

                <%}%>

                 <%if (session.getAttribute("Role") == "Customer") {%>
                
                 <hr class="mdc-list-divider">
                 <h6 class="mdc-list-group__subheader">Customer</h6>
                 
                 <a class="mdc-list-item" href="<%=request.getContextPath()%>/dashboard">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">my_location</i>
                    <span class="mdc-list-item__text">Set a Pickup</span>
                </a>

                <a class="mdc-list-item mdc-list-item--activated" href="<%=request.getContextPath()%>/history" aria-current="page" >
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">history</i>
                    <span class="mdc-list-item__text">History</span>
                </a>
                    
                 <a class="mdc-list-item" href="<%=request.getContextPath()%>/account">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Account</span>
                </a>


                <%}%>


            </nav>
        </div>
    </aside>



    <div class="mdc-drawer-app-content mdc-top-app-bar--fixed-adjust">
        <main id="main-content" >

            <h1 class="mdc-typography--headline3" >Your History</h1>


            <div class="mdc-data-table">
                <table class="mdc-data-table__table" aria-label="Dessert calories">
                    <thead>
                        <tr class="mdc-data-table__header-row">
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Driver</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Origin</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Destination</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Date</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Time</th>
                        </tr>
                    </thead>
                    <tbody class="mdc-data-table__content">
                        <tr class="mdc-data-table__row">
                            <td class="mdc-data-table__cell">Abdulla Nabeel</td>
                            <td class="mdc-data-table__cell">Home</td>
                            <td class="mdc-data-table__cell">Bank Of Maldives</td>
                            <td class="mdc-data-table__cell">COMPLETED</td>
                            <td class="mdc-data-table__cell">30 November 2019</td>
                            <td class="mdc-data-table__cell">11:19 AM</td>
                        </tr>
                        <tr class="mdc-data-table__row">
                            <td class="mdc-data-table__cell">Abdulla Nabeel</td>
                            <td class="mdc-data-table__cell">Home</td>
                            <td class="mdc-data-table__cell">Bank Of Maldives</td>
                            <td class="mdc-data-table__cell">COMPLETED</td>
                            <td class="mdc-data-table__cell">30 November 2019</td>
                            <td class="mdc-data-table__cell">11:19 AM</td>
                        </tr>
                        <tr class="mdc-data-table__row">
                            <td class="mdc-data-table__cell">Abdulla Nabeel</td>
                            <td class="mdc-data-table__cell">Home</td>
                            <td class="mdc-data-table__cell">Bank Of Maldives</td>
                            <td class="mdc-data-table__cell">COMPLETED</td>
                            <td class="mdc-data-table__cell">30 November 2019</td>
                            <td class="mdc-data-table__cell">11:19 AM</td>
                        </tr>
                    </tbody>
                </table>
            </div>



        </main>
    </div>


  
                
    <style>

       

         #main-content {
            padding: 2.5em;
        }
        
        .mdc-data-table {
            width: 100%;
            margin-top: 2em;
        }


    </style>
</body>


</html>