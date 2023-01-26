<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="vs.dao.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vs.model.LoginBean" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Classroom</title>
	
<style>
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
	
	
	.add{
		width:auto;
		font-size:40px;
		position:absolute;
		color:#fafafa;
		background-color:#8458B3;
		border:0px;
		outline:none;
	}
	.add:hover{
		background-color:#49274A;
		cursor:pointer;
	}
		
	.create{
		display:none;
		position: fixed;
		z-index: 1;
		padding:10px;
		width: 100%; 
		height: 100%; 
		background-color: rgba(0,0,0,0.0); 
	}
	
	#border{
		background-color: #fefefe;
		border: 1px solid #fefefe;
		padding:10px;
		width: 10%; 
	}
	
	.link{
		color:black;
		text-decoration:none;
	}
	
	.link:hover{
		color:#787878;
	}
	
	.create_class{
		display:none;
		position: fixed;
		z-index: 1;
		padding:10px;
		width: 100%; 
		height: 100%; 
		background-color: rgba(0,0,0,0.1); 
		}
		
	.create_border{
		background-color: #fefefe;
		border: 1px solid #fefefe;
		padding:10px;
		width: 30%; 
		margin:auto;
		margin-top:15%;
	}
	
	.close{
		float:right;
		font-size: 36px;
		text-decoration:none;
		color: black;
		margin:0px;
		}
		
	form{
		padding:20px;
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
			
			
	.create_btn {
		background-color: #0099ff;
		color: white;
		padding: 12px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
	}
			
	.create_btn:hover{
		opacity: 0.7;
		}
	
</style>
</head>
<body>
	<!--add button-->
	<div id="div1" class="create">
	<div id="border">
		<a href="javascript:void(0)" class="link" onclick="document.getElementById('div3').style.display='block'" >JOIN</a><br><br>
		<a href="javascript:void(0)" class="link" onclick="document.getElementById('div2').style.display='block'" >CREATE</a><br>
	</div>
	</div>
	
	<div id="div2" class="create_class">
	<div class="create_border">
		<a href="javascript:void(0)" class="close" onclick="document.getElementById('div2').style.display='none'">&times;</a><br>
		 <form action="<%= request.getContextPath()%>/CreateServlet" method ="post" id="assign">
			<label for="class_name"><b>Class Name</b></label><br>
			<input type="text" id="class_name" name="class_name" required><br>
				
			<label for="section"><b>Section</b></label><br>
			<input type="text" id="section" name="section" required><br>
				
			<button type="submit" class="create_btn">Create</button><br>
		</form>
	</div>
	</div>
	
	<div id="div3" class="create_class">
	<div class="create_border">
		<a href="javascript:void(0)" class="close" onclick="document.getElementById('div3').style.display='none'">&times;</a><br>
		 <form action="<%= request.getContextPath()%>/JoinServlet" method ="post" id="assign">
			<label for="class_code"><b>Class Code</b></label><br>
			<input type="text" id="class_code" name="class_code" required><br>
				
			<button type="submit" class="create_btn">Join</button><br>
		</form>
	</div>
	</div>
		
	<!--logout-->
	<button onclick="document.getElementById('div1').style.display='block'" class="add">&#43;</button>
	<a href="homepage.jsp" class="btn"><i class="fa fa-sign-out"></i>Logout</a>
	<a href="to-do-list.jsp" class="btn">Myspace</a><br><br><hr>
	
	
	<!--class list created-->
	 <%
			Connection conn = Connect.getConnection();
			PreparedStatement ps = conn.prepareStatement("select* from class_info where email = ?");
			ps.setString(1, LoginBean.getUname());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
	 %>
	<!--cards-->
	
	<a href = "FetchServlet?class_code=<%=rs.getInt("class_code") %>" class="card">
		<div class="class-name">
			<h1 style="font-size:40px;padding-top:20px;"><%=rs.getString("class_name") %> </h1>
			<span style="font-size:20px"><%=rs.getString("section") %></span>
		</div>
		<div class="card-text">
			<span style="float:left;margin-top:20%;padding:10px;color:#383838"><%=rs.getString("fname")%> <%=rs.getString("lname") %></span>
			<span style="float:right;margin-top:20%;padding:10px;color:#383838">Class code: <%=rs.getInt("class_code") %> </span>
		</div>
	</a>
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
	<!--cards-->
	<a href = "FetchServlet?class_code=<%=rst.getInt("class_code") %>" class="card">
		<div class="class-name">
			<h1 style="font-size:40px;padding-top:20px;"><%=rst.getString("class_name") %> </h1>
			<span style="font-size:20px"><%=rst.getString("section") %></span>
		</div>
		<div class="card-text">
			<span style="float:left;margin-top:20%;padding:20px;color:#383838"><%=rst.getString("c_fname")%> <%=rst.getString("c_lname") %></span>
			<span style="float:right;margin-top:20%;padding:20px;color:#383838">Class code: <%=rst.getString("class_code") %> </span>
		</div>
	</a>
	<%
			}
	%>
		
<script>
// Get the modal
	var create = document.getElementById('div1');

// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == create) {
        create.style.display = "none";
    }
}
</script>

</body>
</html> 
