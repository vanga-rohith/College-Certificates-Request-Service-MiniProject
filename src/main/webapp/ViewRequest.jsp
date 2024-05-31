<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Certificate Approval System</title>
<meta charset="UTF-8">

<link href="tablestyle.css" rel="stylesheet">
<style>
body {
	background: skyblue;
}

table tr th {
	background: black;
	color: whitesmoke;
	font-weight: bold;
	height: 50px;
	width: 100px;
}

table tr td {
	background: whitesmoke;
	color: black;
	height: 35px;
}

ul li {
	float: center;
	width: 200px;
	list-style: none;
	font-size: 20px;
}

ul li a {
	float: center;
	text-transform: uppercase;
	text-decoration: none;
}

}
#right {
	float: center;
	width: 49%;
	height: 500px;
	border: 1px solid skyblue;
}
</style>
</head>
<body>
	<div align="center">
		<h1>Certificate Status Page</h1>
		<ul>
			<li><a href="CerReq.jsp"><b>Home</b></a></li>
			<li><a href="Student.jsp"><b>Logout</b></a></li>
		</ul>
	</div>

	

	<div align="center">
	
	<%
	String username = (String) session.getAttribute("username");%>
	<h3> Welcome <font color="red" size="5"><%=username%> </font></h3>
		
		<form name="login" action="" method="post"
			enctype="multipart/form-data">
			<h1>Certificate Approval Status</h1>
			<table style="margin-top: 50px;">

				<tr>
					<th>PURPOSE</th>
					<th>STATUS</th>
					<th>WAITING AT</th>
				<tr>
					<%
					try {
						DriverManager.registerDriver(new com.mysql.jdbc.Driver());
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mainproject", "root", "");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from reqcer where name='"+username+"'");
						
						
						while (rs.next()) {
						
							String purpose=rs.getString("purpose");
							String status=rs.getString("status");
							String resfrom=rs.getString("resfrom");
					%>
				
				<tr>
					<td><%=rs.getString("purpose")%></td>
					<td><%=rs.getString("status")%></td>
					<td><%=rs.getString("resfrom")%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				out.println(e);
				}
				%>

			</table>
		</form>
		</div>
		
</body>
</html>
