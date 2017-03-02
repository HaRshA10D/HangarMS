<%-- 
    Document   : modigy
    Created on : Jun 22, 2016, 12:24:45 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="reqfiles.Utilities"%>
<%@page import="java.util.Calendar"%>
<%@include file="dateArray.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  String strl = request.getParameter("air_reg");
  String udate = request.getParameter("date");
  String umonth = request.getParameter("month");
  String uyear = request.getParameter("year");
  String total = uyear+"-"+umonth+"-"+udate;
  Utilities util1 = new Utilities();
  ResultSet rs = util1.retriveModify(strl,total);
  ResultSet rs1 = util1.giveall(2);
  ResultSet rs2 = util1.giveall(3);
  ResultSet rs3 = util1.giveall(4);
%>
<html>
    <head onload="">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal: Modify Log</title>
        <link type="text/css" rel="stylesheet" href="modify.css"/>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <link type="text/css" rel="stylesheet" href="NavigationBar.css"/>
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <script type="text/javascript">
            function selectDropdownValue(dropdownName, value){
    var dropdown = document.getElementById(dropdownName);
    if(dropdown){
        var options = dropdown.options;
        for (var i=0; i<options.length;i ++) {
            var opt = options[i];
            if(opt.value && value == opt.value)
            {
                opt.selected = true;
                break;
            }
        }
    }
}
        </script>
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
            <%if(rs.next()){%>
            <div class="w3-container w3-green"><h2>Modify Record's feilds</h2></div>
            <form class="w3-container" method="post" action="modify">
                <input type="hidden" value="<%=rs.getInt(1)%>" name="id"/>
                <input type="hidden" value="<%=user%>" name="ses"/>
                <label class="w3-label w3-text-teal">Registration ID</label>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" type="text" name="Aircraft_reg" value="<%=rs.getString(2)%>"/>
                <label class="w3-label w3-text-teal">Line</label><br/>
                <select style="width: 40%" class="w3-select" name="line" id="line">
                    <option value="1" >1</option>
                    <option value="2" >2</option>
                    <option value="3" >3</option>
                    <option value="4" >4</option>
                    <option value="5" >5</option>
                </select><br/>
                <label class="w3-label w3-text-teal">Customer</label><br/>
                <select style="width: 40%" class="w3-select" name="customer" id="customer">
                    <%while(rs1.next()){%>
                            <option value="<%=rs1.getString(1)%>" ><%=rs1.getString(1)%></option>
                    <%}%>
                </select><br/>
                <label class="w3-label w3-text-teal">Aircraft Model</label><br/>
                <select style="width: 40%" class="w3-select" name="model" id="model">
                    <%while(rs2.next()){%>
                    <option value="<%=rs2.getString(1)%>" ><%=rs2.getString(1)%></option>
                    <%}%>
                </select><br/>
                <label class="w3-label w3-text-teal">Check Type</label><br/>
                <select style="width: 40%" class="w3-select" name="check" id="check">
                    <%while(rs3.next()){%>
                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                    <%}%>
                </select><br/>
                <label class="w3-label w3-text-teal">Induction Date</label><br/>
                <span style="padding-top: 20px;"><%@include file="dateTemplate.jsp" %><br/></span>
                <label class="w3-label w3-text-teal">Turnaround time</label><br/>
                <input style="width: 40%" class="w3-input w3-border w3-light-grey" name="tat" value="<%=rs.getInt(8)%>" type="number"/>
                <label class="w3-label w3-text-teal">Status</label><br/>
                <select style="width: 40%" class="w3-select" name="status" id="status">
                    <option value="planing">Planing</option>
                    <option value="confirm">Confirm</option>
                </select><br/>
                <button style="padding: 5px;margin-top: 10px" class="w3-btn w3-blue-grey">Modify</button>
        </form>
        <script type="text/javascript">
    selectDropdownValue("line","<%=rs.getInt(3)%>");
    selectDropdownValue("check","<%=rs.getString(6)%>");
    selectDropdownValue("customer","<%=rs.getString(4)%>");
    selectDropdownValue("model","<%=rs.getString(5)%>");
    selectDropdownValue("date","<%=rs.getInt(7)%>");
    selectDropdownValue("month","<%=rs.getString(9)%>");
    selectDropdownValue("year","<%=rs.getInt(10)%>");
    selectDropdownValue("status","<%=rs.getString(11)%>")
    </script>
                <%}else{%>
                <div class="w3-container w3-red w3-center"><h1>Wrong Reference</h1></div>
                <%}%>
        </div>
    </body>
</html>
