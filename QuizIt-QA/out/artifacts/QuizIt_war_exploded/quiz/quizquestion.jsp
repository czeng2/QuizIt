<%@ page import="quiz.*, user.*, java.util.*" %>
<% IUserRepository user = (UserRepository) session.getAttribute("user"); %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Add Quiz Question</title>
    <script src="/quiz/createquiz.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/starter-template.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">QuizIt</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/user/userHomePage.jsp">Home</a></li>
                <li class="active"><a href="/quiz/quizhomepage.jsp">Quiz</a></li>
                <li><a href="/user/userFeed.jsp">Feed</a></li>
                <% if(user.isAdmin(user.getUsername())) {
                    out.println("<li><a href='/admin/dashboard.jsp'>Admin</a></li>");
                }
                %>
                <li><a href="/user/messages.jsp">&#128172;</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="/SignOutServlet" method="post">
                <button type="submit" class="btn btn-primary">Sign Out</button>
            </form>
            <form class="navbar-form navbar-right" action="/UserSearchServlet" method="post">
                <div class="form-group">
                    <input type="text" placeholder="&#128269;" class="form-control" name="username">
                </div>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<div class="container">

    <div class="starter-template">
        <div class="col-md-4 col-md-offset-4">
            <h1>Quiz Creator</h1>
            <form id="questionform" action="/CreateQuestionServlet" method="post">
                <div class="form-group">
                    <%
                        String lastQuestionType = (String) request.getAttribute("lastquestiontype");
                    %>
                    <input type="hidden" name="lastquestiontype" value="<%=lastQuestionType%>"/>
                    <h4>Question <%out.println(0);%></h4>
                    <span id = "dynamic"></span>
                    <p><script>var jsVar ="<%out.print(lastQuestionType);%>"; addQuestion(jsVar)</script></p>
                    <input type="hidden" name="jspName" value="test" />
                    <label for="questiontype">Select Question Type</label>
                    <select class="form-control" id="questiontype" name="questiontype">
                        <option value="qresponse" selected="selected">Question-Response</option>
                        <option value="fillblank">Fill in the Blank</option>
                        <option value="multiplechoice">Multiple Choice</option>
                        <option value="pictureresponse">Picture-Response</option>
                    </select><br>
                    <p><button type="submit" name="add" class="btn btn-primary">Add Question</button></p>
                    <%--<input type="submit" name="add" value="Add Question">--%>
                    <p><button type="submit" name="complete" class="btn btn-success">Complete Quiz</button></p>
                    <%--<input type="submit" name="complete" value="Complete Quiz">--%>
                </div>
            </form>
        </div>
    </div>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>