<html>
<head>
<style>
body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
    height:90%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url("bg.jpg") no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
    .input{
      margin-bottom: 10px;  
    }
   
</style>
     
    <link rel="stylesheet" type="text/css" href="/static/bootstrap.min.css"/>
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Log In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
            <form method="post" action="">
			<div class="sign-in-htm">
				<div class="group">
                   	<label for="user" class="label " >Username</label>
					<input  id="userLog" type="text" name="userName" class="input" >
                    <div id="userLogError"  class="errorsDiv" role="start"></div>
                     
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="passLog" type="password" name="password" class="input" data-type="password">
                     <div id="passLogError" class="" role="start"></div>
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input type="button" id="buttonLog" name ="button"  class="button" value="Log In">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div>
			</div>
                </form>
              <form method="post" action="">
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="userSign" name="userName" type="text" class="input" >
                    <div id="userSignError" class="" role="start"></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="passSign" type="password"  name="password" class="input" data-type="password">
                    <div id="passSignError" class="" role="start"></div>
				</div>
			<!--	<div class="group">
					<label for="passSign" class="label">Repeat Password</label>
					<input id="rePassSign" type="password" name="rePassword" class="input" data-type="password">
                    <div id="rePassSignError" class="" role="start"></div>
				</div> -->
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="mail" type="mail" name="mail" class="input">
                     <div id="mailError" class="" role="start"></div>
				</div>
				<div class="group">
					<input type="button" id="buttonSign" name ="button" class="button" value="Sign Up">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<label for="tab-1">Already Member?</a>
				</div>
                  </form >
			</div>
		</div>
	</div>
</div>
       
<script>
     var sock = new WebSocket("ws://localhost:5001");
    var message = {  
    data:"",
    to:"", 
  type:"",
};

localStorage.clear();
    var flag = true;
   //login var
    var userLogError = document.getElementById("userLogError");
    var passLogError = document.getElementById("passLogError");
    var userLog = document.getElementById("userLog");
  var passLog = document.getElementById("passLog");
  var buttonLog = document.getElementById("buttonLog");
   
    //sign up var
     var userSignError = document.getElementById("userSignError");
    var passSignError = document.getElementById("passSignError");
    var mailError = document.getElementById("mailError");
    var userSign = document.getElementById("userSign");
  var passSign = document.getElementById("passSign");
  var rePassSign = document.getElementById("rePassSign");
  var mail = document.getElementById("mail");
  var buttonSign = document.getElementById("buttonSign");
    
    //recive message from server
        sock.onmessage = function(event){
	var object = JSON.parse(event.data);
      if(object.type=="userLogError"){
            userLogError.innerHTML = object.data;
    userLogError.className = "alert alert-danger alert-dismissible ";
        }
             else if(object.type=="passLogError"){
            passLogError.innerHTML = object.data;
    passLogError.className = "alert alert-danger alert-dismissible ";
        }
                  else if(object.type=="userSignError"){
            userSignError.innerHTML = object.data;
    userSignError.className = "alert alert-danger alert-dismissible ";
        }
                       else if(object.type=="mailSignError"){
            mailError.innerHTML = object.data;
    mailError.className = "alert alert-danger alert-dismissible ";
        }
}
    
function ValidateEmail(inputText)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(inputText.value.match(mailformat))
return true;
else
return false;
}
    
  //if(localStorage.getItem("signed")=="true")
 //location.href="http://localhost:1337/chat";
 
    //if click in login
    buttonLog.onclick = function(){
         userLogError.className = "", passLogError.className = "";
        userLogError.innerHTML = "",passLogError.innerHTML = "";
        if(userLog.value==""){
             userLogError.innerHTML = "User Name must be not empty";
    userLogError.className = "alert alert-danger alert-dismissible ";
            flag = false;
        }
          if(passLog.value==""){
             passLogError.innerHTML = "Password must be not empty";
    passLogError.className = "alert alert-danger alert-dismissible";
              flag = false;
        }

        if(flag){
              localStorage.setItem("userName",userLog.value);
             localStorage.setItem("signed","true");
             message.data = "login Request";
                 message.type = "login"
           
         buttonLog.type = "submit";
           setTimeout(function(){
             sock.send(JSON.stringify(message));  
           },1000);
        }
    
    }
    
    userLog.onclick = function(){
      userLogError.innerHTML = "";
    userLogError.className = "";  
        flag = true;
    }
     passLog.onclick = function(){
      passLogError.innerHTML = "";
    passLogError.className = "";  
         flag = true;
    }
    
    //if click in signUp
     buttonSign.onclick = function(){
           userSignError.className = "",passSignError.className = "", mailError.className = "";
          userSignError.innerHTML = "",passSignError.innerHTML = "", mailError.innerHTML = "";
         if(userSign.value==""){
             userSignError.innerHTML = "User Name must be not empty";
    userSignError.className = "alert alert-danger alert-dismissible";
             flag = false;
        }  
            if(passSign.value==""){
             passSignError.innerHTML = "Password must be not empty";
    passSignError.className = "alert alert-danger alert-dismissible";
                flag = false;
        }
         if(ValidateEmail(mail)==false){
            mailError.innerHTML = "Unvalid email";
    mailError.className = "alert alert-danger alert-dismissible";
             flag = false;
         }
          if(flag){
              localStorage.setItem("userName",userSign.value);
             localStorage.setItem("signed","true");
                 message.data = "login Request";
                 message.type = "login"
         buttonSign.type = "submit";
setTimeout(function(){
             sock.send(JSON.stringify(message));  
           },1000);
        }
            
        }
     
       userSign.onclick = function(){
      userSignError.innerHTML = "";
    userSignError.className = "";  
        flag = true;
    }
         passSign.onclick = function(){
      passSignError.innerHTML = "";
    passSignError.className = "";  
        flag = true;
    }
              mail.onclick = function(){
      mailError.innerHTML = "";
    mailError.className = "";  
        flag = true;
    }
    
</script>  
    <script src="/static/bootstrap.min.js"></script> 

</body>
</html>
