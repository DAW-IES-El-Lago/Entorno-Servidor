<%@page import="mgb.clases.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="mgb.clases.Mensaje"%>
<%@page import="mgb.clases.BaseDato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-black text-white">
        <%@include file="/template/nav_bar.jsp" %>  
        <%@include file="/template/modal.html" %> 
        <%
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp?error=1");
        } else {
            if (!session.getAttribute("tipo").toString().equals("2"))
                response.sendRedirect("index.jsp");
            out.print("<h2 class='text-center my-4'>Lista de Usuarios</h2>");
        
            BaseDato bd = new BaseDato();
            List<Usuario> lst = bd.getUsuarios();
        
        %>
        <div class="flex items-center justify-center">
            <div class="input-group search">
                <input type="search" id="search" class="form-input p-2 w-full border rounded-md" placeholder="Ingrese Búsqueda">
                <span class="input-group-btn">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="button">Buscar</button>
                </span>
            </div>
            <br>
            <table class="mx-auto w-80 table table-striped">
                <tr>
                    <th>Usuario</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Tipo</th>
                    <th class="text-center">Opciones</th>
                </tr>
                <%
                for (Usuario u: lst) {
                %>
                <tr>
                    <td><%= u.getUser() %></td>
                    <td><%= u.getNombre() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= (u.getTipo() == 1 ? "Superuser" : (u.getTipo() == 2 ? "Administrador" : "Normal")) %></td>
                    <td class="text-center">
                        <a style="margin: 6px" onclick="return window.confirm('Are you sure you want to delete?');" class="btn btn-danger btn-sm" href="http://localhost:8080/appMensajes/EliminarUsuario?id_user=<%= u.getId_user() %>">Eliminar</a>
                        <a class="btn btn-info btn-sm" href="modificarUsuario.jsp?id=<%= u.getId_user() %>">Modificar</a>
                    </td>
                </tr>
                <%
            }
                %>
            </table>
        </div>
        <%
    }
        %>
    </body>
</html>
