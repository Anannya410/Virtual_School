<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.model.Fetch" %>
<%@page import="vs.model.FetchAssignment" %>
<%@page import ="vs.model.LoginBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>To be marked</title>
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
	
		.card{
			margin-bottom:15px;
			margin-top:0px;
			padding:10px;
			width:90%;
			background-color:#fefefe;
			font-size:20px;
			text-align:left;
			transition: 0.5s ease;
			border:1px solid black;
			outline:none;
			border-radius:10px;
		}
	
		.card:hover{
			border-radius:10px;
			color:black;
			transition: 0.5s ease;
			box-shadow: 5px 5px 15px rgba(0,0,0,0.6);	
			pointer:cursor;
		}
	
		.name{
			color:#0099ff;
	 		text-decoration:none;
		}	
	
</style>
</head>
<body>
	<a href="class_to-do.jsp" class="close">&times;</a><br><br><br>
  		
  	<!-- Navigation -->
	<nav class="nbar">
		<a href="marked.jsp" class="nbtn" target="_self"><b>Marked</b></a>
		<a href="ToBeMarked.jsp" class="nbtn"  target="_self"><b>Unmarked</b></a>			
		<a href="not-submitted.jsp" class="nbtn" id="thispage" target="_self"><b>Not Submitted</b></a>
	</nav><hr style="margin-bottom:20px;">
  
  <%
  	Connection conn = Connect.getConnection();
  
  	PreparedStatement ps = conn.prepareStatement("select* from join_info where class_code = ? and email not in " + 
  			" (select email from submitted where class_code = ? and title = ?)");
  	ps.setInt(1, Fetch.getClass_code());
  	ps.setInt(2, Fetch.getClass_code());
  	ps.setString(3, FetchAssignment.getTitle());
  	ResultSet rst = ps.executeQuery();
  	
  	while(rst.next()){
  	
  %>
  
	<div type="button" class="card">
		<span class="name"><%=rst.getString("fname")%> <%=rst.getString("lname")%></span>
    </div>
    
   
  <%
  	}
  %>
</body>

</html>