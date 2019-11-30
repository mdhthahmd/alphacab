
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
    <aside class="mdc-drawer mdc-drawer--dismissible mdc-top-app-bar--fixed-adjust">
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
                <%}%>


                <%if (session.getAttribute("Role") == "Driver") {%>
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Driver</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Take a Journey</span>
                </a>
                <%}%>

                <%if (session.getAttribute("Role") == "Customer") {%>
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Customer</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Set a Pickup</span>
                </a>
                <%}%>

                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Labels</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Work</span>
                </a>

                <a class="mdc-list-item mdc-list-item--activated" href="#" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">inbox</i>
                    <span class="mdc-list-item__text">Inbox</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">star</i>
                    <span class="mdc-list-item__text">Star</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">send</i>
                    <span class="mdc-list-item__text">Sent Mail</span>
                </a>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">drafts</i>
                    <span class="mdc-list-item__text">Drafts</span>
                </a>
            </nav>
        </div>
    </aside>

    <!--<div class="mdc-drawer-app-content mdc-top-app-bar--fixed-adjust">-->
    <main class="main-content" >



    </main>
    <!--</div>-->

</body>

</html>
