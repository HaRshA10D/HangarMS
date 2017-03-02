<%-- 
    Document   : overlap
    Created on : Jul 14, 2016, 9:48:25 PM
    Author     : HaRshA CriMiNaLhEarT
--%>

<%@page import="reqfiles.Utilities"%>
<%@page import="reqfiles.insertBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    insertBean bean = (insertBean) session.getAttribute("bean");
    if(bean==null)
        response.sendRedirect("newlog.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your record overlaps!!</title>
    </head>
    <body>
        <%
            Utilities util = new Utilities();
            String str = util.checkSession(session);
            if(str.length()!=0){
                response.sendRedirect("str");
            }
            if(!(session.getAttribute("usertype").equals("admin"))){
                    response.sendRedirect("reports.jsp");
                }
        %>
        <h3>Your record has been overlapping</h3>
        <p>registration no: <%=bean.getregistrationID()%></p>
        <p>customer: <%=bean.getcustomer()%></p>
        <p>Induction date: <%=bean.getdate()%></p>
        <p>TAT: <%=bean.gettat()%></p>
        <form method="post" action="forcedNewlog">
            <input type="hidden" value="<%=bean.getregistrationID()%>" name="aircraft_reg">
            <input type="hidden" value="<%=bean.getLine()%>" name="line">
            <input type="hidden" value="<%=bean.getcustomer()%>" name="customer">
            <input type="hidden" value="<%=bean.getmodel()%>" name="model">
            <input type="hidden" value="<%=bean.getcheck()%>" name="check">
            <input type="hidden" value="<%=bean.getdate()%>" name="date">
            <input type="hidden" value="<%=bean.gettat()%>" name="tat">
            <input type="hidden" value="<%=bean.getses()%>" name="ses">
            <input type="hidden" value="<%=bean.getStatus()%>" name="status">
        <button>Insert Forcedly</button>
        </form>
        <a href="newlog.jsp"><button>Go Back</button></a>
    </body>
</html>
