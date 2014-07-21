<%--
  Created by IntelliJ IDEA.
  User: prasad
  Date: 6/4/14
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>QBTMS - Manage your valuable time</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/anytime.css" />
    <link rel="stylesheet" href="css/jquery-ui.css">
    <script src="js/jquery.js"></script>
    <script src="js/anytime.js"></script>
    <script src="js/jquery-ui.js"></script>

    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">--%>
    <%--<script src="js/jquery-1.10.2.js"></script>--%>
    <%--<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>--%>


<%--<script type="text/javascript" language="javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>--%>
    <script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>

    <!-- Add custom CSS here -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <style>
        Table.GridOne {
            padding: 3px;
            margin: 0;
            background: lightyellow;
            border-collapse: collapse;
            width:35%;
        }
        Table.GridOne Td {
            padding:2px;
            border: 1px solid #ff9900;
            border-collapse: collapse;
        }

        #dvCities { list-style-type: none; margin: 0; padding: 0; width: 80%; height: auto }
        #dvCities li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; }
        #dvCities li span { position: absolute; margin-left: -1.3em; }
    </style>
    <%--<script>--%>

            <%--$.getJSON( "http://localhost:8080/mvccrud/add-task.html", function( data ) {--%>
                    <%--var items = [];--%>
<%--//                $('#result').html(data.getItem("userName").toString);--%>
<%--//                $('#result').html(data.second);--%>
<%--//                for (var i = 0; i < data.length; i++){--%>
<%--//                    $('#result').html(data[i].userName +" "+data[i].userTaskName+" "+data[i].userTaskDiscription+" "+data[i].startedDate+" "+data[i].toBeCompleted+"<br> ");--%>
<%--//                    $('tasktable').html('<tr><td>' + this.userName + '</td><td>'+this.userTaskDiscription+'</td><td>'+this.startedDate+'</td><td>'+this.toBeCompleted+'</td></tr>');--%>
<%--//                }--%>
<%--//                   var items = [];--%>
                <%--for (var i = 0; i < data.length; i++){--%>
                    <%--items.push( "<li id='" + data[i].userName + "' " + data[i].userTaskName + " " + data[i].userTaskDescription + "</li>" );--%>
                <%--}--%>

                <%--$( "<ul/>", {--%>
                    <%--"class": "my-new-list",--%>
                    <%--html: items.join( "" )--%>
                <%--}).appendTo( "body" );--%>


            <%--});--%>
    <%--</script>--%>

    <script>
        var listOfTask = [];
        jQuery.ajax({
            url: "http://localhost:8080/mvccrud/add-task.html",
            dataType:'json',
            success: function (response) {
                $("#dvCities").append("");
                $.each(response, function(){
                    $("#dvCities").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>"+ this.userTaskName + '-' + this.startedDate + '-' + this.toBeCompleted + '-' + this.completenessLevel +"</li>")
                });

                listOfTask = response;
            }
        });


        $(function() {
            $( "#dvCities" ).sortable();
            $( "#dvCities" ).disableSelection();
        });



    <%--Tab script--%>

        $(function() {
            $( "#myTab" ).tabs();
        });

        function madeAjaxCall(){
            $.ajax({
                type: "post",
                url: "addtask.html",
                cache: false,
                data:'userTaskName=' + $("#userTaskName").val() + "&userTaskDescription=" + $("#userTaskDescription").val() + "&startedDate=" + $("#startedDate").val() + "&toBeCompleted=" + $("toBeCompleted"),
                success: function(response){
                    $('#result').html("");
                    var obj = JSON.parse(response);
                    $('#result').html("First Name:- " + obj.userTaskName +"</br>Last Name:- " + obj.userTaskDescription+"</br>Last Name:- " + obj.startedDate);
                },
                error: function(){
                    alert('Error while request..');
                }
            });
        }

        $(function(){
            $('#result').html("First Name:- " + listOfTask.toString());
        });


    </script>
    <%--<script>--%>
        <%--$(function () {--%>
            <%--$('#myTab li:eq(1) a').tab('show');--%>
        <%--});--%>
    <%--</script>--%>

    <%--<script type="text/javascript">--%>
        <%--function madeAjaxCall(){--%>
            <%--$.ajax({--%>
                <%--type: "post",--%>
                <%--url: "addtask.html",--%>
                <%--cache: false,--%>
                <%--data:'firstName=' + $("#utn").val() + "&lastName=" + $("#utd").val(),--%>
                <%--success: function(response){--%>
                    <%--$('#result').html("");--%>
                    <%--var obj = JSON.parse(response);--%>
                    <%--$('#result').html("First Name:- " + obj.userTaskDiscription +"</br>Last Name:- " + obj.userTaskName );--%>
                <%--},--%>
                <%--error: function(){--%>
                    <%--alert('Error while request..');--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--</script>--%>


</head>
<body>



<div id="pager" class="scroll" style="text-align:center;">

</div>

<%--<form name="employeeForm" method="post">--%>
    <%--<table cellpadding="0" cellspacing="0" border="1" class="GridOne">--%>
        <%--<tr>--%>
            <%--<td>First Name</td>--%>
            <%--<td><input type="text" name="firstName" id="firstName" value=""></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Last Name</td>--%>
            <%--<td><input type="text" name="lastName" id="lastName" value=""></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>Email</td>--%>
            <%--<td><input type="text" name="email" id="email" value=""></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td colspan="2" align="center"><input type="button" value="Ajax Submit" onclick="madeAjaxCall();"></td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</form>--%>
<h1>Spring Framework Jquery Ajax Demo</h1>
<div id="result"></div>
<%--<h1>Spring Framework Jquery Ajax Demo</h1>--%>
<%--<div id="result1"></div>--%>
<%--<table id="tasktable"></table>--%>


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">QBTMS</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="services.html">Services</a>
                </li>
                <li><a href="blog.html">Blog</a>
                </li>
                <li><a href="/mvccrud/j_spring_security_logout">Logout</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<div class="container">


    <div class="row">

        <div class="col-lg-12">
            <h1 class="page-header">My work load
                <small>Just to be perfect</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="my-task.html">QBTMS</a>
                </li>
                <li class="active">My work load</li>
            </ol>
        </div>

    </div>


    <%--Tabssssssssssssssss--%>
<div id="myTab">

    <ul>
        <li><a href="#myTask">My Tasks</a></li>
        <li><a href="#myTaskSummary">Task Summary</a></li>
        <li><a href="#myTaskCharts">Tasks Charts</a></li>
        <li><a href="#groupTasks">Tickets</a></li>
        <li><a href="#groupTaskSummary">Tickets Summary</a></li>
        <li><a href="#groupTaskCharts">Ticket Charts</a></li>
        <li><a href="#overall">Overall</a></li>
    </ul>

        <div id="myTask">
            <%--<div class="row">--%>

                <%--<div class="col-md-7">--%>

                    <h3>Task List</h3>
                    <ul id="dvCities">
                    </ul>
                    <%--<c:if test="${!empty myTaskList}">--%>
                    <%--<table align="left" border="1">--%>
                        <%--<tr>--%>
                            <%--<th>Task Title</th>--%>
                            <%--<th>Started date/time</th>--%>
                            <%--<th>Target date/time</th>--%>
                            <%--<th>Edit/Delete</th>--%>
                            <%--<th>Progres(%)</th>--%>
                        <%--</tr>--%>

                        <%--<c:forEach items="${myTaskList}" var="myTaskList">--%>
                            <%--<tr>--%>
                                <%--<td><c:out value="${myTaskList.userTaskName}"/></td>--%>
                                <%--<td><c:out value="${myTaskList.startedDate}"/></td>--%>
                                <%--<td><c:out value="${myTaskList.toBeCompleted}"/></td>--%>
                                <%--<td align="center"><a href="/mvccrud/edit-task.html?userTaskId=${myTaskList.userTaskId}">Edit</a> | <a href="/mvccrud/delete-task.html?userTaskId=${myTaskList.userTaskId}">Delete</a>--%>
                                <%--<td>--%>
                                    <%--<select onChange="window.location.href=this.value" name="${myTaskList.completenessLevel}">--%>
                                        <%--<option value="${myTaskList.completenessLevel}">--%>
                                                <%--${myTaskList.completenessLevel}--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=10" >--%>
                                            <%--10%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=20" >--%>
                                            <%--20%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=30" >--%>
                                            <%--30%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=40" >--%>
                                            <%--40%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=50" >--%>
                                            <%--50%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=60" >--%>
                                            <%--60%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=70" >--%>
                                            <%--70%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=80" >--%>
                                            <%--80%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=90" >--%>
                                            <%--90%--%>
                                        <%--</option>--%>
                                        <%--<option value="/mvccrud/complete-task.html?userTaskId=${myTaskList.userTaskId}" >--%>
                                            <%--Mark as complete--%>
                                        <%--</option>--%>
                                    <%--</select>--%>


                                <%--</td>--%>
                            <%--</tr>--%>
                        <%--</c:forEach>--%>
                    <%--</table>--%>

                    <%--</c:if>--%>


                <%--</div>--%>
                <h3>Add new task</h3>
                <form name="employeeForm" method="post">
                    <table>
                        <tr>
                            <td>First Name</td>
                            <td><input type="text" name="userTaskName" id="userTaskName" value=""></td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><input type="text" name="userTaskDescription" id="userTaskDescription" value=""></td>
                        </tr>
                        <tr>
                            <td>Task Started date/time</td>
                            <td><input type="text" name="startedDate" id="startedDate" ></td>
                        </tr>
                            <script>
                            AnyTime.picker( "startedDate",
                            { format: "%M %d %Y %T", firstDOW: 1 } );
                            </script>
                        <tr>
                            <td>Target dat/time</td>
                            <td><input type="text" name="toBeCompleted" id="toBeCompleted"></td>
                        </tr>
                        <script>
                        AnyTime.picker( "toBeCompleted",
                        { format: "%M %d %Y %T", firstDOW: 1 } );
                        </script>
                        <tr>
                            <td colspan="2" align="center"><input type="button" value="Submit" onclick="madeAjaxCall();"></td>
                        </tr>
                    </table>
                </form>
                <%--<div class="col-md-5">--%>
                    <%--<h2>Add New Task</h2>--%>
                    <%--<form method="post" >--%>
                        <%--<table>--%>
                            <%--<tr>--%>
                                <%--<td><input type="hidden" name="userTaskId" id="uti"/><%--<span style="color: #ff0404; "><form:errors path='empName' /></span>--%>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Task Name</td>--%>
                                <%--<td><input type="text" name="userTaskName" id="utn"/><%--<span style="color: #ff0404; "><form:errors path='empName' /></span>--%>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Task Discription</td>--%>
                                <%--<td><textarea cols="20" rows="4" name="userTaskDiscription" id="utd"></textarea><%--<span style="color: #ff0404; "><form:errors path='empAge' /></span></td>--%>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<td>Task Started date/time</td>--%>
                                <%--<td><input type="text" name="startedDate" id="startedDate" /><%--<span style="color: #ff0404; "><form:errors path='salary' /></span></td>--%>--%>
                            <%--</tr>--%>
                            <%--<script>--%>
                                <%--AnyTime.picker( "startedDate",--%>
                                        <%--{ format: "%M %d %Y %T", firstDOW: 1 } );--%>
                            <%--</script>--%>
                            <%--<tr>--%>
                                <%--<td>Target dat/time</td>--%>
                                <%--<td><input type="text" name="toBeCompleted" id="toBeCompleted"/><%--<span style="color: #ff0404; "><form:errors path='empAddress' /></span>--%>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<script>--%>
                                <%--AnyTime.picker( "toBeCompleted",--%>
                                        <%--{ format: "%M %d %Y %T", firstDOW: 1 } );--%>
                            <%--</script>--%>
                            <%--<tr>--%>
                                <%--<td colspan="2"><input type="submit" value="Submit" onclick="madeAjaxCall();"/></td>--%>
                            <%--</tr>--%>
                        <%--</table>--%>

                    <%--</form>--%>
                <%--</div>--%>

            <%--</div>--%>

        </div>
        <div id="myTaskSummary">
            <p>iOS is a mobile operating system developed and distributed by Apple
                Inc. Originally released in 2007 for the iPhone, iPod Touch, and
                Apple TV. iOS is derived from OS X, with which it shares the
                Darwin foundation. iOS is Apple's mobile version of the
                OS X operating system used on Apple computers.</p>
        </div>
        <div id="myTaskCharts">
            <p>jMeter is an Open Source testing software. It is 100% pure
                Java application for load and performance testing.</p>
        </div>
        <div id="groupTasks">
            <p>Enterprise Java Beans (EJB) is a development architecture
                for building highly scalable and robust enterprise level
                applications to be deployed on J2EE compliant
                Application Server such as JBOSS, Web Logic etc.
            </p>
        </div>
        <div id="groupTaskSummary">
            <p>jMeter is an Open Source testing software. It is 100% pure
                Java application for load and performance testing.</p>
        </div>
        <div id="groupTaskCharts">
            <p>Enterprise Java Beans (EJB) is a development architecture
                for building highly scalable and robust enterprise level
                applications to be deployed on J2EE compliant
                Application Server such as JBOSS, Web Logic etc.
            </p>
        </div>
        <div id="overall">
            <p>Enterprise Java Beans (EJB) is a development architecture
                for building highly scalable and robust enterprise level
                applications to be deployed on J2EE compliant
                Application Server such as JBOSS, Web Logic etc.
            </p>
        </div>
</div>



    <%--Tabssss ended--%>


    <hr>


</div>
<!-- /.container -->

<div class="container">

    <hr>

    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Prasad-QBTMS 2014</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- JavaScript -->
<%--<script src="js/jquery-1.10.2.js"></script>--%>
<%--<script src="js/bootstrap.js"></script>--%>
<%--<script src="js/modern-business.js"></script>--%>



</body>

</html>











