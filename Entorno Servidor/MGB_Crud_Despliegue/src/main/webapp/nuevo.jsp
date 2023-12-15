<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    %>
    <form action="/appMensajes/ServletGuardar" method="post" class="mx-auto my-8 max-w-md">
        <div class="form-group">
            <h2 class="text-2xl font-bold">Redactar Mensaje</h2>
            <textarea class="form-input mt-2 w-full" name="mensaje" rows="5"></textarea>
        </div>
        <br>
        <center><input type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" value="Enviar"></center>
    </form>
    <center><a href="mostrarUsuarios.jsp">Volver</a></center>
</body>
</html>
