
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>AlphaCab - Dashboard</title>
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
    <aside class="mdc-drawer mdc-top-app-bar--fixed-adjust">
        <div class="mdc-drawer__header">
            <h3 class="mdc-drawer__title">Welcome <%=session.getAttribute("userName")%></h3>
            <h6 class="mdc-drawer__subtitle"><%=session.getAttribute("Email")%>(<%=session.getAttribute("Role")%>)</h6>
        </div>

        <div class="mdc-drawer__content">
            <nav class="mdc-list">


           

                <%if (session.getAttribute("Role") == "Driver") {%>
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Driver</h6>
                <a class="mdc-list-item" href="#">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">account_circle</i>
                    <span class="mdc-list-item__text">Profile</span>
                </a>
                
                <hr class="mdc-list-divider">
                <h6 class="mdc-list-group__subheader">Menu</h6>
                <a class="mdc-list-item mdc-list-item--activated" href="<%=request.getContextPath()%>/take-a-journey">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>
                    <span class="mdc-list-item__text">Take a Journey</span>
                </a>

                
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/assigned-jobs">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">assignment</i>
                    <span class="mdc-list-item__text">Assigned Jobs</span>
                </a>

                <a class="mdc-list-item" href="<%=request.getContextPath()%>/customers-served" aria-current="page">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">people</i>
                    <span class="mdc-list-item__text">Customers Served</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/create-invoice">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">receipt</i>
                    <span class="mdc-list-item__text">Create Invoice</span>
                </a>
                <a class="mdc-list-item" href="<%=request.getContextPath()%>/daily-report">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">description</i>
                    <span class="mdc-list-item__text">Daily Report</span>
                </a>
                
                <%}%>





            </nav>
        </div>
    </aside>

    <div class="mdc-drawer-app-content mdc-top-app-bar--fixed-adjust">
        <main id="main-content" >
            
            <h1 class="mdc-typography--headline3" >Select a Journey</h1>

            <div class="mdc-data-table">
                <table class="mdc-data-table__table" aria-label="Dessert calories">
                    <thead>
                        <tr class="mdc-data-table__header-row">
                            <th class="mdc-data-table__header-cell mdc-data-table__header-cell--checkbox" role="columnheader" scope="col">
                                <div class="mdc-checkbox mdc-data-table__header-row-checkbox mdc-checkbox--selected">
                                    <input type="checkbox" class="mdc-checkbox__native-control" aria-label="Checkbox for header row selection"/>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewbox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                            </th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Status</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Signal name</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Severity</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Stage</th>
                            <th class="mdc-data-table__header-cell mdc-data-table__header-cell--numeric" role="columnheader" scope="col">Time</th>
                            <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Roles</th>
                        </tr>
                    </thead>
                    <tbody class="mdc-data-table__content">
                        <tr data-row-id="u0" class="mdc-data-table__row">
                            <td class="mdc-data-table__cell mdc-data-table__cell--checkbox">
                                <div class="mdc-checkbox mdc-data-table__row-checkbox">
                                    <input type="checkbox" class="mdc-checkbox__native-control" aria-labelledby="u0"/>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewbox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                            </td>
                            <td class="mdc-data-table__cell">Online</td>
                            <td class="mdc-data-table__cell" id="u0">Arcus watch slowdown</td>
                            <td class="mdc-data-table__cell">Medium</td>
                            <td class="mdc-data-table__cell">Triaged</td>
                            <td class="mdc-data-table__cell mdc-data-table__cell--numeric">0:33</td>
                            <td class="mdc-data-table__cell">Allison Brie</td>
                        </tr>
                        <tr data-row-id="u1" class="mdc-data-table__row" aria-selected="true">
                            <td class="mdc-data-table__cell mdc-data-table__cell--checkbox">
                                <div class="mdc-checkbox mdc-data-table__row-checkbox mdc-checkbox--selected">
                                    <input type="checkbox" class="mdc-checkbox__native-control" checked aria-labelledby="u1"/>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewbox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                            </td>
                            <td class="mdc-data-table__cell">Offline</td>
                            <td class="mdc-data-table__cell" id="u1">monarch: prod shared ares-managed-features-provider-heavy</td>
                            <td class="mdc-data-table__cell">Huge</td>
                            <td class="mdc-data-table__cell">Triaged</td>
                            <td class="mdc-data-table__cell mdc-data-table__cell--numeric">0:33</td>
                            <td class="mdc-data-table__cell">Brie Larson</td>
                        </tr>
                        <tr data-row-id="u2" class="mdc-data-table__row" aria-selected="true">
                            <td class="mdc-data-table__cell mdc-data-table__cell--checkbox">
                                <div class="mdc-checkbox mdc-data-table__row-checkbox mdc-checkbox--selected">
                                    <input type="checkbox" class="mdc-checkbox__native-control" checked aria-labelledby="u2"/>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewbox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                            </td>
                            <td class="mdc-data-table__cell">Online</td>
                            <td class="mdc-data-table__cell" id="u2">monarch: prod shared ares-managed-features-provider-heavy</td>
                            <td class="mdc-data-table__cell">Minor</td>
                            <td class="mdc-data-table__cell">Not triaged</td>
                            <td class="mdc-data-table__cell mdc-data-table__cell--numeric">0:33</td>
                            <td class="mdc-data-table__cell">Jeremy Lake</td>
                        </tr>
                        <tr data-row-id="u3" class="mdc-data-table__row">
                            <td class="mdc-data-table__cell mdc-data-table__cell--checkbox">
                                <div class="mdc-checkbox mdc-data-table__row-checkbox">
                                    <input type="checkbox" class="mdc-checkbox__native-control" aria-labelledby="u3"/>
                                    <div class="mdc-checkbox__background">
                                        <svg class="mdc-checkbox__checkmark" viewbox="0 0 24 24">
                                            <path class="mdc-checkbox__checkmark-path" fill="none" d="M1.73,12.91 8.1,19.28 22.79,4.59" />
                                        </svg>
                                        <div class="mdc-checkbox__mixedmark"></div>
                                    </div>
                                </div>
                            </td>
                            <td class="mdc-data-table__cell">Online</td>
                            <td class="mdc-data-table__cell" id="u3">Arcus watch slowdown</td>
                            <td class="mdc-data-table__cell">Negligible</td>
                            <td class="mdc-data-table__cell">Triaged</td>
                            <td class="mdc-data-table__cell mdc-data-table__cell--numeric">0:33</td>
                            <td class="mdc-data-table__cell">Angelina Cheng</td>
                        </tr>
                    </tbody>
                </table>
            </div>






        </main>
    </div>

    <style>



          #main-content {
            padding: 2.5em;
        }
        
        .mdc-data-table {
            width: 100%;
            margin-top: 2em;
        }




    </style>

</body>

</html>
