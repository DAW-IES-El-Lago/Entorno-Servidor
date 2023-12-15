<%@page import="mgb.clases.BaseDato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-900 text-white">

        <div class="container mx-auto mt-8">
            <%
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("login.jsp?error=1");
            } else {
                if (!session.getAttribute("tipo").toString().equals("1"))
                    response.sendRedirect("index.jsp");
            }
    
            out.print("<form action='BusquedaMensajes.jsp' method='post'>");
                out.print("<div class='control-group'>");
                out.print("<h2 class='text-2xl text-center'>Buscar Mensajes de Usuarios</h2>");
                out.print("<div class='mt-4 text-center'>Ingrese Nombre Usuario :<input type='text' name='usuario' class='border p-2'></div>");
                out.print("<div class='mt-4 text-center'><input type='submit' class='btn btn-primary' value='Buscar'></div>");
        
                out.print("</div>");
            out.print("</form>");
            %>

            <div class="mt-8 text-center">
                <a href="/appMensajes/index.jsp" class="text-blue-500">Volver</a>
            </div>
        </div>

    </body>
</html>
