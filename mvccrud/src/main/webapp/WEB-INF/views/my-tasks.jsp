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
    <link type="text/css" rel="stylesheet" href="css/jquery.multiselect.css" />
    <script src="js/jquery.js"></script>
    <script src="js/anytime.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.multiselect.js"></script>
    <script type="text/javascript" src="jqplot/plugins/jqplot.pieRenderer.min.js"></script>
    <script type="text/javascript" src="jqplot/plugins/jqplot.donutRenderer.min.js"></script>
    <link class="include" rel="stylesheet" type="text/css" href="jqplot/jquery.jqplot.min.css" />
    <link rel="stylesheet" type="text/css" href="jqplot/examples.min.css" />
    <link type="text/css" rel="stylesheet" href="jqplot/syntaxhighlighter/styles/shCoreDefault.min.css" />
    <link type="text/css" rel="stylesheet" href="jqplot/syntaxhighlighter/styles/shThemejqPlot.min.css" />


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
            border: 1px solid #1d02ff;
            border-collapse: collapse;
        }

        #myTaskList { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
        #myTaskList li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
        #myTaskList li span { position: absolute; margin-left: -1.3em; }

        #completedTaskList { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
        #completedTaskList li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%; }
        #completedTaskList li span { position: absolute; margin-left: -1.3em; }

        #myProjects { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
        #myProjects li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
        #myProjects li span { position: absolute; margin-left: -1.3em; }

        #completedProjects { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
        #completedProjects li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%; }
        #completedProjects li span { position: absolute; margin-left: -1.3em; }
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

            url: "add-task.html",
            dataType:'json',
            success: function (response) {
                $("#myTaskList").append("");
                $.each(response, function(){
//                    var id = this.userTaskId;
                    $("#myTaskList").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                                "<td width=\"45%\">"
                                    + this.userTaskName +
                                '</td>' +
                                '<td width=\"35%\">'
                                    + new Date(this.startedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                                '</td>' +
                                '<td width=\"35%\">'
                                    + new Date(this.toBeCompleted).toLocaleDateString()+','+new Date(this.toBeCompleted).toLocaleTimeString() +
                                '</td>' +
                                '<td width=\"40%\">'+
                                     '<select onChange=\"window.location.href=this.value\">' +
                            '<option selected" >' +
                            +this.completenessLevel+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=10\" >' +
                           '10%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=20\" >' +
                            '20%' +
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=30\" >' +
                            '30%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=40\" >'+
                            '40%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=50\" >'+
                            '50%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=60\" >'+
                            '60%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=70\" >'+
                            '70%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=80\" >'+
                            '80%'+
                            '</option>'+
                    '<option value=\"/mvccrud/update-task.html?userTaskId='+this.userTaskId+'&completenessLevel=90\" >'+
                            '90%'+
                            '</option>'+
                    '<option value=\"/mvccrud/complete-task.html?userTaskId='+this.userTaskId+'\" >'+
                           ' Mark as complete'+
                    '</option>'+
                    '</select>' +
                              '</li>')
                });

                listOfTask = response;
            }
        });


        $(function() {
            $( "#myTaskList" ).sortable();
            $( "#myTaskList" ).disableSelection();
        });

        $(function() {
            $( "#myProjects" ).sortable();
            $( "#myProjects" ).disableSelection();
        });

        /*
        *
        * Do empty div
        *
        * */

        function doEmpty(){
            $('#myTaskList').empty();
        }

        /*
        * End of do empty div
        * */
