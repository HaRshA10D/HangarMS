<%-- 
    Document   : login
    Created on : Jun 6, 2016, 12:20:03 PM
    Author     : HaRshA CriMiNaLhEarT
--%>
<%@page import="java.util.Calendar"%>
<%@page import="reqfiles.Utilities" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="dateArray.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HSM: Reports</title>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <link type="text/css" rel="stylesheet" href="availability.css"/>
        <script type="text/javascript" src="blockBack.js"></script>
    </head>
    <body>
        <% Utilities util =new Utilities();
           String str = util.checkSession(session);
           if(str.length()!=0){
                response.sendRedirect(str);
           }
           String user = (String)session.getAttribute("username");
        %>
        <div id="div1">
        <ul class="menulist">
            <li><a href="Home.jsp">Home</a></li>
            <li><a class="active" href="#">Reports</a></li>
            <li><a href="downloads.jsp">Downloads</a></li>
            <%if(session.getAttribute("usertype").equals("admin")){%>
            <li><a href="portal.jsp">Portal</a></li>
            <%}%>
        </ul>
        </div>
        <div id="div2">
            <div class="w3-container w3-center w3-orange w3-text-white w3-border">
                <h1>HANGAR REPORTS</h1>
            </div>
            <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-margin" style="height: 330px">
                <div class="w3-container w3-indigo">
                    <h2>GANTT CHART REPORT</h2>
                </div>
                <form class="w3-container w3-margin" method="post" action="anyGantt">
                    <label class="w3-label w3-text-teal"><b>Starting Date</b></label><br/>
                    <%@include file="dateTemplate.jsp" %><br/>
                    <label class="w3-label w3-text-teal"><b>Ending Date</b></label><br/>
                    <%@include file="dateTemplate2.jsp" %><br/>
                    <p><button class="w3-btn w3-blue-grey">View Gantt</button></p>
                </form>
                </div>
            </div>
                <div class="w3-half" >
                    <div class="w3-border w3-margin" style="height: 330px">
                <div class="w3-container w3-indigo">
                    <h2>OCCUPANCY PIE CHART REPORT</h2>
                </div>
                <form class="w3-container w3-margin" method="post" action="pieChart">
                    <label class="w3-label w3-text-teal"><b>Starting Date</b></label><br/>
                    <%@include file="dateTemplate.jsp" %><br/>
                    <label class="w3-label w3-text-teal"><b>Ending Date</b></label><br/>
                    <%@include file="dateTemplate2.jsp" %><br/>
                    <label class="w3-label w3-text-teal">Line</label>
                    <select class="w3-select" name="line">
                        <option value="1">Line 1A</option>
                        <option value="2">Line 1B</option>
                        <option value="3">Line 2A</option>
                        <option value="4">Line 2B</option>
                        <option value="5">Line 3(painting)</option>
                    </select><br/>
                    <p><button class="w3-btn w3-blue-grey">View Pie Chart</button></p>
                </form>
                    </div>
            </div>  
        </div>
                            
    </body>
</html>
