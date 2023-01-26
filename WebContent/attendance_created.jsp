<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="vs.model.LoginBean" %>
<%@page import="vs.model.Fetch" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>class_to-do-list</title>

<style>
			body{
			font-family:serif;
		}
		
		.sidebtn{
			font-size:24px;
			cursor:pointer;
		}
	
		.sidebtn:hover{
			background-color:rgba(211,211,211,0.4);
		}
		
		.sidenav {
			height: 100%;
			width: 0;
			position: fixed;
			z-index: 1;
			top: 0;
			left: 0;
			background-color:  #4d94ff;
			overflow-x: hidden;
			transition: 0.5s;
			padding-top: 60px;
		}

		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #f1f1f1;
			display: block;
			transition: 0.3s;
		}

		.sidenav a:hover {
			color: #202020;
		}

		.sidenav .closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px;
			margin-left: 50px;
		}
		
			#main {
		transition: margin-left .5s;
		padding: 16px;
	}

	@media screen and (max-height: 450px) {
		.sidenav {padding-top: 15px;}
		.sidenav a {font-size: 18px;}
	}
		
		.btn{
			float:right;
			border:1px solid #0099ff;
			background-color:#0099ff;
			padding:15px;
			text-decoration:none;
			color:	#ffffff;
			font:bold 12px Arial;
			margin:5px;
			}
			
		a.btn:link{
			color:#fafafa;
		}
		
		a.btn:visited{
			color:#fafafa;
		}
		
		a.btn:hover{
			background-color:#000099;
			border:1px solid #000099;
		}
		
		.nbtn{
			padding:15px;
			padding-bottom:9px;
			text-decoration:none;
		}
		
		.nbtn:link{
			color:#505050
		}
		
		.nbtn:visited{
			color:#505050
		}
		
		.nbtn:active{
			color:#0099ff;
			border-bottom:3px solid #0099ff;
		}
		
		.nbtn:hover{
			color:#0099ff;
			border-bottom:3px solid #0099ff;
			cursor:pointer;
			background-color:rgba(211,211,211,0.4);
		}
		
		#thispage{
			color:#0099ff;
			border-bottom:3px solid #0099ff;
		}
	
		
		.card {
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			transition: 0.3s;
			padding: 30px 16px;
			margin:25px;
			width:85%;
			background-color:#fefef;
			font-size:24px;
			color:black;
			text-decoration:none;
			color:black;
			text-decoration:none;
		}
		
		.card:hover{
			background-color:#E0E0E0;	
		}
		
		.tab{
			color:black;
			text-decoration:none;
		}		
			
		.name{
			font-size:15px;
			float:right;
			margin:5px;
			color:#808080;
		}
		
</style>
</head>
<body>
		<!--sidenav-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<br>
			<a href="class_to-do.jsp"> To-do List </a><hr>
			<a href = "attendance_created.jsp"> Student Attendance</a><hr>
			
	</div>
	
		<div id="main">
		<span  onclick="openNav()" class="sidebtn">&#9776;</span>

		<!--logout-->
		<a href="homepage.jsp" class="btn"><i class="fa fa-sign-out"></i>Logout</a>
		<a href="classroom.jsp" class="btn">Classroom</a><br><br>
		
		<!-- Navigation -->
		<nav class="nbar">
			<a href="./to-do-list.jsp" class="nbtn" id="thispage"><b>Created</b></a>
			<a href="joined.jsp" class="nbtn"><b>Joined</b></a>
		</nav><hr>
		
				<%
			Connection conn = Connect.getConnection();
			PreparedStatement pst = conn.prepareStatement("select* from videos where class_code = ?");
			pst.setInt(1, Fetch.getClass_code());
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				
		%>
			<a href = "FetchVideoIdServlet?video_id=<%=result.getString("video_id") %>" class="tab">
			<div class= "card">
			<img src="./images/video_icon.png" alt="DOC" style="width:40px; height:40px;">
			<%=result.getString("file_name")%>
				<span class="name">
					 <%=result.getDate("added_date") %>
				</span><br>
			</div>
			</a>
		 
		<%
			}
		%>

</body>

<script>
function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}

</script>
</html>