<%-- 
    Document   : drivers
    Created on : Nov 30, 2019, 6:36:08 PM
    Author     : Ali Naseer
--%>

<%@page import="com.alphacab.model.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.RegisterBean"%>

<div>
    <h2>Drivers</h2>
</div>
<div class="add-driver-button">
    <a class="mdc-list-item" href="<%=request.getContextPath()%>/add-driver">
        <i class="material-icons mdc-list-item__graphic" aria-hidden="true">person_add</i>
        <span class="mdc-list-item__text">Add Driver</span>
    </a>
</div>
<div class="mdc-data-table">
    <table class="mdc-data-table__table" aria-label="Dessert calories">
        <thead>
            <tr class="mdc-data-table__header-row">
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Full Name</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">User Name</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Email</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Edit</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Delete</th>
            </tr>
        </thead>
        <tbody class="mdc-data-table__content">
            <%
                ArrayList<UserBean> drivers = (ArrayList<UserBean>) request.getSession().getAttribute("drivers");
                for (int i = 0; i < drivers.size(); i++) {%>
            <tr class="mdc-data-table__row">
                <td class="mdc-data-table__cell"><%=drivers.get(i).getFirstName()%></td>
                <td class="mdc-data-table__cell"><%=drivers.get(i).getLastName()%></td>
                <td class="mdc-data-table__cell"><%=drivers.get(i).getEmail()%></td>
                <td class="mdc-data-table__cell">

                    <form action="<%=request.getContextPath()%>/update-driver" method="post">
                        <a class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">edit</a>
                    </form>
                </td>    
                <td class="mdc-data-table__cell">
                    <form action="<%=request.getContextPath()%>/delete-driver" method="post">
                        <input type="submit" value="delete" class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" name="<%="submitDEmail"+drivers.get(i).getEmail()%>" /> 
                    </form>
                </td>
            </tr>
            <% }%> 
        </tbody>
    </table>
</div>

<style>
    .mdc-data-table__row:nth-child(2n) {
        background-color: lightgray;
    }
    .mdc-data-table__header-row{
        background-color: grey;
    }
    
    .add-driver-button {
        flex: 1;
        align-items: flex-end !important;
    }
</style>