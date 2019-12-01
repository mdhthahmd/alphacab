
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>AlphaCab - Dashboard</title>
        <link rel="stylesheet" href="bundle.css" type="text/css" />
        <script async src="bundle.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    </head>
    <body>

    <header class="mdc-top-app-bar">
        <div class="mdc-top-app-bar__row">
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">menu</button>
                <span class="mdc-top-app-bar__title">AlphaCab Dashboard</span>
            </section>
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
                <form action="<%=request.getContextPath()%>/logout" method="get" style="padding:1rem;">  
                    <button type="submit" class="mdc-button mdc-button--raised">
                        <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
                        <span class="material-icons mdc-top-app-bar mdc-icon-button">power_settings_new</span>
                        <!--<i class="material-icons mdc-list-item__graphic" aria-hidden="true">lock_open</i>-->
                    </button>                   
                </form>
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
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/add-driver">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Add Driver</span>
                </a>

                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Drivers</span>
                </a>
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
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/take-a-journey">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Take a Journey</span>
                </a>


                <a class="mdc-list-item" href="<%=request.getContextPath()%>/assigned-jobs">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">assignment</i>
                    <span class="mdc-list-item__text">Assigned Jobs</span>
                </a>

                <a class="mdc-list-item " href="<%=request.getContextPath()%>/customers-served" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">people</i>
                    <span class="mdc-list-item__text">Customers Served</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/create-invoice">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">receipt</i>
                    <span class="mdc-list-item__text">Create Invoice</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/daily-report">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Daily Report</span>
                </a>

                <%}%>


                <%if (session.getAttribute("Role") == "Customer") {%>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Customer</h6>

                <a class="mdc-list-item" href="<%=request.getContextPath()%>/dashboard" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">my_location</i>
                    <span class="mdc-list-item__text">Set a Pickup</span>
                    </a>

                    <a class="mdc-list-item" href="<%=request.getContextPath()%>/history">
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">history</i>
                        <span class="mdc-list-item__text">History</span>
                    </a>

                     <a class="mdc-list-item" href="<%=request.getContextPath()%>/account">
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                        <span class="mdc-list-item__text">Account</span>
                    </a>
                        
                    <a class="mdc-list-item" href="<%=request.getContextPath()%>/test-view-one">
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">visibility</i>
                        <span class="mdc-list-item__text">Test View One</span>
                    </a>
                        
                        <a class="mdc-list-item" href="<%=request.getContextPath()%>/test-view-two">
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">visibility</i>
                        <span class="mdc-list-item__text">Test View Two</span>
                    </a>
                        
                           <a class="mdc-list-item" href="<%=request.getContextPath()%>/get-a-ride">
                        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">visibility</i>
                        <span class="mdc-list-item__text">Get A Ride</span>
                    </a>
                <%}%>   
            </nav>
        </div>
    </aside>
    
     <div class="mdc-drawer-app-content mdc-top-app-bar--fixed-adjust">
        <main id="main-content" >
            
            <%if (session.getAttribute("Path") == "test-view-one") {%>
                <jsp:include page="test-view-one.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "test-view-two") {%>
                <jsp:include page="test-view-two.jsp" /> 
            <%}%>
            
             <%if (session.getAttribute("Path") == "get-a-ride") {%>
                <jsp:include page="customer/get-a-ride.jsp" /> 
            <%}%>
    
            <%if (session.getAttribute("Path") == "assigned-jobs") {%>
            <jsp:include page="driver/assigned-jobs.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "create-invoice") {%>
            <jsp:include page="driver/create-invoice.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "customers-served") {%>
            <jsp:include page="driver/customers-served.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "daily-report") {%>
            <jsp:include page="driver/daily-report.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "take-a-journey") {%>
            <jsp:include page="driver/take-a-journey.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "account") {%>
            <jsp:include page="customer/account.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "history") {%>
            <jsp:include page="customer/history.jsp" /> 
            <%}%>
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
