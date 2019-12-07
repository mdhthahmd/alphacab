<%@page import="com.alphacab.model.JourneyBean"%>
<%@page import="java.util.ArrayList"%>
<div class="container" >

     <h1 class="mdc-typography--headline3" >My Bookings</h1>
     
     <div class="mdc-data-table">
         <form action="<%=request.getContextPath()%>/cancel-booking" method="post" name="cancellBooking">
        <table class="mdc-data-table__table" aria-label="Dessert calories">
            <thead>
                <tr class="mdc-data-table__header-row">
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Origin</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Destination</th>
<!--                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Date</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Time</th>-->
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody class="mdc-data-table__content">
                <%
                ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getAttribute("Bookings");
                for (int i = 0; i < journeys.size(); i++) {%>
                <tr class="mdc-data-table__row">
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getPickupLocation()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDropoffLocation()%></td>
<!--                       <td class="mdc-data-table__cell"><%=journeys.get(i).getDate()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getTime()%></td>-->
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getStatus()%></td>
                    <td>
                        <input type="submit" class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" value="remove_circle_outline" name=<%="submit_"+journeys.get(i).getJourneyID()%>/>
                    </td>
                </tr>
                 <%}%> 
            </tbody>
        </table>
       </form>
    </div>

</div>

<style>
    .container {
        padding: 2.5em;
    }

</style>

