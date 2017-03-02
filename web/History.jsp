<%-- 
    Document   : History
    Created on : Jun 21, 2016, 12:35:21 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  Utilities utils = new Utilities();
    ResultSet rs = utils.giveall(0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <link rel="shortcut icon" href="GMR_Logo.svg.png"/>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css"/>
        <link rel="stylesheet" type="text/css" href="History.css"/>
        <link rel="stylesheet" type="text/css" href="w3css.css"/>
        <style>
            td,th{
                border: 1px solid #000;
            }
        </style>
    </head>
    <body>
        <%
           String check = utils.checkSession(session);
           if(check.length()!=0)
               response.sendRedirect(check);
           else if(!(session.getAttribute("usertype").equals("admin"))){
                    response.sendRedirect("reports.jsp");
                }
        %>
        <div id="div1">
        <ul class="menulist">
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="downloads.jsp">Downloads</a></li>
            <li><a href="portal.jsp">Portal</a></li>
        </ul>
        </div>
        <div id="div2">
            <div class=" w3-container w3-amber">
                <h1 class="w3-text-white">History</h1>
            </div>
            <table class="w3-table w3-striped" style="height: 450px;overflow: auto;overflow-style: panner;display: block;">
                <thead>
                    <tr class="w3-red">
                <th>Index</th>
                <th>Aircraft registration</th>
                <th>Line</th>
                <th>Customer</th>
                <th>Aircraft model</th>
                <th>Check type</th>
                <th>Induction Date</th>
                <th>TAT</th>
                <th>End Date</th>
                <th>Status</th>
                <th>operation</th>
                <th>session</th>
                <th>Time</th>
                </tr>
                </thead>
                <tbody>
                <%while(rs.next()){%>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getDate(7)%></td>
                    <td><%=rs.getInt(8)%></td>
                    <td><%=rs.getDate(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                    <td><%=rs.getString(12)%></td>
                    <td><%=rs.getString(13)%></td>
                </tr>  
                <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
