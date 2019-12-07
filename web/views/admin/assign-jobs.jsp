<%@page import="com.alphacab.model.UserBean"%>
<%@page import="com.alphacab.model.JourneyBean"%>
<%@page import="java.util.ArrayList"%>
<h1 class="mdc-typography--headline3" >Assign Journey</h1>
<div class="mdc-data-table">
    <form action="<%=request.getContextPath()%>/assign-jobs" method="post">
        <table class="mdc-data-table__table" aria-label="Dessert calories">
            <thead>
                <tr class="mdc-data-table__header-row">
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Journey ID</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Pickup Location</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Destination</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Date</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Time</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Distance</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Driver</th>
                    <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Assign</th>
                </tr>
            </thead>
            <tbody class="mdc-data-table__content">
                <% if (request.getSession().getAttribute("unassignedJobs") != null) { %>
                <%
                    ArrayList<UserBean> drivers = (ArrayList<UserBean>) request.getSession().getAttribute("driverList");
                    ArrayList<JourneyBean> journeys = (ArrayList<JourneyBean>) request.getSession().getAttribute("unassignedJobs");
                    for (int i = 0; i < journeys.size(); i++) {%>
                <tr class="mdc-data-table__row">
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getJourneyID()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getPickupLocation()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDropoffLocation()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getStatus()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDate()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getTime()%></td>
                    <td class="mdc-data-table__cell"><%=journeys.get(i).getDistance()%></td>
                    <td class="mdc-data-table__cell">
                       <div class="custom-select" style="width:250px;">
                           <select name="driverEmail">
                               <% for (int j = 0; j < drivers.size(); j++) {%>
                                   <option value="<%=drivers.get(j).getEmail()%>"><%=drivers.get(j).getEmail()%></option>
                               <%}%>
                           </select>
                       </div>
                    </td>
                    <td class="mdc-data-table__cell">
                            <input type="submit" class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" value="check_circle_outline" name=<%="submit_"+journeys.get(i).getJourneyID()%>/>
                    </td>
                </tr>
                <%}%>
                <%}%>
            </tbody>
        </table>
    </form>
</div>
    
        
<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>
    
<style>
/*the container must be positioned relative:*/
.custom-select {
  position: relative;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
  background-color: black;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: #3d3d3d;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  cursor: pointer;
  user-select: none;
  border-radius: 20px;
}

/*style items (options):*/
.select-items {
  position: absolute;
  background-color: graytext;
  top: 130%;
  left: 0;
  right: 0;
  z-index: 99;
  border-radius: 20px;
}

/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: #3d3d3d
}
</style>
<!--some comments-->