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
<title>Submitted</title>
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
	
		.expand{
		
	    width:90%;
	   	margin-bottom:15px;
		margin-top:0px;
		border:1px solid black;
		border-radius:10px;
	}
	
	.card{
		padding:10px;
		 width:90%;
	   	margin-bottom:15px;
		margin-top:0px;
		border:1px solid black;
		border-radius:10px;
		background-color:#fefefe;
		font-size:20px;
		text-align:left;
		transition: 0.5s ease;
	}
	
	.card:hover{
		border-radius:10px;
		color:black;
		transition: 0.5s ease;
		box-shadow: 5px 5px 15px rgba(0,0,0,0.6);	
		pointer:cursor;
	}
	
	
	form{
		padding:10px;
	}
	
	.name, .name2{
		color:#0099ff;
	 	text-decoration:none;
	}
	
	.name:hover{
		color:#000099
	}	

	.marks{
		float:right;
	}
	
	input[type=number]{
				width: 20%;
				display: inline-block;
				border:none;
				box-sizing: border-box;
                color:	#606060;
			}
			
	.upload {
		background-color:#606060;
		color: white;
		padding:5px;
		border: none;
		cursor: pointer;
		width: 20%;
		outline:none;
	}
			
	.upload:hover{
		opacity: 0.7;
	}
	
			.assessments{
			color:#B0C4DE;
			font-size:20px;
		}
</style>
</head>
<body>
 	<a href="joined.jsp" class="close">&times;</a><br><br><br>
  
    <!-- Navigation -->
	<nav class="nbar">
		<a href="Unsubmitted.jsp" class="nbtn" id="thispage" target="_self"><b>Submitted</b></a>
		<a href="toBeSubmitted.jsp" class="nbtn"  target="_self"><b>Unsubmitted</b></a>	
		<a href="attendance_joined.jsp" class="nbtn"  target="_self"><b>Attendance</b></a>			
	</nav><hr style="margin-bottom:20px;">
  
  <%
  	Connection conn = Connect.getConnection();
  
  	PreparedStatement ps = conn.prepareStatement("select* from submitted where email = ? and class_code= ?");
  	ps.setString(1, LoginBean.getUname());
  	ps.setInt(2, Fetch.getClass_code());
 
  	ResultSet rst = ps.executeQuery();
  	
  	while(rst.next()){
  	
  %>
		<div class="card">
			<a href="AdownloadServlet?title=<%=rst.getString("title")%>&email=<%=rst.getString("email")%>" class="name" title="click to download document"><%=rst.getString("title")%></a>
			
			<%
			 if(rst.getInt("marks") == 0){
			%>
 				<span class="marks" style="color:red"> Unmarked </span>
 			
 			<%
			 }
			 else{
 			%>
 				<span class="marks">Marks : <%=rst.getInt("marks")%>/<%=rst.getInt("max_marks")%></span>
 			<%
			 }
 			%>
 		</div> 
    
   
  <%
  	}
  %>
   
   	<br><hr>
   	<span class="assessments">Assessments</span>
   	<br>
   	
    <%
  	PreparedStatement pst = conn.prepareStatement("select* from assess_marks where email = ? and class_code= ?");
  	pst.setString(1, LoginBean.getUname());
  	pst.setInt(2, Fetch.getClass_code());
 
  	ResultSet rs = pst.executeQuery();
  	
  	while(rs.next()){
  	
  %>
		<div class="card">
			<span class="name2"><%=rs.getString("title")%></span>
			<span class="marks">Marks : <%=rs.getInt("marks")%>/<%=rs.getInt("max_marks")%></span>
 		</div> 
    
   
  <%
  	}
  %>
</body>

</html>