/*
* List completed tasks
* */
        jQuery.ajax({

            url: "completed-task.html",
            dataType:'json',
            success: function (response) {
                $("#completedTaskList").append("");
                $.each(response, function(){
//                    var id = this.userTaskId;
                    $("#completedTaskList").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"30%\">"
                            + this.userTaskName +
                            '</td>' +
                            '<td width=\"30%\">'
                            + new Date(this.completedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<a href="/mvccrud/notcomplete-task.html?userTaskId='+this.userTaskId+'" >Mark as incomplete </a> '+
                            '</td>' +
                            '<td width=\"20%\">'+
                            '<a href="/mvccrud/delete-completed-task.html?userTaskId='+this.userTaskId+'" >Delete </a> '+
                            '</td>' +
                            '</li>')
                });

                listOfTask = response;
            }
        });

        /*
        * End of list completed task list
        * */

     <%--Tab script--%>

        $(function() {
            $( "#myTab" ).tabs();
        });

        function madeAjaxCall(){
            $.ajax({
                type: "post",
                url: "addtask.html",
                cache: false,
                data:'userTaskName=' + $("#userTaskName").val() + "&userTaskDescription=" + $("#userTaskDescription").val() + "&startedDate=" + $("#startedDate").val() + "&toBeCompleted=" + $("#toBeCompleted").val(),
                success: function(response){
                    var obj = JSON.parse(response);
                    $("#myTaskList").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"45%\">"
                            + obj.userTaskName +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.startedDate).toLocaleDateString()+','+new Date(obj.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.toBeCompleted).toLocaleDateString()+','+new Date(obj.toBeCompleted).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<select onChange=\"window.location.href=obj.value\">' +
                            '<option selected" >' +
                            +obj.completenessLevel+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=10\" >' +
                            '10%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=20\" >' +
                            '20%' +
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=30\" >' +
                            '30%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=40\" >'+
                            '40%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=50\" >'+
                            '50%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=60\" >'+
                            '60%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=70\" >'+
                            '70%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=80\" >'+
                            '80%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.userTaskId+'&completenessLevel=90\" >'+
                            '90%'+
                            '</option>'+
                            '<option value=\"/mvccrud/complete-task.html?userTaskId='+obj.userTaskId+'\" >'+
                            ' Mark as complete'+
                            '</option>'+
                            '</select>' +
                            '</li>')
                },
                error: function(){
                    alert('Error while request..');
                }
            });
        }

        $(function(){
            $('#result').html("First Name:- " + listOfTask.toString());
        });

        /*
        * Add new project
        * */
        function addProjectAjax(){
            $.ajax({
                type: "post",
                url: "add-project.html",
                cache: false,
                data:'projectName=' + $("#projectName").val() + "&projectDescription=" + $("#projectDescription").val() + "&startedDate=" + $("#projectStartedDate").val() + "&toBeCompleted=" + $("#projectToBeCompleted").val(),
                success: function(response){
                    var obj = JSON.parse(response);
                    $("#myProjects").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"45%\">"
                            + obj.projectName +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.startedDate).toLocaleDateString()+','+new Date(obj.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.toBeCompleted).toLocaleDateString()+','+new Date(obj.toBeCompleted).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<select onChange=\"window.location.href=obj.value\">' +
                            '<option selected" >' +
                            +obj.completenessLevel+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=10\" >' +
                            '10%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=20\" >' +
                            '20%' +
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=30\" >' +
                            '30%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=40\" >'+
                            '40%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=50\" >'+
                            '50%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=60\" >'+
                            '60%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=70\" >'+
                            '70%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=80\" >'+
                            '80%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=90\" >'+
                            '90%'+
                            '</option>'+
                            '<option value=\"/mvccrud/complete-task.html?userTaskId='+obj.projectId+'\" >'+
                            ' Mark as complete'+
                            '</option>'+
                            '</select>' +
                            '</li>')
                },
                error: function(){
                    alert('Error while request..');
                }
            });
        }

        /*
        * End of add new project
        * */

/*
* List my projects
* */
        jQuery.ajax({

            url: "list-projects.html",
            dataType:'json',
            success: function (response) {
                $("#myProjects").append("");
                $.each(response, function(){
//                    var id = this.userTaskId;
                    $("#myProjects").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"45%\">"
                            + this.projectName +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(this.startedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(this.toBeCompleted).toLocaleDateString()+','+new Date(this.toBeCompleted).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<select onChange=\"window.location.href=this.value\">' +
                            '<option selected" >' +
                            +this.completenessLevel+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=10\" >' +
                            '10%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=20\" >' +
                            '20%' +
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=30\" >' +
                            '30%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=40\" >'+
                            '40%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=50\" >'+
                            '50%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=60\" >'+
                            '60%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=70\" >'+
                            '70%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=80\" >'+
                            '80%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-project.html?projectId='+this.projectId+'&completenessLevel=90\" >'+
                            '90%'+
                            '</option>'+
                            '<option value=\"/mvccrud/complete-project.html?projectId='+this.projectId+'\" >'+
                            ' Mark as complete'+
                            '</option>'+
                            '</select>' +
                            '</li>')
                });

                listOfTask = response;
            }
        });
