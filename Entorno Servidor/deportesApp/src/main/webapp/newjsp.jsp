<%-- 
    Document   : newjsp
    Created on : 18 dic 2023, 10:20:24
    Author     : dawmi
--%>

fecha acrual
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List and Form</title>
</head>
<body>

<%
    Date horaActual = new Date();
    SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");
    String horaFormateada = formato.format(horaActual);
    out.println("Hora actual: " + horaFormateada);
%>

<!-- Aquí sigue el resto del contenido de la JSP -->

</body>
</html>


hora actual

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List and Form</title>
</head>
<body>

<%
    Date fechaActual = new Date();
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    String fechaFormateada = formato.format(fechaActual);
    out.println("Fecha actual: " + fechaFormateada);
%>

<!-- Aquí sigue el resto del contenido de la JSP -->

</body>
</html>



numero de registros

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List and Form</title>
</head>
<body>

<%
    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tu_base_de_datos", "usuario", "contraseña");
        String query = "SELECT COUNT(*) AS count FROM deportes";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            int count = resultSet.getInt("count");
            out.println("Número de registros en la base de datos: " + count);
        }

        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!-- Aquí sigue el resto del contenido de listAndForm.jsp -->

</body>
</html>
