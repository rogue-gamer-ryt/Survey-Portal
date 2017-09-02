<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Methods Apparel Consultancy India Pvt Ltd</title>
		<meta name="description" content="" />
		<meta name="keywords" content="Monitoring System" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="../css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="../css/demo.css" />
   		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<link rel="stylesheet" type="text/css" href="css/normalize2.css" />
		<link rel="stylesheet" type="text/css" href="css/demo2.css" />
		<link rel="stylesheet" type="text/css" href="css/component2.css" />


		<link href="../css/simple-sidebar.css" rel="stylesheet">
    	<link href="../css/style3.css" rel="stylesheet">
     	<!--Flat UI-->
    	<link href="dist/css/flat-ui.css" rel="stylesheet">

		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body background="#fff">
<div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            
                <ul class="sidebar-nav">
                    
                <li class="sidebar-brand">
                    <a href="user_index.jsp">
                        Survey Application
                    </a>
               </li>
               <li>
                   
                    
                        <img src="images/logo1.png" class="img-circle" style="width: 30%; height: 30%">
                                              <h5 style="font-family:Tahoma ;color:white">Admin Name</h5>  
                        
                 
                </li><li>
                   <a href="../index.jsp"><button type="button"  class="btn btn-primary-logout" style="width: 75%"><i class="glyphicon glyphicon-off" style="font-size:18px;color:white"></i>Logout</button></a>
                   </li>
                   <br>
                 <li>
                    <a href="edit_admin.jsp">My Profile</a>
                </li>
                <li>
                    <a href="manage_category.jsp">Manage Category</a>
                </li>
                <li>
                    <a href="manage_user.jsp">Manage User</a>
                </li>
                <li>
                    <a href="manage_results.jsp">Manage Results</a>
                </li>
            </ul>
 <!-- <div id="footer">
 <h6 align="center"><strong>HIK Technologies    &nbsp |&nbsp All Copyrights Reserved</strong> </h6>
 </div>
 </div>
        <!-- /#sidebar-wrapper -->
</div>





		<div class="container">
			<header>
				<h1>Methods Apparel Consultancy India Pvt Ltd<span>Creating Efficient Production Solutions</span></h1>	
			</header>
			<div class="component">
				<h2>Manage Operations</h2>
				<p>This page gives us the information about the operation .</p>
				<input type="submit" value="Exit" onclick="location.href='manageScanners.html'">
				<input type="submit" value="Assign New" onclick="location.href='addOperations.html'">
				<!--input type="submit" value="Operators" onclick="location.href='addEmployee.html'">
				<input type="submit" value="Operations" onclick="location.href='addOperations.html'">
				<input type="submit" value="Terminals" onclick="location.href='addTerminal.html'">
				<input type="submit" value="Lines" onclick="location.href='addLine.html'"-->

				<table>
					<thead>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
						<tr>
							<th>S.No</th>
							<th>Operation Name</th>
							<th>Type of Operation</th>
							<th>Garment Name</th>
							<th>Design</th>
							
						</tr>
						<!--?php
							$servername = "mysql.serversfree.com";
							$username = "u215511637_tjas";
							$password = "sjbalaji123";
							$dbname = "u215511637_qrcod";
	

							// Create connection
							$conn = new mysqli($servername, $username, $password, $dbname);
							// Check connection
							if ($conn->connect_error) {
								    die("Connection failed: " . $conn->connect_error);
							} 

							$sql = "SELECT * FROM  `time_table` ORDER BY  `time_table`.`order` ASC ";
							$result = $conn->query($sql);

							if ($result->num_rows > 0) {
							    // output data of each row
							    while($row = $result->fetch_assoc()) {
								echo "<tr><th>".$row["Day"]."</th>";
								for($i=1;$i<=7;$i++)
								{
									$det = $row["Hour_0".$i];
									$col = $row["Color_0".$i];
									switch($col)
									{
										case 1: echo "<td class=\"early\">".$det."</td>"; break;
										case 2: echo "<td class=\"ontime\">".$det."</td>"; break;
										case 3: echo "<td class=\"late\">".$det."</td>"; break;
									}
								}
					        echo "</tr>";
    							}
							   
							}
							$conn->close();
					?-->		
					</tbody>
				</table>				
		</div><!-- /container -->
		<script src="../js/jquery.min.js"></script>
		<script src="../js/jquery.ba-throttle-debounce.min.js"></script>
		<script src="../js/jquery.stickyheader.js"></script>



		<!--copyrights-->
<div class="copyrights">
<p>Template by <a href="http://w3layouts.com">w3layouts</a></p>
</div>
<!--/copyrights-->
	</body>
</html>