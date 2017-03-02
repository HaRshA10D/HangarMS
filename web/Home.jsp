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
        <title>Home: GMR Aerotechnic</title>
        <link rel="shortcut icon" href="GMR_Logo.svg.png" />
        <script type="text/javascript" src="blockBack.js"></script>
        <link type="text/css" rel="stylesheet" href="w3css.css"/>
        <meta name="veiwport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="home.css"/>
        <link type="text/css" rel="stylesheet" href="owl.carousel.css"/>
        <link type="text/css" rel="stylesheet" href="owl.theme.css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <style>
            body{
                font-family: Segoe UI;
            }
        .w3-ul a{
            text-decoration: none;
        }
        #slides .item img{
                display: block;
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <%  Utilities utils = new Utilities();
            String validate = utils.checkSession(session);
            %>
        <div class="w3-container w3-indigo">
            <h1 class="w3-left">GMR Aero Technic</h1>
            <img class="w3-white w3-right" src="GMR_AeroTechnic1.png" height="72px" style="padding: 5px 25px 5px;"/>
        </div>
        <div class="w3-container">
            <div class="owl-carousel" id="slides">
                <div class="item"><img src="Home_nbanner1.jpg"></div>
                <div class="item"><img src="Home_nbanner2.jpg"></div>
                <div class="item"><img src="Home_nbanner3.jpg"></div>
                <div class="item"><img src="Home_nbanner4.jpg"></div>
                <div class="item"><img src="Home_nbanner5.jpg"></div>
            </div>
        </div>
        
        <div class="w3-row w3-padding-4">
        <div class="w3-half w3-container">
            <article id="w3-container">
            <h1>Welcome to GMR Aero Technic</h1>
        </article><hr/>
        <article id="w3-container">
            <h2>MRO</h2>
            <p>GMR Aerospace Engineering Company Ltd., located in the 250 acre GMR Aerospace Park SEZ, 
                offers base maintenance services starting with C-checks for narrow bodied aircraft like Airbus A 320 
                and Boeing 737 including the B-737 Classic and B-737 next generation aircraft.
                Saving precious foreign exchange and aircraft downtime for airline companies.
                Recently,  GMR Aerotech (MGAT), the MRO  provider  at RGIA has opened a line maintenance 
                facility at the airport to provide comprehensive and cost-effective services to 
                our airline partners initially at HYD and moving forward India wide</p>
        </article>
        </div>
        <div class="w3-half">
        <div class="w3-container w3-white">
        <%
                if(validate.length()>0){
        %>
        <div class="w3-card-0 w3-border" style="margin-bottom: 20px;height: 250px">
        <div class="w3-container w3-indigo">
        <h2>Login to portal</h2>
        </div>
            <form class="w3-container" method="post" action="login">
                <label class="w3-label w3-text-teal">User Name</label>
                <input class="w3-input w3-border w3-light-grey" type="text" name="u_name" required>
                <label class="w3-label w3-text-teal">Password</label>
                <input class="w3-input w3-border w3-light-grey" type="password" name="u_password" required>
                <p><button class="w3-btn w3-blue-grey">LOGIN</button></p>
            </form>
        </div>
            <%}
            else{%>
            <div class="w3-border">
                <div class="w3-container w3-indigo">
                    <h2>Logout</h2>
                </div>
                <form class="w3-container" method="post" action="logout">
                    <button class="w3-btn w3-blue-grey" style="margin: 10px;">LOGOUT</button>
                </form>
            <%}%>
        </div>
        </div>
        </div>
        </div>
        <%if(validate.length()>0){}else{%>
        <div class="w3-card-2" >
        <ul class="w3-ul w3-hoverable" style="text-align: center;margin: 40px;">
            <a href="reports.jsp"><li class="w3-padding-8">Reports</li></a>
            <a href="downloads.jsp"><li class="w3-padding-8">Downloads</li></a>
            <%if(session.getAttribute("usertype").equals("admin")){%>
            <a href="portal.jsp"><li class="w3-padding-8">Portal</li></a>
            <%}%>
        </ul>
        </div>
        <%}%>
        <script type="text/javascript" src="jquery.js"></script>
        <script src="owl.carousel.js"></script>
        <script>
    $(document).ready(function() {
      $("#slides").owlCarousel({
autoPlay: 3000, //Set AutoPlay to 3 seconds
 
      items : 2,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
      });
    });
    </script>
    </body>
</html>
