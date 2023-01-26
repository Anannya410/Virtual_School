<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.model.Fetch" %>
<%@page import="vs.model.FetchAssignment" %>

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
	
		.expand{
		
	    width:90%;
	   	margin-bottom:15px;
		margin-top:0px;
		border:1px solid black;
		border-radius:10px;
	}
	
	.card{
		padding:10px;
		width:100%;
		background-color:#fefefe;
		font-size:20px;
		text-align:left;
		transition: 0.5s ease;
		border:none;
		outline:none;
		border-radius:10px;
	}
	
	.expand:hover{
		border-radius:10px;
		color:black;
		transition: 0.5s ease;
		box-shadow: 5px 5px 15px rgba(0,0,0,0.6);	
		pointer:cursor;
	}
	
	.submit{
		display: none;
  		margin:10px;
  		margin-top:0px;
  		padding:10px;
  		padding-top:0px;
	}
	
	.name{
		color:#0099ff;
	 	text-decoration:none;
	}	
	
	.name:hover{
		color:#000099
	}

	.marks{
		float:right;
	}
	
	form{
		padding:10px;
	}
	
	input[type=number]{
				width: 5%;
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
		width: 10%;
		outline:none;
	}
			
	.upload:hover{
		opacity: 0.7;
	}
</style>
</head>
<body>
	<a href="class_to-do.jsp" class="close">&times;</a><br><br><br>
  		
  	<!-- Navigation -->
	<nav class="nbar">
		<a href="marked.jsp" class="nbtn" target="_self"><b>Marked</b></a>
		<a href="ToBeMarked.jsp" class="nbtn" id="thispage" target="_self"><b>Unmarked</b></a>			
		<a href="not-submitted.jsp" class="nbtn" target="_self"><b>Not Submitted</b></a>
	</nav><hr style="margin-bottom:20px;">
  
  <%
  	Connection conn = Connect.getConnection();
  	PreparedStatement ps = conn.prepareStatement("select* from submitted where title = ? and class_code = ?");
  	ps.setString(1, FetchAssignment.getTitle());
  	ps.setInt(2, Fetch.getClass_code());
  	ResultSet rs = ps.executeQuery();
  	
  	while(rs.next()){
  		if(rs.getInt("marks") == 0){
  %>
    
    <div class="expand">
		<button type="button" class="card">
			<a href="AdownloadServlet?title=<%=rs.getString("title")%>&email=<%=rs.getString("email")%>" class="name" title="click to download document"><%=rs.getString("fname")%> <%=rs.getString("lname")%></a>
 			<span class="marks">Submitted on : <%=rs.getDate("submitted_date")%></span>
 		</button> 
    
    	<div class="submit">
			<form action="<%= request.getContextPath()%>/GiveMarksServlet" method="post">
    			<input type="hidden" name="email" value="<%=rs.getString("email") %>">
    			<input type="number" name="marks" > / <%=rs.getInt("max_marks")%><br>
    			<button type="submit" class="upload">Check</button>
    		</form>
		 </div>
	</div>
   
  <%
  		}
  	}
  %>
</body>

<script>
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