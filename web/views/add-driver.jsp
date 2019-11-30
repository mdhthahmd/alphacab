
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>User Page</title>
        <link rel="stylesheet" href="bundle.css" type="text/css" />
        <script async src="bundle.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
        <%@include file = "dashboard.jsp" %>
    </head>

    <body>


        <form class="mdc-form-field" action="<%=request.getContextPath()%>/createdriver" method="post">

            <div class="mdc-text-field mdc-text-field--outlined">
                <input class="mdc-text-field__input" name="fullname">
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="text-field-hero-input" class="mdc-floating-label">Full Name</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined">
                <input class="mdc-text-field__input" name="email">
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="text-field-hero-input" class="mdc-floating-label">Email</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined">
                <input class="mdc-text-field__input" name="username">
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="text-field-hero-input" class="mdc-floating-label">User Name</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined">
                <input class="mdc-text-field__input" name="password">
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="text-field-hero-input" class="mdc-floating-label">Password</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>

            <div class="button-container">
                <button type="submit" class="mdc-button mdc-button--raised">
                    <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
                    <span class="mdc-button__label">Create</span>
                </button>

                <button type="submit" class="mdc-button mdc-button--raised">
                    <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
                    <span class="mdc-button__label">Cancel</span>
                </button>
            </div>
        </form>

    <style>
        
    </style>

</body>


</html>