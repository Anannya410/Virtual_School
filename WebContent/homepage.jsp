<html>
<head>
	<title> Virtual School </title>
	
	<style>
		body{
			background-color:#EFE1CE;
		}
	
		.btn{
			float:right;
			text-decoration:none;
			color:	#939597;
			font:bold 12px Arial;
			margin:5px;
		
			border:2px solid transparent;
			border-radius:20px;
			background-color:#0099ff;
			background-image: linear-gradient(#EFE1CE,#EFE1CE),radial-gradient(circle at top left,#E9897E,#926AA6);
			background-origin:border-box;
			background-clip:content-box,border-box;
			
			transition: 0.5s ease;
		}
		
		.btn:hover{
			color:black;
		}
		
		.btn span{
		display:block;
		padding:8px 22px;
		}
		
		.logo{
			margin:20px;
			
		}
		
		.name{
			text-align:center;
			margin:0px;
		}
		
		.banner-img{
			margin:50px  50px;
			width: 60%;
		}
		
		.banner-img img{
			width: 100%;
		}
		
		.banner{
		 positon:relative;
		}
		
		.banner-title{
			position:absolute;
			left: 60%;
			top: 40%;
		}
		
		.banner-title h1{
			font-size:20px;
			background: rgba(0,0,0,0.75);
			color: white;
			line-height: 50px;
			padding: 0px 10px 0 10px;
		}
		
		
		.pink-box{
			padding:80px;
		}
		
		
		
		.text-center{
			text-align:center;
		}

		.title-style h1{
			padding:25px;
		}
		
		.title-style{
			margin:0 auto 80px;
			height:70px;
			width:50%;
			max-width:700px;
			background:#fff;
			position: relative;
			box-shadow: 0 4px 5px 0 rgba(0,0,50,0.5);
		}
		
		.title-style::after{
			content:'';
			height: 60px;
			width:150px;
			background-color: #f992a6;
			position: absolute;
			top: -8px;
			left: -8px;
			z-index:-1;
		}
		
		.title-style::before{
			content:'';
			height: 60px;
			width:150px;
			background-color: #f992a6;
			position: absolute;
			bottom: -8px;
			right: -8px;
			z-index:-1;
		}
		
		
	
		* {
			box-sizing: border-box;
		}

		.users{
			background-image: url("./images/grad-mountains.png");
			background-size:cover;
			background-position: center;
			padding:20px;
		}

		.column-user {
			float: left;
			width: 50%;
			padding: 10px;
			height: 300px; 
		}

		.users:after {
			content: "";
			display: table;
			clear: both;
			}

		.user-content{
			background:#ffffff8c;
			padding: 40px;
			height:90%;
			text-align:justify;
		}

		.user-content h4{
			text-align:center;
		}
		
		.column1 {
			float: left;
			width: 30%;
			padding: 10px;
			height: 300px; 
  }
		
		.feature{
			width:200px;
			height:200px;
			background:#fff;
			border-radius:50%;
			margin: 0px auto 30px;
			box-shadow: 0 2px 40px 0 rgba(110,130,208,.18);
			text-align:center;
		}

		.feature img{
			width: 100px;
			margin: 50px auto;
		}
		
	</style>
</head>

<body >
	<a href="login.jsp" class="btn"><span> Sign In </span></a>
	<a href="registration.jsp" class ="btn"><span> Sign up </span></a>
	
	<div class = "logo">
		<img src = "./images/Slogo.png" width="200px">
	</div>
	
	
	<div class="banner">
		<div class="banner-img">
			<img src = "./images/Features.jpg">
		</div>
		<div class="banner-title">
			<h1>MANAGE WORK</h1>
			<h1>INTO DIFFERENT SPACES</h1>
		</div>
	</div>
	
	<section class="pink-box">
		<div class="container">
			<div class="box">
				<div class="title-style text-center">
				<h1> WE PROVIDE </h1>
				</div>
				<p class = "text-center">
					We provide an online platform to manage school work in an easy to organise and user friendly manner. By providing different spaces we make it easier for the user to keep track of their work.
				</p>
			</div>
		</div>
	</section>
	
	<!--we provide-->
	
	<section class="users">
			<div class="column-user">
				<img src="./images/user.png" alt="OUR URESR" >
			</div>
			<div class="column-user ">
				<ul class="user-content">
					<h4>USERS</h4>
					<li>
						Online learning platforms : Anyone who is interested in teaching online can use this application to make his classes organized. 
					</li>
					<li>
						Schools and colleges : Schools can take help of this web application to provide class materials, take student’s assignments, give marks.
					</li>
					<li>
						Any educational institution.
					</li>
				</ul>
			</div>
	</section>
	
	<section class="pink-box">
		<div class="container">
			<div class="box">
				<div class="title-style text-center">
				<h1> FEATURES </h1>
				</div>
				<p class = "text-center">
					<div class="row">
						<div class="column1">
							<div class="feature"><img src="./images/one-platform.png"></div>
							<p style="text-align:center"> One Platform </p>
						</div>
							
						<div class="column1">
							<div class="feature"><img src="./images/to-dolist.png"></div>
							<p style="text-align:center"> Automatic Records </p>
						</div>
							
						<div class="column1">
							<div class="feature"><img src="./images/24-7access.png"></div>
							<p style="text-align:center"> 24 &times; 7 Access</p>
						</div>
						
						<div class="column1">
							<div class="feature"><img src="./images/easy-organisation.png"></div>
							<p style="text-align:center"> Easy Organisation </p>
						</div>
						
						<div class="column1">
							<div class="feature"><img src="./images/different-spaces.png"></div>
							<p style="text-align:center"> Different Spaces </p>
						</div>
						
						<div class="column1">
							<div class="feature"><img src="./images/user-friendly.png"></div>
							<p style="text-align:center"> User Friendly </p>
						</div>
					</div>
				</p>
			</div>
		</div>
	</section>
	
</body>

</html>