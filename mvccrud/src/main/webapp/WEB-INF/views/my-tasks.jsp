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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>QBTMS - Manage your valuable time</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/anytime.css" />
    <script src="js/jquery.js"></script>
    <script src="js/anytime.js"></script>


    <!-- Add custom CSS here -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
<a href="http://jquery.com/">jQuery</a>
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

    <div class="row">

        <div class="col-md-7">
            <h1>Task List</h1>
            <%--<c:if test="${!empty myTaskList}">--%>
                <table align="left" border="1">
                    <tr>
                        <th>Task Title</th>
                        <th>Started date/time</th>
                        <th>Target date/time</th>
                        <th>Edit/Delete</th>
                        <th>Progres(%)</th>
                    </tr>

                    <c:forEach items="${myTaskList}" var="myTaskList">
                        <tr>
                            <td><c:out value="${myTaskList.userTaskName}"/></td>
                            <td><c:out value="${myTaskList.startedDate}"/></td>
                            <td><c:out value="${myTaskList.toBeCompleted}"/></td>
                            <td align="center"><a href="/mvccrud/edit-task.html?userTaskId=${myTaskList.userTaskId}">Edit</a> | <a href="/mvccrud/delete-task.html?userTaskId=${myTaskList.userTaskId}">Delete</a>
                            <td>
                                <select onChange="window.location.href=this.value" name="${myTaskList.completenessLevel}">
                                    <option value="${myTaskList.completenessLevel}">
                                        ${myTaskList.completenessLevel}
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=10" >
                                            10%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=20" >
                                        20%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=30" >
                                        30%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=40" >
                                        40%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=50" >
                                        50%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=60" >
                                        60%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=70" >
                                        70%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=80" >
                                        80%
                                    </option>
                                    <option value="/mvccrud/update-task.html?userTaskId=${myTaskList.userTaskId}&completenessLevel=90" >
                                        90%
                                    </option>
                                    <option value="/mvccrud/complete-task.html?userTaskId=${myTaskList.userTaskId}" >
                                        Mark as complete
                                    </option>
                                </select>


                            </td>
                        </tr>
                    </c:forEach>
                </table>

            <%--</c:if>--%>


        </div>

        <div class="col-md-5">
            <h2>Add New Task</h2>
            <form method="POST" action="/mvccrud/saveUserTask.html" commandName="addUserTaskCommand">
                <table>
                    <tr>
                        <td><input type="hidden" name="userTaskId" value="${editTask.userTaskId}"/><%--<span style="color: #ff0404; "><form:errors path='empName' /></span>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Task Name</td>
                        <td><input type="text" name="userTaskName" value="${editTask.userTaskName}"/><%--<span style="color: #ff0404; "><form:errors path='empName' /></span>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Task Discription</td>
                        <td><textarea cols="20" rows="4" name="userTaskDiscription" value="${editTask.userTaskDiscription}"></textarea><%--<span style="color: #ff0404; "><form:errors path='empAge' /></span></td>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Task Started date/time</td>
                        <td><input type="text" name="startedDate" id="startedDate" value="${editTask.startedDate}"/><%--<span style="color: #ff0404; "><form:errors path='salary' /></span></td>--%>
                    </tr>
                    <script>
                        AnyTime.picker( "startedDate",
                                { format: "%M %d %Y %T", firstDOW: 1 } );
                    </script>
                    <tr>
                        <td>Target dat/time</td>
                        <td><input type="text" name="toBeCompleted" id="toBeCompleted" value="${editTask.toBeCompleted}"/><%--<span style="color: #ff0404; "><form:errors path='empAddress' /></span>--%>
                        </td>
                    </tr>
                    <script>
                        AnyTime.picker( "toBeCompleted",
                                { format: "%M %d %Y %T", firstDOW: 1 } );
                    </script>
                    <tr>
                    <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>

            </form>
        </div>

    </div>

    <hr>

    <div class="row">

        <div class="col-md-7">
            <h1>Completed Tasks</h1>
            <%--<c:if test="${!empty completedTaskList}">--%>
                <table align="left" border="1">
                    <tr>
                        <th>Task Title</th>
                        <th>Started date/time</th>
                        <th>Target date/time</th>
                        <th>Completed date/time</th>
                    </tr>

                    <c:forEach items="${completedTaskList}" var="completedTaskList">
                        <tr>
                            <td><c:out value="${completedTaskList.userTaskName}"/></td>
                            <td><c:out value="${completedTaskList.startedDate}"/></td>
                            <td><c:out value="${completedTaskList.toBeCompleted}"/></td>
                            <td><c:out value="${completedTaskList.completedDate}" /></td>

                        </tr>
                    </c:forEach>
                </table>


        </div>

        <div class="col-md-5">
            <h3>Graphical summary of individual tasks</h3>
            <p>This space will be used to illustrate the graphical representation of individual tasks using bar charts and pie charts</p>

        </div>

    </div>

    <hr>

    <div class="row">

        <div class="col-md-7">
            <a href="portfolio-item.html">
                <h1>Group tasks assigned to you</h1>

            </a>
        </div>

        <div class="col-md-5">
            <h1>Your group tasks according to each project</h1>


        </div>

    </div>

    <hr>

    <div class="row">

        <div class="col-md-7">
            <a href="portfolio-item.html">
                <h1>Group Task completed details</h1>
            </a>
        </div>

        <div class="col-md-5">
            <h1>Graphical summary of group tasks.</h1>
        </div>

    </div>

    <hr>

    <div class="row">

        <div class="col-md-7">
            <a href="portfolio-item.html">
                <h1>Genaralizations and predictions about individual tasks</h1>
            </a>
        </div>

        <div class="col-md-5">
            <h1>Genaralizations and predictions about group tasks</h1>
        </div>

    </div>

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
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/modern-business.js"></script>



</body>

</html>











