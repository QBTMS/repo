<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>QBTMS - Manage your valuable time</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- You'll want to use a responsive image option so this logo looks good on devices - I recommend using something like retina.js (do a quick Google search for it and you'll find it) -->
            <a class="navbar-brand" href="index.html">QBTMS</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="services.html">Services</a>
                </li>
                <li><a href="add-task.html">Login</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Signup <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <form method="GET" action="/mvccrud/add-user.html" commandName="addUser">
                                User name:<input type="text" name="userName" />
                                Password: <input type="password" name="password"/>
                                <input type="submit" value="Signup">
                            </form>
                        </li>
                    </ul>
                </li>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="blog-home-1.html">Blog Home 1</a>
                        </li>
                        <li><a href="blog-home-2.html">Blog Home 2</a>
                        </li>
                        <li><a href="blog-post.html">Blog Post</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<div id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=.');"></div>
            <div class="carousel-caption">
                <h1 style="color: #101010">Person can't buy time by spending money.  But he can earn money by spending time wisely. Therefore the time management is essential.  Because of that the time is described as money.</h1>
            </div>
        </div>
        <div class="item">
            <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=.');"></div>
            <div class="carousel-caption">
                <h1 style="color: #101010">Be mindful of how you approach time. Watching the clock is not the same as watching the sun rise.? Sophia Bedford-Pierce</h1>
            </div>
        </div>
        <div class="item">
            <div class="fill" style="background-image:url('http://placehold.it/1900x1080&te&text=.');"></div>
            <div class="carousel-caption">
                <h1 style="color: #101010">Time is really the only capital that any human being has, and the only thing he can't afford to lose.- Thomas Edison</h1>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>
</div>

<div class="section">

    <div class="container">

        <div class="row">
            <div class="col-lg-4 col-md-4">
                <h3><i class="fa fa-check-circle"></i> Basic Features</h3>
                <p>This space for give some undestanding to user about basic features of this application</p>
            </div>
            <div class="col-lg-4 col-md-4">
                <h3><i class="fa fa-pencil"></i> How to use the application for individual tasks</h3>
                <p>This space for give some introduction to user about how they can use this application for  manage their individual tasks and what are the benifits they can gain from this application</p>
            </div>
            <div class="col-lg-4 col-md-4">
                <h3><i class="fa fa-folder-open"></i> How to use this application for manage group projects</h3>
                <p>This space for give some introduction to user about how they can use this application to manage their goupt projects</p>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /.section -->

<div class="section-colored text-center">

    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h2>This space for add a adviceble quotes regarding time management, work management etc. It will change weekly</h2>
                <p>This space for give some comprehensive understanding about above quote.</p>
                <hr>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /.section-colored -->

<div class="section">

    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>Some screen shots of the application features</h2>
                <hr>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-home-portfolio" src="http://placehold.it/700x450">
                </a>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /.section -->

<div class="section-colored">

    <div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <h2>Recent blog article and of the site</h2>
                <p>This space will be used to add a summary of recent blog post of the site blog</p>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <img class="img-responsive" src="http://placehold.it/700x450/ffffff/cccccc">
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /.section-colored -->

<div class="section">

    <div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <img class="img-responsive" src="http://placehold.it/700x450">
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <h2>Recent blog article and of the site</h2>
                <p>This space will be used to add a summary of recent blog post of the site blog</p>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

</div>
<!-- /.section -->

<div class="container">

    <div class="row well">
        <div class="col-lg-8 col-md-8">
            <h4>Queue Based Time Management and Work Scheduling Application - Please signup for to be perfect</h4>

        </div>
        <div class="col-lg-4 col-md-4">
            <a class="btn btn-lg btn-primary pull-right" href="http://startbootstrap.com">Signup</a>
        </div>
    </div>
    <!-- /.row -->

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


<%--<h2>Spring3MVC with Hibernate3 CRUD Example using Annotations</h2>--%>
<%--<h2>1. <a href="employees.html">List of Employees</a></h2>--%>
<%--<h2>2. <a href="add.html">Add Employee</a></h2>--%>
<%--<h2>3. <a href="addVehicle.html">Add Vehicle</a> </h2>--%>
<%--<h>4 <a href="add-task.html">Add tasks</a> </h>--%>