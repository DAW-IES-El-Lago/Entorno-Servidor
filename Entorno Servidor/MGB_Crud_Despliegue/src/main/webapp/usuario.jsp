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
        <div class="text-center">
            <h1 class="text-4xl font-bold my-4">Agregar Usuario</h1>
            <form action="/appMensajes/ServletGuardarUsuario" method="post">
                <table class="mx-auto">
                    <tr>
                        <td>User :</td>
                        <td><input type="text" id="txtuser" name="txtuser" class="form-input"></td>
                    </tr>
                    <tr>
                        <td>Contraseña :</td>
                        <td><input type="text" id="txtpass" name="txtpass" class="form-input"></td>
                    </tr>
                    <tr>
                        <td>Nombre :</td>
                        <td><input type="text" id="txtnombre" name="txtnombre" class="form-input"></td>
                    </tr>
                    <tr>
                        <td>E-mail :</td>
                        <td><input type="text" id="txtemail" name="txtemail" class="form-input"></td>
                    </tr>
                    <tr>
                        <td>Tipo :</td>
                        <td><input type="text" id="txttipo" name="txttipo" class="form-input"></td>
                    </tr>
                </table>
                <center><input type="submit" value="Aceptar" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-4"></center>
            </form>
        </div>
    </body>
</html>
