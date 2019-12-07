
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

    <body class="mdc-typography">
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma3", "no-cahce");
            response.setHeader("Expires", "0");

            if (session.getAttribute("userName") == null) {
                response.sendRedirect(request.getContextPath()+"/");
            }
        %>

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
              
                <a class="mdc-list-item <%=session.getAttribute("Path") == "drivers" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/drivers">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">directions_car</i>
                    <span class="mdc-list-item__text">Drivers</span>
                </a>
                    
                <!-- <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Account</span>
                </a> -->

                <a class="mdc-list-item <%=session.getAttribute("Path") == "customers-list" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/customers-list">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">how_to_reg</i>
                    <span class="mdc-list-item__text">Customers</span>
                </a>

                <a class="mdc-list-item <%=session.getAttribute("Path") == "change-price" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/change-price">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">attach_money</i>
                    <span class="mdc-list-item__text">Change Price</span>
                </a>
                    
                <a class="mdc-list-item <%=session.getAttribute("Path") == "assign-jobs" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/assign-jobs">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Assign Jobs</span>
                </a>
                    
                <a class="mdc-list-item  <%=session.getAttribute("Path") == "generate-report" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/generate-report">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Generate Report</span>
                </a>

                <%}%>




                <%if (session.getAttribute("Role") == "Driver") {%>
                
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Driver</h6>
                
              
                
                <a class="mdc-list-item <%=session.getAttribute("Path") == "take-a-journey" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/take-a-journey">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Take a Journey</span>
                </a>
                
                <a class="mdc-list-item <%=session.getAttribute("Path") == "assigned-jobs" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/assigned-jobs">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">assignment</i>
                    <span class="mdc-list-item__text">Assigned Jobs</span>
                </a>
                
                <a class="mdc-list-item <%=session.getAttribute("Path") == "customers-served" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/customers-served">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">people</i>
                    <span class="mdc-list-item__text">Customers Served</span>
                </a>
                
                <a class="mdc-list-item <%=session.getAttribute("Path") == "create-invoice" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/create-invoice">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">receipt</i>
                    <span class="mdc-list-item__text">Create Invoice</span>
                </a>
                
                <a class="mdc-list-item <%=session.getAttribute("Path") == "daily-report" ? "mdc-list-item--activated" : "" %>"  href="<%=request.getContextPath()%>/daily-report">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Daily Report</span>
                </a>

                <%}%>

                <%if (session.getAttribute("Role") == "Customer") {%>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Customer</h6>

                <a class="mdc-list-item <%=session.getAttribute("Path") == "get-a-ride" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/get-a-ride">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">my_location</i>
                    <span class="mdc-list-item__text">Get A Ride</span>
                </a>
                    
                 <a class="mdc-list-item <%=session.getAttribute("Path") == "bookings" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/bookings">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Bookings</span>
                </a>

                <a class="mdc-list-item <%=session.getAttribute("Path") == "history" ? "mdc-list-item--activated" : "" %>" href="<%=request.getContextPath()%>/history">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">history</i>
                    <span class="mdc-list-item__text">History</span>
                </a>
                <%}%>   
            </nav>
        </div>
    </aside>

    <div class="mdc-drawer-app-content mdc-top-app-bar--fixed-adjust">
        <main id="main-content" >
            
            <%if (session.getAttribute("Path") == "add-driver") {%>
            <jsp:include page="admin/add-driver.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "drivers") {%>
            <jsp:include page="admin/drivers.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "customers-list") {%>
            <jsp:include page="admin/customers.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "edit-driver") {%>
            <jsp:include page="admin/edit-driver.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "change-price") {%>
            <jsp:include page="admin/change-price.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "assign-jobs") {%>
                <jsp:include page="admin/assign-jobs.jsp" /> 
            <%}%>
            
             <%if (session.getAttribute("Path") == "generate-report") {%>
            <jsp:include page="admin/generate-report.jsp" /> 
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
            
            <!--- Customer Options ---->

            <%if (session.getAttribute("Path") == "get-a-ride") {%>
            <jsp:include page="customer/get-a-ride.jsp" /> 
            <%}%>
            
            <%if (session.getAttribute("Path") == "bookings") {%>
            <jsp:include page="customer/bookings.jsp" /> 
            <%}%>

            <%if (session.getAttribute("Path") == "history") {%>
            <jsp:include page="customer/history.jsp" /> 
            <%}%>
            
        </main>
    </div>
</body>

</html>
