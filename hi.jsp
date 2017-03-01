<!doctype html>
<html>
<head>
<title>JSP Test</title>
<%!
String message = "1st commit bla bla <br /> 2d hot deploy hot!!<br /> 3d deploy by ilya_khamiakou! <br />One more time";
%>
</head>
<body>
<h2><%= message%></h2>
<%= new java.util.Date() %>
</body>
</html> 
