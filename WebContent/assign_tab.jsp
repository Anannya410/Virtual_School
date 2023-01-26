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
	<title>Assignment</title>
	<style>
		body{
			font-family:serif;
			height:100%;
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
		
		.expand{
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
			width:85%;
			margin:25px;
			
		}
		
		.card {
			margin-bottom:0px;
			margin-top:0px;
			width:100%;
			padding: 30px 16px;
			background-color:#fefefe;
			font-size:24px;
			color:black;
			text-align:left;
			border:none;
			outline:none;
		}
		
		.card:hover{
			background-color:#E0E0E0;
			color:black;	
		}
		
		.desc{
			padding:20px;
		}
		
		.submit{
			display: none;
  			margin:25px;
  			margin-top:0px;
  			padding:10px;
  			padding-top:0px;
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
		background-color: #fefefe;
		position: fixed;
		left:0;
		top:0;
		height:100%;
		width:100%;
		padding-top:10px;
        }
		
		.close{
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 36px;
		margin-left: 50px;
		text-decoration:none;
		color: black;
		}
		
		form{
			padding:20px;
		}
		
		input[type=text], input[type=number], input[type=date], textarea{
				width: 80%;
				padding: 12px 20px;
				margin: 8px 0;
				display: inline-block;
				border: 1px solid #ccc;
				box-sizing: border-box;
				background: #f1f1f1;
                color:	#606060;
			}
						
			.upload {
				background-color:#606060;
				color: white;
				padding: 12px 20px;
				margin: 8px 0;
				border: none;
				cursor: pointer;
				width: 20%;
				outline:none;
			}
			
			.upload:hover{
				opacity: 0.7;
			}
			
			
			.doc-container{
				width:500px;
				border:1px solid #F5F5F5;
				background-color:#F5F5F5;
				border-radius:4px;
				text-align:center;
				padding:20px;
			}
			
			.doc{
				text-decoration:none;
			}
			
			a.doc:link{
				color:black;
			}
		
			a.doc:visited{
				color:black;
			}
			
			.doc-container:hover{
			    background-color:#E8E8E8;
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
			<a href="lecture_tab.jsp" class="nbtn"  target="_self"><b>Lecture</b></a>
			<a href="classwork_tab.jsp" class="nbtn" target="_self"><b>Classwork</b></a>
			<a href="assign_tab.jsp" class="nbtn" id="thispage" target="_self"><b>Assignment</b></a>			
			<a href="offline_tab.jsp" class="nbtn" target="_self"><b>Offline assessment</b></a>
		</nav><hr>
		
		<!-- file-list -->
		<%
			PreparedStatement pst = conn.prepareStatement("select* from assignment where class_code = ?");
			pst.setInt(1, Fetch.getClass_code());
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String title = result.getString("title");
		%>
			<div class="expand">
				<button type="button" class="card">
					<img src="./images/bassignment.png" alt="DOC" style="width:40px; height:40px;">
					<%=result.getString(2) %>
					<span class="name">
						max marks : <%=result.getInt(5) %>
					</span>
			 	</button>
			 
			 	<div class="submit">
					<hr style="margin-bottom:20px"><%=result.getString(3) %><hr style="margin-top:20px">
				
			<%
				PreparedStatement st1 = conn.prepareStatement("select* from submitted where title = ? and email = ? and class_code = ?");
				st1.setString(1, title);
				System.out.println("Title = "+title);
				st1.setString(2, LoginBean.getUname());
				st1.setInt(3, Fetch.getClass_code());
				ResultSet rst1= st1.executeQuery();
				
				if(rst1.next()){
				
			%>
					<span class="name" style="color:green">
						submitted<br>
					</span>
					
					<p style="padding:10px;"></p>
					<a href = "AdownloadServlet?title=<%=rst1.getString(2)%>&email=<%=LoginBean.getUname()%>" class="doc">
						<span class="doc-container">
							<%=rst1.getString("file_name") %> 
						</span>
					</a>
					<p style="padding:10px;"></p>
					
					
			<%
				}
				else{
			%>
					<span class="name" style="color:red">
						Due-Date : <%=result.getDate(4) %><br>
					</span>
				
					<form action="<%= request.getContextPath() %>/AuploadServlet" method ="post" enctype="multipart/form-data">
						<input type="hidden" name="assignment_title" value="<%=result.getString(2) %>">
						<input type="hidden" name="max_marks" value="<%=result.getInt("max_marks")%>">
		 				<input type="file" id="file" name="file" required><br>
						<button type="submit" class="upload">Submit</button><br>
					</form>
					
			<%
				}
			%>
				</div>
			</div>
		<%
			}
		%>	
	
		<div id="div1" class="create">
		<span style="font-size:36px;padding:10px">Assignment</span><hr>
		<a href="javascript:void(0)" class="close" onclick="document.getElementById('div1').style.display='none'">&times;</a>	
			
			<form action="<%= request.getContextPath()%>/AssignServlet" method ="post" id="assign">
		 		
		 		<label for="title"><b>Title</b></label><br>
				<input type="text" id="title" name="title" required><br>
			 	
			 	<label for="description"><b>Description</b></label><br>
				<textarea rows="1" cols="65" name="description" form="assign"></textarea><br>
				
				<label for="due_date"><b>Due Date</b></label><br>
				<input type="date" id="due_date" name="due_date"><br>
				
				<label for="max_marks"><b>Maximum Marks</b></label><br>
				<input type="number" id="max_marks" name="max_marks" required><br>
				
				<button type="submit" class="upload">Assign</button><br>
			</form>
		
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
	</div>
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

</body>
</html>