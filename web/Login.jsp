<%-- 
    Document   : login
    Created on : Jun 6, 2016, 12:20:03 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String retmsg ="";
retmsg =request.getParameter("msg"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login portal</title>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <link type="text/css" rel="stylesheet" href="login.css" />
        <script type="text/javascript" src="blockBack.js"></script>
    </head>
    <body>
        <div id="div1">
        <ul class="menulist">
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="downloads.jsp">Downloads</a></li>
            <li><a href="portal.jsp">Portal</a></li>
        </ul>
        </div>
        <div id="div2">
            <%
                Utilities utils = new Utilities();
                String validate = utils.checkSession(session);
                if(validate.length()>0){
            %>
            <form action="login" method="post" class="form2">
                <fieldset>
                  <legend align="center">LOGIN PORTAL</legend><br/>
                  <input type="text" name="u_name" placeholder="User Name" class="inputs">
                  <input type="password" name="u_password" placeholder="Password" class="inputs"><br/><br/>
                  <input class="button" type="submit" value="LOG IN">
                  <%if(retmsg!=null){%>
                  <p text-align="center"><%=retmsg%></p>
                  <%}%>
                </fieldset>
            </form>
                <%}
                else{%>
                <form method="post" action="logout" class="form2">
                    <fieldset>
                        <legend align="center">LOGOUT PORTAL</legend><br/><br/>
                        <input class="button" type="submit" value="LOGOUT">
                    </fieldset>
                </form>
                <%}%>
        </div>
    </body>
</html>