/*
* End of list my projects
* */

        /*
         * List completed projects
         * */
        jQuery.ajax({

            url: "completed-project.html",
            dataType:'json',
            success: function (response) {
                $("#completedProjects").append("");
                $.each(response, function(){
//                    var id = this.userTaskId;
                    $("#completedProjects").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"30%\">"
                            + this.projectName +
                            '</td>' +
                            '<td width=\"30%\">'
                            + new Date(this.completedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<a href="/mvccrud/notcomplete-project.html?userTaskId='+this.projectId+'" >Mark as incomplete </a> '+
                            '</td>' +
                            '<td width=\"20%\">'+
                            '<a href="/mvccrud/delete-completed-project.html?projectId='+this.projectId+'" >Delete </a> '+
                            '</td>' +
                            '</li>')
                });

                listOfTask = response;
            }
        });

        /*
         * End of list completed projects
         * */

        /*
         * Add project task
         * */
        function addProjectTaskAjax(){
            $.ajax({
                type: "post",
                url: "add-project-task.html",
                cache: false,
                data:'project_id=' + $("#project_id").val() +'asignee=' + $("#asignee").val() +'projectTaskName=' + $("#projectTaskName").val() + "&projectTaskDiscription=" + $("#projectTaskDiscription").val() + "&startedDate=" + $("#projectTaskStartedDate").val() + "&toBeCompleted=" + $("#projectTaskToBeCompleted").val(),
                success: function(response){
                    var obj = JSON.parse(response);
                    $("#projectTasks").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                            "<table><tr>" +
                            "<td width=\"45%\">"
                            + obj.projectTaskName +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.startedDate).toLocaleDateString()+','+new Date(obj.startedDate).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"35%\">'
                            + new Date(obj.toBeCompleted).toLocaleDateString()+','+new Date(obj.toBeCompleted).toLocaleTimeString() +
                            '</td>' +
                            '<td width=\"40%\">'+
                            '<select onChange=\"window.location.href=obj.value\">' +
                            '<option selected" >' +
                            +obj.completenessLevel+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=10\" >' +
                            '10%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=20\" >' +
                            '20%' +
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=30\" >' +
                            '30%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=40\" >'+
                            '40%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=50\" >'+
                            '50%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=60\" >'+
                            '60%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=70\" >'+
                            '70%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=80\" >'+
                            '80%'+
                            '</option>'+
                            '<option value=\"/mvccrud/update-task.html?userTaskId='+obj.projectId+'&completenessLevel=90\" >'+
                            '90%'+
                            '</option>'+
                            '<option value=\"/mvccrud/complete-task.html?userTaskId='+obj.projectId+'\" >'+
                            ' Mark as complete'+
                            '</option>'+
                            '</select>' +
                            '</li>')
                },
                error: function(){
                    alert('Error while request..');
                }
            });
        }

        /*
         * End of add project task
         * */



    /*
    * Summary individual
    * */
        jQuery.ajax({

            url: "task-count.html",
            dataType:'json',
            success: function (response) {
                $("#indCount").append("");
                    $("#indCount").append("<li >" +
                           "<p>Tasks created: " +
                            + response.tasksCreated +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Tasks Completed: " +
                            + response.tasksCompleted +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Tasks to complete: " +
                            + response.tasksToComplete +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Task completeness rate: " +
                            + (response.tasksCompleted / response.tasksCreated) * 100 + "%" +
                            '</p>'+
                            '</li>')
            }
        });



        /*
         * End of summary individual
         */

/*
* List all users
* */

        jQuery.ajax({
            url: "list-user-names.html",
            dataType:'json',
            success: function (response) {
                $("#completedProjectTasks").append("<p>"+response+"</p>");

            }
        });


        jQuery.ajax({
            url: "list-project-names.html",
            dataType:'json',
            success: function (response) {
                $("#projectTasks").append("<p>"+response+"</p>");

            }
        });

         $(document).ready(function(){
            $("#asignees").multiselect();
        });

    </script>


</head>
<body>
<div id="tttt">

</div>


<div id="pager" class="scroll" style="text-align:center;">

