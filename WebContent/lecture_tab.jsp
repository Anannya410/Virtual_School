<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.model.Fetch" %>
<%@page import="vs.model.LoginBean" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title> lecture tab</title>
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
			cursor:pointer;
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
		
		.add{
			color:#fafafa;
			background-color:#0099ff;
			position:fixed;
			bottom: 0;
			right:0;
 			margin:10px;
			width: 70px;
  			height: 70px;
		  	padding: 10px 16px;
			border:0px;
			font-size: 40px;
  			line-height: 1.33;
  			border-radius: 35px;
  			outline:none;
		}
		.add:hover{
			background-color:#000099;
			cursor:pointer;
		}
		
		.create{
			display:none;
			position: fixed;
			z-index: 1;
			left: 0px;
			top: 0px;
			width: 100%; 
			height:100%; 
			background-color: rgba(0,0,0,0.0);
		}
	
		#border{
			background-color: #fefefe;
			border: 1px solid #fefefe;
			border-radius:4px;
			box-shadow: 0 -4px 8px 0 rgba(0,0,0,0.2);
			padding:10px;
			margin:20px;
			position:absolute;
			bottom: 8px;
 			right: 16px;
			width: 30%; 
		}	
		
		
		.upload {
			background-color:#606060;
			color: white;
			padding: 12px 20px;
			margin: 8px 0;
			border: none;
			cursor: pointer;
			width: 100%;
			outline:none;
		}
			
		.upload:hover{
			opacity: 0.7;
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
			<a href="FetchServlet?class_code=<%=rs.getInt("class_code") %>"> 
				<%=rs.getString("class_name") %> 
			</a><hr>
		<% 
			}
		%>
		
		
		<!--class list joined-->
		 <%
			PreparedStatement st = conn.prepareStatement("select* from join_info where email = ?");
			st.setString(1,LoginBean.getUname());
			ResultSet rst = st.executeQuery();
			while(rst.next()) {
	 	%>
			<a href = "FetchServlet?class_code=<%=rst.getInt("class_code") %>">
				<%=rst.getString("class_name") %>
			</a><hr>
		<%
			}
		%>
	</div>

	<div id="main">
		<span  onclick="openNav()" class="sidebtn">&#9776;</span>

		<!--logout-->
		<a href="homepage.jsp" class="btn"><i class="fa fa-sign-out"></i>Logout</a>
		<a href="to-do-list.jsp" class="btn">Myspace</a><br><br>
		<!-- Navigation -->
		<nav class="nbar">
			<a href="lecture_tab.jsp" class="nbtn" id="thispage" target="_self"><b>Lecture</b></a>
			<a href="classwork_tab.jsp" class="nbtn" target="_self"><b>Classwork</b></a>
			<a href="assign_tab.jsp" class="nbtn" target="_self"><b>Assignment</b></a>			
			<a href="offline_tab.jsp" class="nbtn" target="_self"><b>Offline assessment</b></a>
		</nav><hr>
  		<%
			PreparedStatement pst = conn.prepareStatement("select* from videos where class_code = ?");
			pst.setInt(1, Fetch.getClass_code());
			ResultSet rpst = pst.executeQuery();
			while(rpst.next()) {
		 %>
		 
 			<a href = "FetchVideoServlet?video_id=<%=rpst.getInt("video_id")%>&added_date=<%=rpst.getDate("added_date") %>" class="tab">
			<div class=card>
					<img src="./images/video_icon.png" alt="DOC" style="width:40px; height:40px;">
					<%=rpst.getString("file_name") %>
					<span class="name"><%=rpst.getString("fname") %>
					<%=rpst.getString("lname") %><br><%=rpst.getDate("added_date") %></span>
			 </div>
           </a>
	<%
			}
	%>

    <!--add button-->
	<div id="div1" class="create">
	<div id="border">
	<form action="<%= request.getContextPath() %>/UploadVideoServlet"  method ="post" enctype="multipart/form-data">
		 <input type="file" id="file" name="file" required><br>
		 <button type="submit" class="upload">Save</button><br>
	</form>
	</div>
	</div>
	<%
		PreparedStatement pps = conn.prepareStatement("select* from class_info where class_code = ? and email = ?");
		pps.setInt(1, Fetch.getClass_code());
		pps.setString(2, LoginBean.getUname());
		ResultSet rslt = pps.executeQuery();
		while(rslt.next()){
	%>
	
	<button onclick="document.getElementById('div1').style.display='block'" class="add">&#43;</button>
	
	<%
		}
	%>
  </form>
    
	</div>
<script>
	var create = document.getElementById('div1');

	window.onclick = function(event) {
		if (event.target == create) {
		create.style.display = "none";
		}
	}
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	
	
</script>

</body>
</html>