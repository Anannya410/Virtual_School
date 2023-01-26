<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sign up</title>
</head>
	<style>
		body{
			background-image:url('./images/lblue.jpg');
			background-repeat: no-repeat;
			background-attachment:fixed;
			background-size:cover;
			color:#fafafa;
		}
		form {
			border: 1px solid;
			border-color: rgba(0,0,0,0);
			background-color: rgba(0,0,0,0.3);
			width: 85%;
			margin: 0 auto;
			padding: 25px 25px;
			}
		
		h1{
				font-size:+40;
				font-weight: bold;
				font-family: Georgia, serif;
				text-align: center;
			}
			
		h4{
			font-family: Georgia, serif;
			text-align: center;
			padding-top:0px;
		}
			
			input[type=text], input[type=password], #radiobtn {
				width: 100%;
				padding: 12px 20px;
				margin: 8px 0;
				display: inline-block;
				border: 1px solid #ccc;
				box-sizing: border-box;
				background: #f1f1f1;
                color:	#606060;
			}
			
			
			button {
				background-color: #0099ff;
				color: white;
				padding: 12px 20px;
				margin: 8px 0;
				border: none;
				cursor: pointer;
				width: 100%;
			}
			
			button:hover{
			opacity: 0.7;
			}
			
			
			.container{
				padding:16px;
			}
			
			span.psw {
				float: right;
			}
			
			#foot{
				border:1px solid #C0C0C0;
				background-color:#C0C0C0;
				padding:25px 25px;
			}
			
			.cancelbtn{
				border:1px solid red;
				background-color:red;
				padding-right:20px;
				padding-left:20px;
				padding-top:10px;
				padding-bottom:10px;
				text-decoration:none;
				color:#fafafa;
				font:bold 12px Arial;
			}
			
			.box-content {
				background-color: #fefefe;
				margin: 5% auto 15% auto; 
				border: 1px solid #888;
				width: 80%; 
			}
			
			
			
		</style>
<body>
<div class="box" >

	<form action="<%= request.getContextPath() %>/register" method="post" id="reach">
		<h1>SIGN UP</h1>
		<h4 >Please fill all details to register!</h4>
		
		<div class="container">
			<label for="fname"><b>First Name:</b></label><br>
			<input type="text" id="fname" name="fname" placeholder="Enter First Name" required><br>
		
			<label for="lname"><b>Last Name:</b></label><br>
			<input type="text" id="lname" name="lname" placeholder="Enter Last Name" required><br>

			<b>Profession:</b>
            <div id="radiobtn">
				<input type="radio" id="teacher" name="isStudent" value="teacher" required>
				<label for="teacher">Teacher</label>
				<input type="radio" id="student" name="isStudent" value="student" required>
				<label for="student">Student</label>
			</div>
			
			<label for="email"><b>Email:</b></label><br>
			<input type="text" id="email" name="email" placeholder="Enter Email" required><br>
				
			<label for="pass"><b>Password:</b></label><br>
			<input type="password" id="pass" name="pass" placeholder="Enter Password" required><br>
			

			<button type="submit">Submit</button><br>
		</div>
		
		<div class="container" id="foot">
				<a href="homepage.jsp" class="cancelbtn">Cancel</a>
				<span class="psw" style="color:#000000">Have an <a href="login.jsp">account?</a></span>
		</div>
	</form>
</div>

</body>
</html>