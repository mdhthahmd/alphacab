<%-- 
    Document   : Customers
    Created on : Dec 02, 2019, 6:36:08 PM
    Author     : Ali Naseer
--%>

<%@page import="com.alphacab.model.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.RegisterBean"%>

<div>
    <h2>Customers</h2>
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
                ArrayList<UserBean> customers = (ArrayList<UserBean>) request.getSession().getAttribute("customers");
                for (int i = 0; i < customers.size(); i++) {%>
            <tr class="mdc-data-table__row">
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
                        <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">delete</button> 
                    </form>
                </td>
            </tr>
            <% }%> 
        </tbody>
    </table>
</div>

<div class="mdc-select">
    <div class="mdc-select__anchor demo-width-class">
        <i class="mdc-select__dropdown-icon"></i>
        <div class="mdc-select__selected-text"></div>
        <span class="mdc-floating-label">Pick a Food Group</span>
        <div class="mdc-line-ripple"></div>
    </div>

    <div class="mdc-select__menu mdc-menu mdc-menu-surface demo-width-class">
        <ul class="mdc-list">
            <li class="mdc-list-item mdc-list-item--selected" data-value="" aria-selected="true"></li>
            <li class="mdc-list-item" data-value="grains">
                Bread, Cereal, Rice, and Pasta
            </li>
            <li class="mdc-list-item" data-value="vegetables">
                Vegetables
            </li>
            <li class="mdc-list-item" data-value="fruit">
                Fruit
            </li>
        </ul>
    </div>
</div>

<style>
    .mdc-data-table__row:nth-child(2n) {
        background-color: lightgray;
    }
    .mdc-data-table__header-row{
        background-color: grey;
    }
</style>