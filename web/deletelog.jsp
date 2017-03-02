<%-- 
    Document   : deletelog
    Created on : Jun 9, 2016, 11:33:07 AM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
        String aircraft_reg = request.getParameter("air_reg");
        String udate = request.getParameter("date");
        String umonth = request.getParameter("month");
        String uyear = request.getParameter("year");
        String total = uyear+"-"+umonth+"-"+udate;
        Utilities utils = new Utilities();
        ResultSet rs = utils.retriveData(aircraft_reg,total);
        String status = "";
        status = request.getParameter("status");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        <title>Portal: Delete log</title>
        <link type="text/css" rel="stylesheet" href="deletelog.css"/>
        <script type="text/javascript" src="blockBack.js"></script>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
    </head>
    <body>
        <% Utilities util =new Utilities();
           String str = util.checkSession(session);
           if(str.length()!=0)
               response.sendRedirect(str);
               String user = (String)session.getAttribute("username");
               if(!(session.getAttribute("usertype").equals("admin"))){
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
            <%if(!rs.next()){%>
            <div class="w3-container w3-red w3-center"><h1>Wrong Reference</h1></div>
            <%}else{%>
            <div class="w3-container w3-red">
                <h2>Details of Record</h2>
            </div>
            <form class="w3-container" method="post" action="delete">
                <input type="hidden" name="aircraft_reg" value="<%=aircraft_reg%>" /> 
                <input type="hidden" name="idate" value="<%=total%>" />
                <input type="hidden" value="<%=user%>" name="ses" />
                <label class="w3-label w3-text-teal">Aircraft Registration</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getString(2)%>" readonly/>
                <label class="w3-label w3-text-teal">Line</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getInt(3)%>" readonly/>
                <label class="w3-label w3-text-teal">Customer</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getString(4)%>" readonly/>
                <label class="w3-label w3-text-teal">Aircraft model</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getString(5)%>" readonly/>
                <label class="w3-label w3-text-teal">Check Type</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getString(6)%>" readonly/>
                <label class="w3-label w3-text-teal">Induction Date</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getDate(7)%>" readonly/>
                <label class="w3-label w3-text-teal">Turnaround Time</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getInt(8)%>" readonly/>
                <label class="w3-label w3-text-teal">End Date</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getDate(9)%>" readonly/>
                <label class="w3-label w3-text-teal">Status</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" value="<%=rs.getString(11)%>" readonly/><br/>
                <button class="w3-btn w3-blue-grey">Delete</button><br/>
                <h6>This Record will be Deleted</h6>
            </form>
                <%}%>
        </div>
    </body>
</html>
