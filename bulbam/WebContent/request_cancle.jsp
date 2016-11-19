<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>request</title>
  <link href="include/css/bootstrap.min.css" rel="stylesheet">
  <style type="text/css">
    .margin_top{
      margin-top: 50px;
    }
  </style>
</head>
<body>
  <div class="container">
    <header>
      <ul class="nav nav-tabs">
           <li><a href="#">Home</a></li>
           <li class="active"><a href="#">Night</a></li>
           <li><a href="#">List</a></li>
            <a class="navbar-brand navbar-right" href="#">
                <img alt="brand" src="include/img/dgsw_logo.png">
            </a>
      </ul>
    </header>
    <p class="margin_top"></p>
    <div class="container"> 
     <div class="jumbotron">
      <div class="container text-center">
        <h1 style="color:#b82601">ì¬ì ì·¨ì í  ì¬ë~!</h1><br>
        <p>ì ë§ë¡???</p>
      </div>
    </div>
    <div class="center">
    
    <form class="margin_top" action="#" method="GET">
      
      <input type="hidden" name="night_study" value="no">
      <button type="submit" class="btn btn-danger btn-lg btn-block"> 
        <span class="glyphicon glyphicon-hand-down" style="font-size:25px"></span>
          ì¬ì¼ ìì¨ íìµ ì·¨ì
        <span class="glyphicon glyphicon-hand-down" style="font-size:25px"></span>
      </button>

    </form>

     </div>
     <footer class="text-center margin_top">
        <div class="panel panel-default">
          <div class="panel-body text-center">
              All Copyright Reserved 2016- DGSW Web Server<br>
              DGSW 2016-2016 DGSW WEB SERVER PROJECT TEAM
          </div>
        </div>

     </footer>
  </div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="include/js/bootstrap.min.js"></script>

</html>