
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
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
			width: 50%;
			margin: 0 auto;
			padding: 25px 25px;
			margin-top:70px;
			}
		
		h1{
				font-size:+40;
				font-weight: bold;
				font-family: Georgia, serif;
				text-align: center;
			}
			
			input[type=text], input[type=password]{
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
			
			.imgcontainer {
				text-align: center;
				margin: 24px 0 12px 0;
				position: relative;
			}

			img.avatar {
				width: 15%;
				border-radius: 50%;
			}
		</style>
</head>
<body>
	<div class="box" >

	<form action="<%= request.getContextPath() %>/login" method="post" id="reach">
		<div class="imgcontainer">
			<img src="./images/avatar.jpg" alt="Avatar" class="avatar">
		</div>
		
		<div class="container">
			<label for="uname"><b>User Name:</b></label><br>
			<input type="text" id="uname" name="uname" placeholder="Enter Username" required><br>
				
			<label for="pass"><b>Password:</b></label><br>
			<input type="password" id="pass" name="pass" placeholder="Enter Password" required><br>

			<button type="submit">Login</button><br>
				
			
		</div>
		
		<div class="container" id="foot">
			<a href="homepage.jsp" class="cancelbtn">Cancel</a>
			<span class="psw" style="color:#000000">Don't have an <a href="registration.jsp">account?</a></span>
		</div>
		
	</form>
</div>
</body>
</html>