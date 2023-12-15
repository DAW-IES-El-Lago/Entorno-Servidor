<%@page import="mgb.clases.BaseDato"%>
<%@page import="mgb.clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-black text-white">
        <%@include file="/template/nav_bar.jsp" %>  
        <%@include file="/template/modal.html" %> 
        <div class="container mx-auto">
            <%
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("login.jsp?error=1");
            } else {
                 if (!session.getAttribute("tipo").toString().equals("2"))
                    response.sendRedirect("index.jsp");
            }
            int id = Integer.valueOf(request.getParameter("id"));
            BaseDato bd  = new BaseDato();
            Usuario u = (Usuario) bd.getUsuario(id);
            %>
            <div class="flex items-center justify-center h-screen">
                <form action="/appMensajes/ServletModificarUsuario" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                    <input name="id_user" type="hidden" value="<%= u.getId_user() %>">
                    <h2 class="text-center mb-4">Modificar Datos</h2>
                    <hr class="mb-4">
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-bold mb-2">Usuario:</label>
                            <input type="text" name="usuario" value="<%= u.getUser() %>" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>
                        <div>
                            <label class="block text-sm font-bold mb-2">Clave:</label>
                            <input type="password" name="clave" value="<%= u.getPass() %>" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>
                        <div>
                            <label class="block text-sm font-bold mb-2">Nombre:</label>
                            <input type="text" name="nombre" value="<%= u.getNombre() %>" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>
                        <div>
                            <label class="block text-sm font-bold mb-2">Email:</label>
                            <input type="text" name="email" value="<%= u.getEmail() %>" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>
                        <div>
                            <label class="block text-sm font-bold mb-2">Tipo:</label>
                            <select name="tipo" class="form-select mt-1 p-2 w-full border rounded-md">
                                <option value="0" <%= u.getTipo() == 0 ? "selected" : "" %>>normal</option>
                                <option value="1" <%= u.getTipo() == 1 ? "selected" : "" %>>superuser</option>
                                <option value="2" <%= u.getTipo() == 2 ? "selected" : "" %>>Administrador</option>
                            </select>
                        </div>
                    </div>
                    <div class="text-center mt-6">
                        <input type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" value="Enviar">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
