<%-- 
    Document   : Customers
    Created on : Dec 02, 2019, 6:36:08 PM
    Author     : Ali Naseer
--%>

<%@page import="com.alphacab.model.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.RegisterBean"%>

<div class="title">
    <h2>Customers</h2>
</div>
<div class="mdc-data-table main-table">
    <table class="mdc-data-table__table" aria-label="Dessert calories">
        <thead>
            <tr class="mdc-data-table__header-row card">
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Full Name</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">User Name</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Email</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Edit</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Delete</th>
            </tr>
        </thead>
        <tbody class="mdc-data-table__content">
            <%
                ArrayList<UserBean> customers = (ArrayList<UserBean>) request.getSession().getAttribute("customers");
                for (int i = 0; i < customers.size(); i++) {%>
            <tr class="mdc-data-table__row card">
                <td class="mdc-data-table__cell"><%=customers.get(i).getFirstName()%></td>
                <td class="mdc-data-table__cell"><%=customers.get(i).getLastName()%></td>
                <td class="mdc-data-table__cell"><%=customers.get(i).getEmail()%></td>
                <td class="mdc-data-table__cell">
                    <form action="<%=request.getContextPath()%>/update-customer" method="post">
                        <a class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">edit</a>
                    </form>
                </td>    
                <td class="mdc-data-table__cell">
                    <form action="<%=request.getContextPath()%>/delete-customer" method="post">
                        <input type="submit" value="delete" class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" name="<%="submitCEmail"+customers.get(i).getEmail()%>"/>
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
    
    
    .card {
        max-width: 800px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    
    .main-table {
        display: flex;
        flex: 1;
        align-items: center;
        margin: 20px;
    }
    
    .title {
        display: flex;
        flex: 1;
        justify-content: center;
        padding: 20px;
    }
</style>