<%-- 
    Document   : login
    Created on : Jun 6, 2016, 12:20:03 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  Utilities utils = new Utilities();
    ResultSet rs = utils.giveall(1);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exports</title>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <script type="text/javascript" src="blockBack.js"></script>
        <link type="text/css" href="downloads.css" rel="stylesheet" />
        <link type="text/css" href="w3css.css" rel="stylesheet" />
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <style>
            td,th{
                border: 1px solid #000;
            }
        </style>
    </head>
    <body>
        <% Utilities util =new Utilities();
           String str = util.checkSession(session);
           if(str.length()!=0)
               response.sendRedirect(str);
               String user = (String)session.getAttribute("username");
        %>
        <div id="div1">
        <ul class="menulist">
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a class="active" href="#">Downloads</a></li>
            <%if(session.getAttribute("usertype").equals("admin")){%>
            <li><a href="portal.jsp">Portal</a></li>
            <%}%>
        </ul>
        </div>
        <div id="div2">
            <div class="w3-container w3-deep-purple">
                <h1>All Records</h1>
            </div>
            <table class="w3-table w3-striped" style="height: 450px;width: 100%;overflow:auto;display: block">
                <tr class="w3-orange w3-text-white">
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
                </tr>
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
                    <td><%=rs.getString(11)%></td>
                </tr>  
                <%}%>
            </table>
            <form action="xlsxexport" method="get">
                <p><button class="w3-btn w3-blue-grey">Export as XLS</button></p> 
            </form>
        </div>
    </body>
</html>
