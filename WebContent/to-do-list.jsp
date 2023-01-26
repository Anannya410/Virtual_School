<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.controller.AdownloadServlet" %>
<%@page import ="vs.model.LoginBean" %>
<%@page import="vs.model.Fetch" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>to-do list</title>

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
		
	
		.sname{
			color:#B0C4DE;
			font-size:20px;
			padding:15px;
			padding-bottom:9px;
			text-decoration:none;
		}
		
		.sname:hover{
			cursor:pointer;
			color:#606060;
		}
		
		.card{
			display:grid;
			width:23%;
			grid-template-rows:200px 100px;
			grid-template-areas: "name" "text";
		
			border-radius:18px;
			box-shadow: 5px 5px 15px rgba(0,0,0,0.9);
			text-align:center;
			margin:20px;
			float:left;
			background-color:#D8BFD8;;
			transition: 0.5s ease;
			cursor:pointer;
		
			color:black;
			text-decoration:none;
		}
		
	.class-name{
		grid-area:name;
		background-image: url("./images/class3.jpg");
		background-size:cover;
		border-radius:18px;
		color:black;
		
	}
		
	.card-text{
		grid-area:text;
	}
		
	.card:hover{
		transform: scale(1.05);
		box-shadow: 5px 5px 15px rgba(0,0,0,0.6);
			
	}
		
	
		
			
			
</style>
</head>
<body>
	<!--sidenav-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<br>
		
		
				<!--class-list created-->
		<%
			Connection conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement("select* from class_info where email = ?");
			ps.setString(1, LoginBean.getUname());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
		 %>
			<a href="TodoServlet?class_code=<%=rs.getInt("class_code") %>"> 
				<%=rs.getString("class_name") %> 
			</a><hr>
		<% 
			}
		%>
	</div>

	<div id="main">
		<span  onclick="openNav()" class="sidebtn">&#9776;</span>

		<!--logout-->
		<a href="homepage.jsp" class="btn"><i class="fa fa-sign-out"></i>Logout</a>
		<a href="classroom.jsp" class="btn">Classroom</a><br><br>
		
		<!-- Navigation -->
		<nav class="nbar">
			<a href="to-do-list.jsp" class="nbtn" id="thispage"><b>Created</b></a>
			<a href="joined.jsp" class="nbtn"><b>Joined</b></a>
		</nav><hr>
	
			<!--class list created-->
	 	<%
			PreparedStatement pst = conn.prepareStatement("select* from class_info where email = ?");
			pst.setString(1, LoginBean.getUname());
			ResultSet rst = pst.executeQuery();
			while(rst.next()) {
	 	%>
	 	
		<!--cards-->
		<a href = "TodoServlet?class_code=<%=rst.getInt("class_code") %>" class="card">
			<div class="class-name">
				<h1 style="font-size:40px;padding-top:20px;"><%=rst.getString("class_name") %> </h1>
				<span style="font-size:20px"><%=rst.getString("section") %></span>
			</div>
			<div class="card-text">
				<span style="float:left;margin-top:20%;padding:10px;color:#383838"><%=rst.getString("fname")%> <%=rst.getString("lname") %></span>
				<span style="float:right;margin-top:20%;padding:10px;color:#383838">Class code: <%=rst.getInt("class_code") %> </span>
			</div>
		</a>
	<%
			}
	%>
			
		</div>
</body>

<script>

function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}

var card = document.getElementsByClassName("card");
var i;

for (i = 0; i < card.length; i++) {
  card[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var submit = this.nextElementSibling;
    if (submit.style.display === "block") {
      submit.style.display = "none";
    } else {
      submit.style.display = "block";
    }
  });
}
</script>
</html>