</div>


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
        <li><a href="#groupProjects">My Projects</a></li>
        <li><a href="#groupTasks">Project Tasks</a></li>
        <li><a href="#groupTaskSummary">Tickets Summary</a></li>
        <li><a href="#groupTaskCharts">Ticket Charts</a></li>
        <li><a href="#overall">Overall</a></li>
    </ul>

        <div id="myTask">
            <%--<div class="row">--%>

                <%--<div class="col-md-7">--%>

                    <h3>Task List</h3>
                    <ul id="myTaskList">
                    </ul>

            <div class="row">
                <div class="col-md-5">
                <h3>Add new task</h3>
                    <form class='form-inline' name="employeeForm" method="post">
                        <fieldset>
                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label">Title</label>
                                <div class="controls"><input type="text" name="userTaskName" id="userTaskName" class="input-xlarge" value="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Description</label>
                                <div class="controls"> <textarea name="userTaskDescription" id="userTaskDescription" class="input-xlarge" value=""></textarea>
                                </div></div>

                            <div class="control-group">
                                <label class="control-label">Task Started date/time</label>
                                <div class="controls"><input type="text" name="startedDate" id="startedDate" >
                                    <script>
                                        AnyTime.picker( "startedDate",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div></div>



                            <div class="control-group">
                                <label class="control-label">Target date/time</label>
                                <div class="controls"><input type="text" name="toBeCompleted" id="toBeCompleted">
                                    <script>
                                        AnyTime.picker( "toBeCompleted",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div></div>

<br />

                            <div class="control-group">
                                <input type="button" class="btn btn-primary" value="Submit" onclick="madeAjaxCall();">
                            </div>
                        </fieldset>
                    </form>


                </div>

            <div class="col-md-7">
                <h3>Completed Task List</h3>
                <ul id="completedTaskList">
                </ul>
               
        </div>
            </div>
            </div>

        <div id="myTaskSummary">
            <ul id="indCount">

            </ul>

        </div>


        <div id="groupProjects">
            <h3>Project List</h3>
            <ul id="myProjects">
            </ul>

            <div class="row">
                <div class="col-md-5">
                    <h3>Add new Project</h3>
                    <form class='form-inline' name="employeeForm" method="post">
                        <fieldset>
                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label">Title</label>
                                <div class="controls"><input type="text" name="projectName" id="projectName" class="input-xlarge" value="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Description</label>
                                <div class="controls"> <textarea name="projectDiscription" id="projectDiscription" class="input-xlarge" value=""></textarea>
                                </div></div>

                            <div class="control-group">
                                <label class="control-label">Task Started date/time</label>
                                <div class="controls"><input type="text" name="startedDate" id="projectStartedDate" >
                                    <script>
                                        AnyTime.picker( "projectStartedDate",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div></div>



                            <div class="control-group">
                                <label class="control-label">Target date/time</label>
                                <div class="controls"><input type="text" name="toBeCompleted" id="projectToBeCompleted">
                                    <script>
                                        AnyTime.picker( "projectToBeCompleted",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div></div>

                            <br />

                            <div class="control-group">
                                <input type="button" class="btn btn-primary" value="Submit" onclick="addProjectAjax();">
                            </div>
                        </fieldset>
                    </form>


                </div>

                <div class="col-md-7">
                    <h3>Completed Project List</h3>
                    <ul id="completedProjects">
                    </ul>

                </div>
            </div>
        </div>



        <div id="groupTasks">
            <h3>Project Task List</h3>
            <ul id="projectTasks">
            </ul>

            <div class="row">
                <div class="col-md-5">
                    <h3>Add new Project</h3>
                    <form class='form-inline' name="employeeForm" method="post">
                        <fieldset>
                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label">Title</label>
                                <div class="controls"><input type="text" name="project_id" id="project_id" class="input-xlarge" value="">
                                </div>
                            </div>

                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label">Title</label>
                                <div class="controls"><input type="text" name="asignee" id="asignee" class="input-xlarge" value="">
                                </div>
                            </div>

                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label">Title</label>
                                <div class="controls"><input type="text" name="projectTaskName" id="projectTaskName" class="input-xlarge" value="">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Description</label>
                                <div class="controls"> <textarea name="projectTaskDiscription" id="projectTaskDiscription" class="input-xlarge" value=""></textarea>
                                </div></div>

                            <div class="control-group">
                                <label class="control-label">Task Started date/time</label>
                                <div class="controls"><input type="text" name="startedDate" id="projectTaskStartedDate" >
                                    <script>
                                        AnyTime.picker( "projectTaskStartedDate",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div>
                            </div>



                            <div class="control-group">
                                <label class="control-label">Target date/time</label>
                                <div class="controls"><input type="text" name="toBeCompleted" id="projectTaskToBeCompleted">
                                    <script>
                                        AnyTime.picker( "projectTaskToBeCompleted",
                                                { format: "%M %d %Y %T", firstDOW: 1 } );
                                    </script>
                                </div></div>

                            <br />

                            <div class="control-group">
                                <input type="button" class="btn btn-primary" value="Submit" onclick="addProjectTaskAjax();">
                            </div>
                        </fieldset>
                    </form>


                </div>

                <div class="col-md-7">
                    <h3>Completed Project List</h3>
                    <ul id="completedProjectTasks">
                    </ul>

                </div>
            </div>
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











