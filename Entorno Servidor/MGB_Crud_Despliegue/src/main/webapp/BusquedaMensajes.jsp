<%@page import="java.util.List"%>
<%@page import="mgb.clases.BaseDato"%>
<%@page import="mgb.clases.User_mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-100">

        <%
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp?error=1");
        } else {
            if (!session.getAttribute("tipo").toString().equals("1"))
                response.sendRedirect("index.jsp");
    
            out.print("<div class='container mx-auto mt-8'>");
            out.print("<h2 class='text-3xl text-center'>Mensajes</h2><hr>");

            BaseDato bd = new BaseDato();
            List<User_mensaje> lst = bd.getUser_mensaje(request.getParameter("usuario"));

            out.print("<table class='w-full border border-collapse border-gray-300 mt-4'>");
            out.print("<thead class='bg-gray-200 text-gray-700'><tr><th class='border p-2'>User</th><th class='border p-2'>Mensaje</th><th class='border p-2'>Fecha</th></tr></thead>");

            for (User_mensaje x : lst) {
                out.print(String.format("<tr><td class='border p-2'>%s</td><td class='border p-2'>%s</td><td class='border p-2'>%s</td></tr>", x.getUser(), x.getMensaje(), x.getFecha()));
            }

            out.print("</table>");
            out.print("</div>");
        }
        %>

        <br>
        <div class="text-center mt-4">
            <a href="index.jsp" class="text-blue-500">Volver</a>
        </div>

    </body>
</html>
