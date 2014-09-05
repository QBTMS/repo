<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: prasad
  Date: 6/7/14
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    &lt;%&ndash;<link href="signin.css" rel="stylesheet">&ndash;%&gt;

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    &lt;%&ndash;<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->&ndash;%&gt;
    &lt;%&ndash;<script src="../../assets/js/ie-emulation-modes-warning.js"></script>&ndash;%&gt;

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    &lt;%&ndash;<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>&ndash;%&gt;

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container">

    <h3>Login with Username and Password</h3>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>

    <form class='form-horizontal' name='loginForm'
          action="<c:url value='/j_spring_security_check' />" method='POST'>
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" name="username" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        &lt;%&ndash;<input type="hidden" name="${_csrf.parameterName}"&ndash;%&gt;
        &lt;%&ndash;value="${_csrf.token}" />&ndash;%&gt;
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link class="cssdeck" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" class="cssdeck">
</head>
<body>
<div class="" id="loginModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>Have an Account?</h3>
    </div>
    <div class="container">
        <div class="well">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                <li><a href="#create" data-toggle="tab">Create Account</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="login">
                    <form class='form-horizontal' name='loginForm'
                          action="<c:url value='/j_spring_security_check' />" method='POST'>
                        <fieldset>
                            <div id="legend">
                                <legend class="">Login</legend>
                            </div>
                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label"  for="username">Email</label>
                                <div class="controls">
                                    <input type="text" id="username" name="username" placeholder="" class="input-xlarge">
                                </div>
                            </div>

                            <div class="control-group">
                                <!-- Password-->
                                <label class="control-label" for="password">Password</label>
                                <div class="controls">
                                    <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                                </div>
                            </div>


                            <div class="control-group">
                                <!-- Button -->
                                <div class="controls">
                                    <button class="btn btn-success">Login</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="tab-pane fade" id="create">
                    <form id="tab" action="create-account.html" method="POST">
                        <label>Name</label>
                        <input type="text" name="name" class="input-xlarge">
                        <label>Email</label>
                        <input type="text" name="email" class="input-xlarge">
                        <label>Password</label>
                        <input type="password"  name="password" rows="3" class="input-xlarge">

                        <div>
                            <button class="btn btn-primary">Create Account</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
</body>
</html>