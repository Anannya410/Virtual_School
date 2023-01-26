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
<title>Unsubmitted</title>
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
	
	form{
		padding:10px;
	}
	
	.name{
		color:#0099ff;
	 	text-decoration:none;
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
</style>
</head>
<body>
 	<a href="joined.jsp" class="close">&times;</a><br><br><br>
  
    <!-- Navigation -->
	<nav class="nbar">
		<a href="Unsubmitted.jsp" class="nbtn" target="_self"><b>Submitted</b></a>
		<a href="toBeSubmitted.jsp" class="nbtn" id="thispage" target="_self"><b>Unsubmitted</b></a>
		<a href="attendance_joined.jsp" class="nbtn"  target="_self"><b>Attendance</b></a>			
	</nav><hr style="margin-bottom:20px;">
  
  <%
  	Connection conn = Connect.getConnection();
  
  	PreparedStatement ps = conn.prepareStatement("select* from assignment where class_code = ? and assignment_id not in " + 
  			" (select assignment_id from submitted where class_code = ? and email = ?)");
  	ps.setInt(1, Fetch.getClass_code());
  	ps.setInt(2, Fetch.getClass_code());
  	ps.setString(3, LoginBean.getUname());
  	ResultSet rst = ps.executeQuery();
  	
  	while(rst.next()){
  	
  %>
	<div class="expand">
		<button type="button" class="card">
			<span class="name"><%=rst.getString("title")%></span>
 			<span class="marks">Max Marks : <%=rst.getInt("max_marks")%></span>
 		</button> 
    
    	<div class="submit">
			<form action="<%= request.getContextPath() %>/AuploadServlet" method ="post" enctype="multipart/form-data">
				<input type="hidden" name="assignment_title" value="<%=rst.getString(2) %>">
				<input type="hidden" name="max_marks" value="<%=rst.getInt("max_marks")%>">
		 		<input type="file" id="file" name="file" required><br>
				<button type="submit" class="upload">Submit</button><br>
			</form>
		 </div>
	</div>
    
   
  <%
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