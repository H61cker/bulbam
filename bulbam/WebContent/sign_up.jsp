<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="apple-mobile-wep-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>CodeIgniter</title>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="include/js/jquery-3.0.0.min.js"></script>
    <link rel='stylesheet' href="include/css/bootstrap.css" />
    <style>
        .mbd_form{
            text-align: center;
            width:  50%;
            margin: 0 auto;
        }

        .mbd_margin{
            marign-top: 80px;
            margin-bottom: 80px;
        }
    </style>
    <script>
    
  	
 	function checkInput()
 	{
 		
 		var email = $("#id").val();
 		var password = $("#password").val();
 		var name = $("#username").val();
 		
	//	console.log(email + "  " + password + "  " + name);
	
		if(email.trim()==""){
			alert("이메일이 입력되지 않았습니다.");
			return false;
		}
		
		if(password.trim()==""){
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		}
		
		if(name.trim()==""){
			alert("이름이 입력되지 않았습니다.");
			return false;
		}
 		
		return true;
 	}
  	
    $(document).ready(function(){
        $("#teacher").change(function(){
            if($("#teacher").is(":checked")){
            	//$('.StuGroup').remove();
            	document.getElementsByClassName("StuGroup")[0].innerHTML = '';
                
            }
        });
        $("#student").change(function(){
            if($("#student").is(":checked")){
            	
            	document.getElementsByClassName("TeaGroup")[0].innerHTML = '';
            	
            	var output = '';
            	output += '<div class="form-group">';
                output += '	<label for="group">학년::반</label>';
                output += '	<select class="form-control" name="group">';
                output += ' 	<option>1학년1반</option>';
                output += '     <option>1학년2반</option>';
                output += '     <option>1학년3반</option>';
                output += ' </select>';
            	output += '</div>';
            	
            	output += '<div class="form-group">';
                output += '  <label for="gender">번호</label>';
                output += '     <select class="form-control" name="identi">';
                output += '           <option>1</option>';
                output += '           <option>2</option>';
                output += '           <option>3</option>';
                output += '           <option>4</option>';
                output += '           <option>5</option>';
                output += '           <option>6</option>';
                output += '           <option>7</option>';
                output += '           <option>8</option>';
                output += '           <option>9</option>';
                output += '           <option>10</option>';
                output += '           <option>11</option>';
                output += '           <option>12</option>';
                output += '           <option>13</option>';
                output += '           <option>14</option>';
                output += '           <option>15</option>';
                output += '           <option>16</option>';
                output += '           <option>17</option>';
                output += '           <option>18</option>';
                output += '           <option>19</option>';
                output += '           <option>20</option>';
                output += '    </select>';
                output += '</div>';
            	
            	
            	
                document.getElementsByClassName("StuGroup")[0].innerHTML = output;
            }
        });
    });
    
    </script>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1> Register here! </h1>
        </div>

        <!-- 폼 전송 시 : POST 로 name 데이터가 넘어간다. -->

<!--   아이디 : userid 비밀번호 : password 이름 : username , 성별 : gender , 학년::반 : group  번호 : identi  -->


        <form class="mbd_form" action="user_register" method="post" onsubmit="return checkInput();">
            <label for="id">이메일</label>
            <div class="input-group">
                <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
                <input type="text" class="form-control" id="id" name="userid" placeholder="영문자 또는 숫자만 허용">
            </div>

            <br>

            <label for="password">비밀번호</label>
            <div class="input-group">
                <span class="input-group-addon"> <span class="glyphicon glyphicon-lock"> </span> </span>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
            </div>

            <br>

            <div class="form-group">
                <label for="username">이름</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="이름">
            </div>

            <div class="radio-inline">
				  <label>
				    <input type="radio" name="school" id="teacher" value="teacher">
				   	선생님
				  </label>
			</div>
			<div class="radio-inline">
				  <label>
				    <input type="radio" name="school" id="student" value="student">
				    학생
				  </label>
			</div>
            
            
            
            <!-- 선생님 -->
            <div class="TeaGroup">
            	
            	
            	
            </div>
            
            
            <!-- 학생 -->
            <div class="StuGroup">
	            
	            
            </div>

            <div class="controls">
                <p class="help-block"></p>
            </div>

            <a href="#myModal" data-toggle="modal">이용 규칙</a><p></p>


            <div class="form-actions text-center">
                <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
                <button type="submit" class="btn btn-warning" onclick="history.go(-1)"> 가입취소 <i class="fa fa-times spaceLeft"></i></button>
            </div>

        </form>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel"> 이용 규칙 </h4>
                    </div>
                    <div class="modal-body">
                        <p> test </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div> <!-- 모달 콘텐츠 -->
            </div> <!-- 모달 다이얼로그 -->
        </div> <!-- 모달 전체 윈도우 -->
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="include/js/bootstrap.min.js"></script>

</body>
</html>
