<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.JourneyBean"%>

<h1 class="mdc-typography--headline3" >My Journeys</h1>

<div class="mdc-data-table">
    <form action="<%=request.getContextPath()%>/take-a-journey" method="post" name="takeCustomersJourney">
    <table class="mdc-data-table__table" aria-label="Dessert calories">
        <thead>
            <tr class="mdc-data-table__header-row">
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Customer Email</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Pickup Location</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Destination</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Date</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Time</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Distance</th>
                <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Accept</th>
            </tr>
        </thead>
        <tbody class="mdc-data-table__content">
            <%
                ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getAttribute("assigned-jobs");
                for (int i = 0; i < journeys.size(); i++) {%>
            <tr class="mdc-data-table__row">
                <td class="mdc-data-table__cell"><%=journeys.get(i).getEmail()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getPickupLocation()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getDropoffLocation()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getStatus()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getDate()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getTime()%></td>
                <td class="mdc-data-table__cell"><%=journeys.get(i).getDistance()%></td>
                <td class="mdc-data-table__cell">
                    <input type="submit" class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" value="check_circle_outline" name=<%="submit_"+journeys.get(i).getJourneyID()%>/>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
    </form>
</div>
