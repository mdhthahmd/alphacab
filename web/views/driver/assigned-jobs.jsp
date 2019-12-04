<%@page import="com.alphacab.dao.JourneyDao"%>
<%@page import="com.alphacab.model.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alphacab.model.JourneyBean"%>

<h1 class="mdc-typography--headline3" >My Journeys</h1>

<div class="mdc-data-table">
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
                            ArrayList<JourneyBean> journeyInfo = new ArrayList();
                            new JourneyDao().getJourneyDetails("" + request.getSession().getAttribute("Email"), journeyInfo);
                            for (int i = 0; i < journeyInfo.size(); i++) {%>
            <tr class="mdc-data-table__row">
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getEmail()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getPickupLocation()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getDropoffLocation()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getStatus()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getDate()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getTime()%></td>
                <td class="mdc-data-table__cell"><%=journeyInfo.get(i).getDistance()%></td>
                <td class="mdc-data-table__cell">
                    <form action="<%=request.getContextPath()%>/update-driver" method="post">
                        <a class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button">check_circle_outline</a>
                    </form>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
</div>
