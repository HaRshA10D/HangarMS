<%-- 
    Document   : portal
    Created on : Jun 7, 2016, 2:23:47 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="reqfiles.Utilities" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String retmsg ="";
String comp = "";
comp = request.getParameter("comp");
retmsg = request.getParameter("url");
String modi = "";
modi = request.getParameter("modi");
String model = "";
model = request.getParameter("model");
String newcheck = "";
newcheck = request.getParameter("check");
String delcomp = "";
delcomp = request.getParameter("delcomp");
String delcheck = "";
delcheck = request.getParameter("delcheck");
String delmodel = "";
delcomp = request.getParameter("delmodel");
%>
<%@include file="dateArray.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal</title>
        <link type="text/css" rel="stylesheet" href="portal.css" />
        <script type="text/javascript" src="blockBack.js"></script>
        <link rel="shortcut icon" href="GMR_Logo.svg.png"/>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <script src="jquery-3.1.1.min.js"></script>
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        <script>
        </script>
    </head>
    <body>
        <%
           Utilities utils = new Utilities();
           String check = utils.checkSession(session);
           if(check.length()!=0)
               response.sendRedirect(check);
           
                if(!(session.getAttribute("usertype").equals("admin"))){
                    response.sendRedirect("reports.jsp");
                }
        %>
        <div id="div1">
        <ul class="menulist">
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a  href="downloads.jsp">Downloads</a></li>
            <li><a class="active" href="#">Portal</a></li>
            <img class="w3-white w3-right" src="GMR_AeroTechnic1.png" height="60px" style="padding: 5px 25px 5px;"/>
        </ul>
        </div>
        <div id="banner" class="w3-container w3-deep-orange w3-border">
                <h1>Hangar Management portal!</h1>
                <p>Create . Manage. Delete logs</p> 
            </div>
            <div id="content">
                <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Check for Free Slots</h2></div>
                <form class="w3-container w3-margin" action="check" method="post">
                    <label class="w3-label w3-text-teal"><b>Turnaround Time</b></label>
                    <input class="w3-input w3-border w3-light-grey" type="number" name="tat" min="1" required/><br/>
                    <%@include file="dateTemplate.jsp" %><br/>
                    <p><button class="w3-btn w3-blue-grey">Check</button></p>
                    <%if(retmsg == null){}else if("".equals(retmsg)){%>
                    <p>No hangar available</p><br/>
                    <%}else{%>
                    <p>Line: <%=retmsg%> are available</p><br/>
                    <%}%>
                </form>
                </div>
            </div>
                <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>New Slot</h2></div>
                <form class="w3-container w3-margin" method="post" action="newlog.jsp">
                    <p><button type="submit" class="w3-btn w3-blue-grey">New Record</button></p>
                </form>
            </div>
                </div>
                </div>
                <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Delete a Slot</h2></div>
                <form class="w3-container w3-margin" action="deletelog.jsp" method="post">
                    <label class="w3-label w3-text-teal"><b>Registration ID</b></label>
                    <input class="w3-input w3-border w3-light-grey" type="text" name="air_reg" required/><br/>
                    <%@include file="dateTemplate.jsp" %><br/>
                    <p><button class="w3-btn w3-blue-grey">Delete</button></p>
                </form>
            </div>
            </div>
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Modify a Slot</h2></div>
                <form class="w3-container w3-margin" method="post" action="modify.jsp">
                    <label class="w3-label w3-text-teal"><b>Registration ID</b></label>
                    <input class="w3-input w3-border w3-light-grey" type="text" name="air_reg" required/><br/>
                    <%@include file="dateTemplate.jsp" %><br/>
                    <p><button class="w3-btn w3-blue-grey">Modify</button></p>
                    <%if(modi== null){}else if("".equals(modi)){}else{%><p><%=modi%></p><%}%>
                </form>
            </div>
            </div>
                </div>
                <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Register new company</h2></div>
                <form class="w3-container w3-margin" method="post" action="newCompany">
                    <label class="w3-label w3-text-teal"><b>Company name</b></label>
                    <input type="text" class="w3-input w3-border w3-light-grey" name="company" required/>
                    <label class="w3-label w3-text-teal"><b>Hexadecimal color value</b> (Ex. #FFFFFF)</label>
                    <input type="text" class="w3-input w3-border w3-light-grey" name="color" required/><br/>
                    <button class="w3-btn w3-blue-grey" >Register Company</button>
                    <%if(comp== null){}else if("".equals(comp)){}else{%><p><%=comp%></p><%}%>
                </form>
            </div>
            </div>
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Remove a company</h2></div>   
                <form class="w3-container w3-margin" method="post" action="deleteCompany">
                    <label class="w3-label w3-text-teal"><b>Company name</b></label>
                    <select class="w3-select" id="select-company" name="company">
                        <option value="" selected>---select---</option>
                        <%  ResultSet company_list = utils.giveall(2);
                            while(company_list.next()){%>
                        <option value="<%=company_list.getString(1)%>"><%=company_list.getString(1)%></option>
                        <%}%>
                    </select>
                    <p><button class="w3-btn w3-blue-grey">Remove</button></p>
                    <%if(delcomp== null){}else if("".equals(delcomp)){}else{%><p><%=delcomp%></p><%}%>
                </form>
            </div>
            </div>
                </div>
                <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>New Model</h2></div>   
                <form class="w3-container w3-margin" method="post" action="newModel">
                    <label class="w3-label w3-text-teal"><b>Aircraft Model</b></label>
                    <input type="text" class="w3-input w3-border w3-light-grey"name="model" required/>
                    <p><button class="w3-btn w3-blue-grey">Insert New Model</button></p>
                    <%if(model== null){}else if("".equals(model)){}else{%><p><%=model%></p><%}%>
                </form>
            </div>
            </div>
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Remove a model</h2></div>   
                <form class="w3-container w3-margin" method="post" action="deleteModel">
                    <label class="w3-label w3-text-teal"><b>Model name</b></label>
                    <select class="w3-select" id="select-model" name="model">
                        <option value="" selected>---select---</option>
                        <%  ResultSet model_list = utils.giveall(3);
                            while(model_list.next()){%>
                        <option value="<%=model_list.getString(1)%>"><%=model_list.getString(1)%></option>
                        <%}%>
                    </select>
                    <p><button class="w3-btn w3-blue-grey">Remove</button></p>
                    <%if(delmodel== null){}else if("".equals(delmodel)){}else{%><p><%=delmodel%></p><%}%>
                </form>
            </div>
            </div>
                </div>
                <div class="w3-row">
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Add check type</h2></div>   
                <form class="w3-container w3-margin" method="post" action="newCheck">
                    <label class="w3-label w3-text-teal"><b>Check name</b></label>
                    <input type="text" class="w3-input w3-border w3-light-grey" name="check" required/>
                    <p><button class="w3-btn w3-blue-grey">Insert Check type</button></p>
                    <%if(newcheck== null){}else if("".equals(newcheck)){}else{%><p><%=newcheck%></p><%}%>
                </form>
            </div>
            </div>
            <div class=" w3-half">
                <div class="w3-border w3-white w3-margin" style="height: 300px">
                <div class="w3-container w3-indigo"><h2>Delete check type</h2></div>   
                <form class="w3-container w3-margin" method="post" action="deleteCheck">
                    <label class="w3-label w3-text-teal"><b>Check name</b></label>
                    <select class="w3-select" id="select-model" name="check">
                        <option value="" selected>---select---</option>
                        <%  ResultSet checks_list = utils.giveall(4);
                            while(checks_list.next()){%>
                        <option value="<%=checks_list.getString(1)%>"><%=checks_list.getString(1)%></option>
                        <%}%>
                    </select>
                    <p><button class="w3-btn w3-blue-grey">Remove</button></p>
                    <%if(delcheck== null){}else if("".equals(delcheck)){}else{%><p><%=delcheck%></p><%}%>
                </form>
            </div>
            </div>
                </div>
            <div class="w3-border w3-white w3-margin">
                <div class="w3-container w3-indigo"><h2>History</h2></div>
                <form class="w3-container w3-margin" method="post" action="History.jsp">
                    <p><button class="w3-btn w3-blue-grey">Show History</button></p>
                </form>
            </div>
            </div>
    </body>
</html>
