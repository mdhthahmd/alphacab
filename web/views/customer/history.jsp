
<%@page import="com.alphacab.model.JourneyBean"%>
<%@page import="java.util.ArrayList"%>

<div class="container" >

    <h1 class="mdc-typography--headline3" >History</h1>

    <button class="js--dropdown-toggle">Open Menu One</button>
    <div class="mdc-simple-menu mdc-simple-menu--open-from-bottom-left" tabindex="-1">
        <ul class="mdc-simple-menu__items mdc-list" role="menu" aria-hidden="true">
            <li class="mdc-list-item" role="menuitem" tabindex="0">
                Menu One: Link 1
            </li>
            <li class="mdc-list-item" role="menuitem" tabindex="0">
                Menu One: Link 2
            </li>
        </ul>
    </div>

    <div class="mdc-data-table">
        <table class="mdc-data-table__table" aria-label="Dessert calories">
            <thead>
                <tr class="mdc-data-table__header-row">
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Origin</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Destination</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Date</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Time</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                </tr>
            </thead>
            <tbody class="mdc-data-table__content">
                <%
                    ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getAttribute("history");
                    for (int i = 0; i < journeys.size(); i++) {%>
                <tr class="mdc-data-table__row">
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getPickupLocation()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDropoffLocation()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDate()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getTime()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getStatus()%></td>
                </tr>
                <%}%> 
            </tbody>
        </table>
    </div>

</div>

<style>
    .container {
        padding: 2.5em;
    }

    .mdc-data-table {
        width: 100%;
        margin-top: 2em;
    }
</style>

