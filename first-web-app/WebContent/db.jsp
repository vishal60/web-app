<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DB access</title>
</head>
<body>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/myfirstdb","root","");
String sql = "select * from mytable where name = ?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, request.getParameter("users"));

ResultSet rs = ps.executeQuery();
while(rs.next()){
	out.println("Name: " + rs.getString("name"));
	out.println("email: " + rs.getString("email"));
}
%>

<% 
conn.close();
ps.close();
rs.close();
%>

</body>
</html>





