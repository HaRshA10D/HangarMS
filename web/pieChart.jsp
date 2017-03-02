<%-- 
    Document   : pieChart
    Created on : Jun 20, 2016, 8:56:47 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="reqfiles.Utilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int occupied = Integer.parseInt((String)session.getAttribute("occupied"));
int free = Integer.parseInt((String)session.getAttribute("free"));

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PieChart Report</title>
        <script type="text/javascript" src="googleChartsApi.js"></script>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <script type="text/javascript">
            google.charts.load('current',{packages:['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart(){
                var data = new google.visualization.DataTable();
                data.addColumn('string','Status');
                data.addColumn('number','days');
                data.addRows([
                    ['Occupied Days',<%=occupied%>],
                    ['Free Days',<%=free%>]
                ]); 
                var options = {
                    'title':'Line Occupancy Chart',
                    'width':1200,
                    'height':950,
                    is3D:true
                 };

      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      google.visualization.events.addListener(chart, 'ready', function () {
        chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
        console.log(chart_div.innerHTML);
      });

      chart.draw(data, options);
            }
        </script>
        <link rel="shortcut icon" href="GMR_Logo.svg.png"/>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css"/>
    </head>
    <body>
        <% Utilities util =new Utilities();
           String str = util.checkSession(session);
           if(str.length()!=0)
               response.sendRedirect(str);
        %>
        <div id="chart_div" class="w3-container"></div>
        <a href="reports.jsp"><button class="w3-btn w3-teal w3-right">Go Back</button></a>
    </body>
</html>
