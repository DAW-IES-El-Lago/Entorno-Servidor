<%@page import="mgb.clases.User_mensaje"%>
<%@page import="mgb.clases.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="mgb.clases.Mensaje"%>
<%@page import="mgb.clases.BaseDato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mensajes</title>
    <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<%@include file="/template/nav_bar.jsp" %>  
<%@include file="/template/modal.html" %> 

<%
if (session.getAttribute("usuario") == null) {
    response.sendRedirect("login.jsp?error=1");
} else {
    out.print("<h2 class='text-center my-4'>Lista de Mensajes</h2>");

    out.print("<div class='input-group search mb-4'>"+
    "<input type='search' id='search' class='form-control' placeholder='Ingrese Búsqueda'>"+
    "<span class='input-group-btn'>"
    + "<button class='btn btn-primary' type='button'>Buscar</button>"
    + "</span>"
    + "</div>");

    out.print("<table class='mx-auto w-80 table table-striped'>");
    out.print("<tr>"
            + "<th>User</th>"
            + "<th>Mensaje</th>"
            + "<th>Fecha</th>"
            + "<th class='text-center'>Opción</th>"
            + "</tr>");
    BaseDato bd = new BaseDato();

    if (session.getAttribute("usuario") != null && session.getAttribute("tipo").toString().equals("1")) {
        List<Mensaje> ls = bd.getAllMensajes();

        for (Mensaje m : ls) {
            out.print(String.format("<tr>"
                    + "<td>%s</td>"
                    + "<td>%s</td>"
                    + "<td>%s</td>", m.getUser(), m.getMensaje(), m.getFecha()));

            out.print(String.format("<td class='text-center'><a style='margin: 6px' onclick='return window.confirm(\"¿Estás seguro de que quieres eliminar?\");' class='btn btn-danger btn-sm' href='http://localhost:8080/appMensajes/EliminarMensaje?id_mensaje=%d'>Eliminar</a></td>", m.getId_mensaje()));
        }
        out.print("</table>");
    } else {
        response.sendRedirect("index.jsp");
    }
}
%>

</body>
</html>
