<%-- 
    Document   : gantt
    Created on : Jun 13, 2016, 10:27:21 AM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="reqfiles.Utilities"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Utilities utils = new Utilities();
    ResultSet rs = utils.giveall(2);
%>
<!doctype html>
<html>
    <head>
        <script src="anygantt.min.js"></script>
        <script src="anychart-ui.min.js"></script>
        <link rel="stylesheet" href="anychart-ui.min.css" />
        <link rel="stylesheet" href="NavigationBar.css" />
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <script src="anygantt.offline.js"></script>
        <link rel="stylesheet" type="text/css" href="w3css.css"/>
        
        <title>Hangar Availability Forecast</title>
        <style>
         html, body, #container {
             width: 100%;
             height: 97.3%;
             margin: 0;
             padding: 0;
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
        <div id="container" class="w3-container">
        </div>
            
        <div class="w3-container" style="position: fixed;top: 650px">
            <%while(rs.next()){%>
            <div class="w3-card-2" style="height: 50px;width: 120px;float: left">
                <header class="w3-container w3-white"><h6><%=rs.getString(1)%></h6></header>
                <footer class="w3-container" style="background-color: <%=rs.getString(2)%>;height: 30px;width: 100%"></footer>
            </div>
            <%}%> 
        </div>
            
            <a href="reports.jsp"><button class="w3-btn w3-teal w3-right" style="margin-top: 30px">Go Back</button></a>
            <button class="w3-btn w3-teal w3-right" onclick="window.print()" style="margin-top: 30px">Print</button>
        <script type="text/javascript">
         anychart.onDocumentReady(function () {
    // create data tree on our data
    var treeData = anychart.data.tree(getData(), anychart.enums.TreeFillingMethod.AS_TABLE);
    
    
    // create resource gantt chart
    chart = anychart.ganttResource();
    chart.headerHeight(110);
    var toolbar = anychart.ui.ganttToolbar();
    //chart.rowsHeight(150);
    // Set container.
    toolbar.container("container");

    toolbar.target(chart);
    toolbar.printPaperSizes(["usletter", "a0", "a0", "a1", "a2", "a3", "a4", "a5", "a6"]);
    toolbar.draw();
    // set container id for the chart
    chart.container('container');

    // set data for the chart
    chart.data(treeData);

    //set DataGrid and TimeLine visual settings
    chart.dataGrid().rowOddFill('#fff');
    chart.dataGrid().rowEvenFill('#fff');
    chart.getTimeline().rowOddFill('#fff');
    chart.getTimeline().rowEvenFill('#fff');
    chart.rowSelectedFill('#D4DFE8');
    chart.rowHoverFill('#EAEFF3');
    // set start splitter position settings
    chart.splitterPosition(123);
    
    // get chart data grid link to set column settings
    var dataGrid = chart.dataGrid();

    // set first column settings
    var firstColumn = dataGrid.column(0);
    firstColumn.title('#');
    firstColumn.width(30);
    firstColumn.cellTextSettings().hAlign('center');

    // set second column settings
    var secondColumn = dataGrid.column(1);
    secondColumn.title('Production line');
    secondColumn.width(90);
    secondColumn.cellTextSettings().hAlign('left');
    secondColumn.textFormatter(function (item) {
return item.get('name');
    });
    
    

    // getting chart's timeline
    var timeline = chart.getTimeline();

    // getting timeline's tooltip
    var tlTooltip = timeline.tooltip();

    tlTooltip.titleFormatter(function() {
return this['name'];
    });

    tlTooltip.textFormatter(function() {
var hoveredPeriod = this['period'];

if (hoveredPeriod) {
    var hoveredPeriodIndex = this['periodIndex'] + 1;

    var cust = hoveredPeriod['customer'];
    
    var reg = hoveredPeriod['reg'];
    
    var model = hoveredPeriod['model'];

    var fromDate = hoveredPeriod['start'];
    
    var toDate = hoveredPeriod['end'];
    
    var tat = hoveredPeriod['tat'];
    
    return  cust+'\nA_Reg:'+reg+'\nModel:'+model+'\nStarting Date:'+fromDate+'\nTat:'+tat+'\nEnding Date:'+toDate ;
} else {
    return '-';
}

    });
    
    // initiate chart drawing
    chart.draw();
    chart.fitAll();
    chart.zoomTo(<%=(String)session.getAttribute("inDate")%>,<%=(String)session.getAttribute("outDate")%>);
});

function getData() {
    var json = '<%=session.getAttribute("jso")%>';
    var obj = JSON.parse(json);
    return obj;
}
function printdiv(printdivname)
{
var headstr = "<html><head><title>Booking Details</title></head><body>";
var footstr = "</body>";
var newstr = document.getElementById(printdivname).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print();
document.body.innerHTML = oldstr;
return false;
}
        </script>    
    </body>
</html>

