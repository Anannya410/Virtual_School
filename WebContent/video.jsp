<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.model.FetchVideo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>lectures</title>
<style>
	body{
		font-family:serif;
	}

	.close{
		float:right;
		border:1px solid #0099ff;
		background-color:#0099ff;
		padding:10px;
		text-decoration:none;
		color:	#ffffff;
		font:bold 20px Arial;
		margin:5px;
	}
		
	.close:hover{
		background-color:#000099;
		border:1px solid #000099;
	}
	
	.control_btn{
		outline:none;
		border:none;
		background-color:#fafafa;
	}
	
	.control_btn:hover{
		cursor:pointer;
	}
</style>
</head>
<body>

	<a href="CloseVideoServlet" class="close">&times;</a><br><br><br>

	<%
			Connection conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement("select* from videos where video_id = ?");
			ps.setInt(1, FetchVideo.getVideo_id());
			ResultSet rs = ps.executeQuery();
			rs.next();
	%>

<div style="text-align:center"> 
  <video id="video1" width="900">
    <source src="<%=rs.getString("src")%>" type="video/mp4">
</video>
  
   <br><br>
</div>

</body>

<script>
//video player
var myVideo = document.getElementById("video1"); 
enableControls();

function enableControls() { 
	  myVideo.controls = true;
	  myVideo.load();
	} 

</script>
</html>