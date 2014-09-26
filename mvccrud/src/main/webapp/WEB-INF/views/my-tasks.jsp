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
        <script type="text/javascript" src="fusioncharts/fusioncharts.js"></script>
        <script type="text/javascript" src="fusioncharts/themes/fusioncharts.theme.zune.js"></script>
        <%--<script src="js/jquery.multiselect.js"></script>
        <script type="text/javascript" src="jqplot/plugins/jqplot.pieRenderer.min.js"></script>
        <script type="text/javascript" src="jqplot/plugins/jqplot.donutRenderer.min.js"></script>
        <link class="include" rel="stylesheet" type="text/css" href="jqplot/jquery.jqplot.min.css" />
        <link rel="stylesheet" type="text/css" href="jqplot/examples.min.css" />
        <link type="text/css" rel="stylesheet" href="jqplot/syntaxhighlighter/styles/shCoreDefault.min.css" />
        <link type="text/css" rel="stylesheet" href="jqplot/syntaxhighlighter/styles/shThemejqPlot.min.css" />--%>


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

            #projectTasks { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #projectTasks li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #projectTasks li span { position: absolute; margin-left: -1.3em; }

            #myTaskListTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #myTaskListTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #myTaskListTitle li span { position: absolute; margin-left: -1.3em; }

            #myProjectsTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #myProjectsTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #myProjectsTitle li span { position: absolute; margin-left: -1.3em; }

            #projectTasksTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #projectTasksTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #projectTasksTitle li span { position: absolute; margin-left: -1.3em; }

            #completedProjectTasks { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #completedProjectTasks li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 60px; width: 100%;}
            #completedProjectTasks li span { position: absolute; margin-left: -1.3em; }

            #completedProjectTasksTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #completedProjectTasksTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #completedProjectTasksTitle li span { position: absolute; margin-left: -1.3em; }

            #receivedProjectTasksTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #receivedProjectTasksTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #receivedProjectTasksTitle li span { position: absolute; margin-left: -1.3em; }

            #receivedProjectTasks { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #receivedProjectTasks li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 45px; width: 100%;}
            #receivedProjectTasks li span { position: absolute; margin-left: -1.3em; }

            #receivedCompletedProjectTasksTitle { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #receivedCompletedProjectTasksTitle li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 40px; width: 100%;}
            #receivedCompletedProjectTasksTitle li span { position: absolute; margin-left: -1.3em; }

            #receivedCompletedProjectTasks { list-style-type: none; margin: 0; padding: 0; width: 100%; height: auto }
            #receivedCompletedProjectTasks li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em; height: 45px; width: 100%;}
            #receivedCompletedProjectTasks li span { position: absolute; margin-left: -1.3em; }
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
            var listOfProjects = [];
            var listOfUsers = [];
            var allProjects = [];
            var indSummary;
            var projectSummary;
            jQuery.ajax({

                url: "add-task.html",
                dataType:'json',
                success: function (response) {
                    $("#myTaskListTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"45%\"> Task Title</td><td width=\"35%\">Started Date</td><td width=\"35%\">Target Date</td><td width=\"20%\">Level</td></tr></table></li>");
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
                                    '<td width=\"20%\">'+
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
                                  '</td></tr></table></li>')
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

            $(function() {
                $( "#projectTasks" ).sortable();
                $( "#projectTasks" ).disableSelection();
            });

            $(function() {
                $( "#receivedProjectTasks" ).sortable();
                $( "#receivedProjectTasks" ).disableSelection();
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
            $(function() {
                $( "#myTab2" ).tabs();
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
                                '<td width=\"20%\">'+
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
                    $("#myProjectsTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"45%\">Project Title</td><td width=\"35%\">Started Date</td><td width=\"35%\">Target Date</td><td width=\"20%\">Level</td></tr></table></li>");
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
                                '<td width=\"20%\">'+
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
                    data:'&project_id=' + $("#project_id").val() +'&asignee=' + $("#asignee").val() +'&projectTaskName=' + $("#projectTaskName").val() + "&projectTaskDiscription=" + $("#projectTaskDiscription").val() + "&startedDate=" + $("#projectTaskStartedDate").val() + "&toBeCompleted=" + $("#projectTaskToBeCompleted").val(),
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
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=10\" >' +
                                '10%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=20\" >' +
                                '20%' +
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=30\" >' +
                                '30%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=40\" >'+
                                '40%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=50\" >'+
                                '50%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=60\" >'+
                                '60%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=70\" >'+
                                '70%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=80\" >'+
                                '80%'+
                                '</option>'+
                                '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+obj.projectTaskId+'&completenessLevel=90\" >'+
                                '90%'+
                                '</option>'+
                                '<option value=\"/mvccrud/complete-project-task.html?projectTaskId='+obj.projectId+'\" >'+
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
             * Summary project
             * */
            jQuery.ajax({
                url: "project-count.html",
                dataType:'json',
                success: function (response) {
                    $("#projectCount").append("");
                    projectSummary = response;
                    $("#projectCount").append("<li >" +
                            "<p>Project created: " +
                            + response.projectsCreated +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Project Completed: " +
                            + response.projectsCompleted +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Group Tasks Created: " +
                            + response.groupTasksCreated +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Group Tasks Received: " +
                            + response.groupTasksReceived +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "Group Tasks Completed: " +
                            + response.groupTasksCompleted +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                            '</p>'+
                            '</li>')
                }
            });

            FusionCharts.ready(function(){
                var revenueChart = new FusionCharts({
                    type: "Pie3D",
                    renderAt: "chartContainer3",
                    width: "500",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Project Summary",
                            "subCaption": "",
                            "xAxisName": "Projects",
                            "yAxisName": "Count",
                            "enableSmartLabels": "0",
                            "showPercentValues": "1",
                            "showTooltip": "0",
                            "decimals": "1",
                            "theme": "fint"
                        },
                        "data": [
                            {
                                "label": "Projects Completed",
                                "value": projectSummary.projectsCompleted
                            },
                            {
                                "label": "Projects to complete",
                                "value": projectSummary.projectsCreated - projectSummary.projectsCompleted
                            }
                        ]
                    }

                });
                revenueChart.render("chartContainer3");
            });

            FusionCharts.ready(function(){
                var revenueChart = new FusionCharts({
                    type: "Column2D",
                    renderAt: "chartContainer4",
                    width: "500",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Project Tasks Summary",
                            "subCaption": "",
                            "xAxisName": "Tasks",
                            "yAxisName": "Count",
                            "theme": "fint"
                        },
                        "data": [
                            {
                                "label": "Created",
                                "value": projectSummary.groupTasksCreated
                            },
                            {
                                "label": "Completed",
                                "value": projectSummary.groupTasksCompleted
                            },
                            {
                                "label": "Received",
                                "value": projectSummary.groupTasksReceived
                            },
                            {
                                "label": "To complete",
                                "value": projectSummary.groupTasksCreated - projectSummary.groupTasksCompleted
                            }
                        ]
                    }

                });
                revenueChart.render("chartContainer4");
            });

            /*
             * End of summary project
             */


        /*
        * Summary individual
        * */
            jQuery.ajax({
                url: "task-count.html",
                dataType:'json',
                success: function (response) {
                    $("#indCount").append("");
                    indSummary = response;
                        $("#indCount").append("<li >" +
                               "<p>Tasks created: " +
                                + response.tasksCreated +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                                "Tasks Completed: " +
                                + response.tasksCompleted +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                                "Tasks to complete: " +
                                + response.tasksToComplete +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                                '</p>'+
                                '</li>')
                }
            });

            FusionCharts.ready(function(){
                var revenueChart = new FusionCharts({
                    type: "Pie3D",
                    renderAt: "chartContainer1",
                    width: "500",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Individual Summary",
                            "subCaption": "",
                            "xAxisName": "Tasks",
                            "yAxisName": "Count",
                            "enableSmartLabels": "0",
                            "showPercentValues": "1",
                            "showTooltip": "0",
                            "decimals": "1",
                            "theme": "fint"
                        },
                        "data": [
                            {
                                "label": "Tasks Completed",
                                "value": indSummary.tasksCompleted
                            },
                            {
                                "label": "Tasks to complete",
                                "value": indSummary.tasksToComplete
                            }
                        ]
                    }

                });
                revenueChart.render("chartContainer1");
            });

            FusionCharts.ready(function(){
                var revenueChart = new FusionCharts({
                    type: "Column2D",
                    renderAt: "chartContainer2",
                    width: "500",
                    height: "300",
                    dataFormat: "json",
                    dataSource: {
                        "chart": {
                            "caption": "Individual Summary",
                            "subCaption": "",
                            "xAxisName": "Tasks",
                            "yAxisName": "Count",
                            "theme": "fint"
                        },
                        "data": [
                            {
                                "label": "Created",
                                "value": indSummary.tasksCreated
                            },
                            {
                                "label": "Completed",
                                "value": indSummary.tasksCompleted
                            },
                            {
                                "label": "Left",
                                "value": indSummary.tasksToComplete
                            }
                        ]
                    }

                });
                revenueChart.render("chartContainer2");
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
                    listOfUsers = response;
                    $("#asignee").append("");
                    $.each(response, function(){
                       $("#asignee").append('<option value='+this.id+'>' +this.name+'</option>');
                    });
                }
            });


            jQuery.ajax({
                url: "list-project-names.html",
                dataType:'json',
                success: function (response) {
                    listOfProjects = response;
                    $("#project_id").append("");
                    $.each(response, function(){
                        $("#project_id").append('<option value='+this.projectId+'>' +this.projectName+'</option>');
                    });

                }
            });

            jQuery.ajax({
                url: "list-all-projects.html",
                dataType:'json',
                success: function (response) {
                    allProjects = response;
                }
            });

             $(document).ready(function(){
                $("#asignees").multiselect();
            });


            /*
             * List my project tasks
             *
             * $.each( listOfProjects, function( key, value ) {
             if(key == this.project_id){
             pName = value;
             }
             });
             * */
            jQuery.ajax({
                url: "list-project-tasks.html",
                dataType:'json',
                success: function (response) {
                    $("#projectTasksTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"20%\">Task Title</td><td width=\"20%\">Project Name</td><td width=\"20%\">Asignee</td><td width=\"20%\">Started Date</td><td width=\"20%\">Target Date</td><td width=\"40%\">Level</td></tr></table></li>");
                    var pName;
                    $.each( listOfProjects, function( key, value ) {
                        var id = this.projectId;
                        var pn = this.projectName;
                        $.each( listOfUsers, function( key, value ) {
                            var uid = this.id;
                            var uname = this.name;
                            $("#projectTasks").append("");
                            $.each(response, function(){
                                if(id == this.project_id && uid == this.asignee){
                                    pName = pn;
                                    pAsignee = uname;
                                    $("#projectTasks").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                                            "<table><tr>" +
                                            "<td width=\"20%\">"
                                            + this.projectTaskName +
                                            '</td>' +
                                            "<td width=\"20%\">"
                                            +pName +
                                            '</td>' +
                                            "<td width=\"20%\">"
                                            +pAsignee +
                                            '</td>' +
                                            '<td width=\"20%\">'
                                            + new Date(this.startedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                                            '</td>' +
                                            '<td width=\"20%\">'
                                            + new Date(this.toBeCompleted).toLocaleDateString()+','+new Date(this.toBeCompleted).toLocaleTimeString() +
                                            '</td>' +
                                            '<td width=\"40%\">'+
                                            '<select onChange=\"window.location.href=this.value\">' +
                                            '<option selected" >' +
                                            +this.completenessLevel+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=10\" >' +
                                            '10%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=20\" >' +
                                            '20%' +
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=30\" >' +
                                            '30%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=40\" >'+
                                            '40%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=50\" >'+
                                            '50%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=60\" >'+
                                            '60%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=70\" >'+
                                            '70%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=80\" >'+
                                            '80%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+this.projectTaskId+'&completenessLevel=90\" >'+
                                            '90%'+
                                            '</option>'+
                                            '<option value=\"/mvccrud/complete-project-task.html?projectTaskId='+this.projectTaskId+'\" >'+
                                            ' Mark as complete'+
                                            '</option>'+
                                            '</select>' +
                                            '</li>')
                                }
                            });
                        });

                    });
                }
            });
            /*
             * End of list my project tasks
             * */

            /*
             * List completed project tasks
             * */
            jQuery.ajax({
                url: "list-completed-project-tasks.html",
                dataType:'json',
                success: function (response) {
                    $("#completedProjectTasksTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"30%\">Task Title</td><td width=\"30%\">Asignee</td><td width=\"50%\">Completed Date</td><td width=\"40%\"></td></tr></table></li>");
                    var pName;
                    $.each( listOfProjects, function( key, value ) {
                        var id = this.projectId;
                        var pn = this.projectName;
                        $.each( listOfUsers, function( key, value ) {
                            var uid = this.id;
                            var uname = this.name;
                            $("#completedProjectTasks").append("");
                            $.each(response, function(){
                                if(id == this.project_id && uid == this.asignee){
                                    pName = pn;
                                    pAsignee = uname;
                                    $("#completedProjectTasks").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                                            "<table><tr>" +
                                            "<td width=\"30%\">"
                                            + this.projectTaskName +
                                            '</td>' +
                                            "<td width=\"30%\">"
                                            +pAsignee +
                                            '</td>' +
                                            '<td width=\"25%\">'
                                            + new Date(this.completedDate).toLocaleDateString()+','+new Date(this.startedDate).toLocaleTimeString() +
                                            '</td>' +
                                            '<td width=\"35%\">'+
                                            '<a href="/mvccrud/notcomplete-project-task.html?projectTaskId='+this.projectTaskId+'" >Mark as incomplete </a> '+
                                            '</td>' +
                                            '<td width=\"15%\">'+
                                            '<a href="/mvccrud/delete-completed-project-task.html?projectTaskId='+this.projectTaskId+'" >Delete </a> '+
                                            '</td>' +
                                    '</li>')
                                }
                            });
                        });

                    });
                }
            });

            /*
             * End of list completed project tasks
             * */



            /*
             * List received project tasks
             *
             * */
            jQuery.ajax({
                url: "list-asigned-project-tasks.html",
                dataType:'json',
                success: function (response) {
                    $("#receivedProjectTasksTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"20%\">Task Title</td><td width=\"20%\">Project Name</td><td width=\"20%\">Assigner</td><td width=\"20%\">Started Date</td><td width=\"20%\">Target Date</td><td width=\"40%\">Level</td></tr></table></li>");
                    var pName;
                    var pn;
                    var ownerId;
                    var uname;
                    var pOwner;
                            $("#receivedProjectTasks").append("");
                            $.each(response, function(){
                                var id = this.project_id;
                                var std = this.startedDate;
                                var tbc = this.toBeCompleted;
                                var cl = this.completenessLevel;
                                var ptn = this.projectTaskName;
                                var ptid = this.projectTaskId;
                                $.each( allProjects, function( key, value ) {
                                   if(id == this.projectId){
                                       pn = this.projectName;
                                       ownerId = this.owner;
                                       $.each( listOfUsers, function( key, value ) {
                                           if(parseInt(ownerId) == this.id){
                                               uname = this.name;
                                               pName = pn;
                                               pOwner = uname;
                                               $("#receivedProjectTasks").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                                                       "<table><tr>" +
                                                       "<td width=\"20%\">"
                                                       +ptn +
                                                       '</td>' +
                                                       "<td width=\"20%\">"
                                                       +pName +
                                                       '</td>' +
                                                       "<td width=\"20%\">"
                                                       +pOwner +
                                                       '</td>' +
                                                       '<td width=\"20%\">'
                                                       + new Date(std).toLocaleDateString()+','+new Date(std).toLocaleTimeString() +
                                                       '</td>' +
                                                       '<td width=\"20%\">'
                                                       + new Date(tbc).toLocaleDateString()+','+new Date(tbc).toLocaleTimeString() +
                                                       '</td>' +
                                                       '<td width=\"40%\">'+
                                                       '<select onChange=\"window.location.href=this.value\">' +
                                                       '<option selected" >' +
                                                       +cl+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=10\" >' +
                                                       '10%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=20\" >' +
                                                       '20%' +
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=30\" >' +
                                                       '30%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=40\" >'+
                                                       '40%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=50\" >'+
                                                       '50%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=60\" >'+
                                                       '60%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=70\" >'+
                                                       '70%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=80\" >'+
                                                       '80%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/update-project-task.html?projectTaskId='+ptid+'&completenessLevel=90\" >'+
                                                       '90%'+
                                                       '</option>'+
                                                       '<option value=\"/mvccrud/complete-project-task.html?projectTaskId='+ptid+'\" >'+
                                                       ' Mark as complete'+
                                                       '</option>'+
                                                       '</select>' +
                                                       '</li>')
                                           }
                                       });
                                   }

                        });

                    });
                }
            });
            /*
             * End of list received project tasks
             * */


            /*
             * List completed project tasks
             *
             * */
            jQuery.ajax({
                url: "all-completed-project-tasks.html",
                dataType:'json',
                success: function (response) {
                    $("#receivedCompletedProjectTasksTitle").append("<li class=\"ui-state-default\"><table><tr><td width=\"20%\">Task Title</td><td width=\"20%\">Project Name</td><td width=\"20%\">Assigner</td><td width=\"20%\">Completed Date</td><td width=\"20%\"></td><td width=\"40%\"></td></tr></table></li>");
                    var pName;
                    var pn;
                    var ownerId;
                    var uname;
                    var pOwner;
                    $("#receivedCompletedProjectTasks").append("");
                    $.each(response, function(){
                        var id = this.project_id;
                        var ptn = this.projectTaskName;
                        var cd = this.completedDate;
                        var ptid = this.projectTaskId;
                        $.each( allProjects, function( key, value ) {
                            if(id == this.projectId){
                                pn = this.projectName;
                                ownerId = this.owner;
                                $.each( listOfUsers, function( key, value ) {
                                    if(parseInt(ownerId) == this.id){
                                        uname = this.name;
                                        pName = pn;
                                        pOwner = uname;
                                        $("#receivedCompletedProjectTasks").append("<li class=\"ui-state-default\"><span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span>" +
                                                "<table><tr>" +
                                                "<td width=\"20%\">"
                                                +ptn +
                                                '</td>' +
                                                "<td width=\"20%\">"
                                                +pName +
                                                '</td>' +
                                                "<td width=\"20%\">"
                                                +pOwner +
                                                '</td>' +
                                                '<td width=\"20%\">'
                                                + new Date(cd).toLocaleDateString()+','+new Date(cd).toLocaleTimeString() +
                                                '</td>' +
                                                '<td width=\"35%\">'+
                                                '<a href="/mvccrud/notcomplete-project-task.html?projectTaskId='+ptid+'" >Mark as incomplete </a> '+
                                                '</td>' +
                                                '<td width=\"15%\">'+
                                                '<a href="/mvccrud/delete-completed-project-task.html?projectTaskId='+ptid+'" >Delete </a> '+
                                                '</td>' +
                                                '</li>')
                                    }
                                });
                            }

                        });

                    });
                }
            });
            /*
             * End of list completed project tasks
             * */

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
            <li id="indsummary"><a href="#myTaskSummary">Task Summary</a></li>
            <li><a href="#groupProjects">My Projects</a></li>
            <li><a href="#groupTasks">Project Tasks</a></li>
            <li><a href="#groupTaskSummary">Project Summary</a></li>
        </ul>

            <div id="myTask">
                <%--<div class="row">--%>

                    <%--<div class="col-md-7">--%>

                        <h3>Task List</h3>
                    <ul id="myTaskListTitle">
                    </ul>
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
                    <div class="row">
                        <div class="col-md-5" id="chartContainer1"></div>
                        <div class="col-md-7" id="chartContainer2"></div>
                    </div>

            </div>


            <div id="groupProjects">
                <h3>Project List</h3>
                <ul id="myProjectsTitle">
                </ul>
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
                <div id="myTab2">
                    <ul>
                        <li><a href="#cpt">Created project tasks</a></li>
                        <li><a href="#rpt">Received project tasks</a></li>
                    </ul>
                    <div id="cpt">
                        <h3>Project Task List</h3>
                        <ul id="projectTasksTitle">
                        </ul>
                        <ul id="projectTasks">
                        </ul>

                        <div class="row">
                            <div class="col-md-3">
                                <h3>Add new Project Task</h3>
                                <form class='form-inline' name="employeeForm" method="post">
                                    <fieldset>
                                        <div class="control-group">
                                            <!-- Username -->
                                            <label class="control-label">Project</label>
                                            <div class="controls"><select name="project_id" id="project_id" class="input-xlarge"></select>
                                            </div>
                                        </div>s

                                        <div class="control-group">
                                            <!-- Username -->
                                            <label class="control-label">Asignee</label>
                                            <div class="controls"><select name="asignee" id="asignee" class="input-xlarge"></select>
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <!-- Username -->
                                            <label class="control-label">Task</label>
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

                            <div class="col-md-9">
                                <h3>Completed Project Task List</h3>
                                <ul id="completedProjectTasksTitle"></ul>
                                <ul id="completedProjectTasks">
                                </ul>

                            </div>
                        </div>
                    </div>

                    <div id="rpt">
                        <h2>Received tasks</h2>
                        <h3>To complete</h3>
                        <ul id="receivedProjectTasksTitle"></ul>
                        <ul id="receivedProjectTasks">
                        </ul>

                        <h3>Completed</h3>
                        <ul id="receivedCompletedProjectTasksTitle"></ul>
                        <ul id="receivedCompletedProjectTasks">
                        </ul>
                    </div>
                </div>

            </div>



            <div id="groupTaskSummary">
                <ul id="projectCount">

                </ul>
                <div class="row">
                    <div class="col-md-5" id="chartContainer3"></div>
                    <div class="col-md-7" id="chartContainer4"></div>
                </div>

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











