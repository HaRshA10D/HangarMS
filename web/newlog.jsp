<%--
    Document   : newlog
    Created on : Jun 8, 2016, 11:53:59 AM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String url="";
    url=request.getParameter("url");
    System.out.println(url);
    Utilities util1 = new Utilities();
    ResultSet rs1 = util1.giveall(2);
    ResultSet rs2 = util1.giveall(3);
    ResultSet rs3 = util1.giveall(4);
%>
<%@include file="dateArray.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal: New Log</title>
        <link type="text/css" rel="stylesheet" href="newlog.css"/>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <script type="text/javascript" src="blockBack.js"></script>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        
    </head>
    <body>
        <% Utilities util =new Utilities();
           String str = util.checkSession(session);
           if(str.length()!=0)
               response.sendRedirect(str);
           String user =(String)session.getAttribute("username");
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
        <div id="div2">
            <div class="w3-card-4" >
            <div class="w3-container w3-deep-purple"><h2>Registration details</h2></div>
            <form class="w3-container" method="post" action="newlog" style="padding: 20px">
                <label class="w3-label w3-text-teal">Aircraft Registration ID</label>
                <input style="width: 40%" type="text" name="aircraft_reg" required class="w3-input w3-border w3-light-grey"/>
                <label class="w3-label w3-text-teal">Line</label><br/>
                <select style="width: 40%" class="w3-select" name="line" required>
                    <option value="1">Line 1A</option>
                    <option value="2">Line 1B</option>
                    <option value="3">Line 2A</option>
                    <option value="4">Line 2B</option>
                    <option value="5">Line 3(painting)</option>
                </select><br/>
                <label class="w3-label w3-text-teal">customer</label><br/>
                <select style="width: 40%" class="w3-select" name="customer" required>
                    <%while(rs1.next()){%>
                    <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                    <%}%>
                </select><br/>
                <label class="w3-label w3-text-teal">Aircraft Model</label><br/>
                <select style="width: 40%" class="w3-select" name="model" required>
                    <%while(rs2.next()){%>
                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
                    <%}%>
                </select><br/>
                <label class="w3-label w3-text-teal">Check Type</label><br/>
                <select style="width: 40%" class="w3-select" name="check" required>
                    <%while(rs3.next()){%>
                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                    <%}%>
                </select><br/>
                <span style="padding-top: 20px;"><%@include file="dateTemplate.jsp" %><br/></span>
                <label class="w3-label w3-text-teal">Turnaround Time</label><br/>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="number" name="tat" required/><br/>
                <input class="w3-radio" type="radio" name="status" value="confirm" checked><label class="w3-validate">confirmed</label>
                <input class="w3-radio" type="radio" name="status" value="planning"><label class="w3-validate">planing</label><br/>
                <input type="hidden" value="<%=user%>" name="ses">
                <button class="w3-btn w3-blue-grey" style="padding: 5px;margin-top: 10px">Complete Registration</button><br/>
                </form>
                <%if(url==null){}else if("".equals(url)){}else{%> 
                    <%=url%>
                <%} System.out.println(user);%>
        </div>
        </div>
    </body>
</html>
