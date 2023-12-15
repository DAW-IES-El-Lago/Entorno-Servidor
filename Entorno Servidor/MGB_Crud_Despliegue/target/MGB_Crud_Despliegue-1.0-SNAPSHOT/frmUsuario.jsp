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
    <body class="bg-gray-900">

        <div class="container mx-auto" style="width: 25%">
            <div class="flex items-center justify-center h-screen">
                <div class="w-full max-w-md">
                    <form action="/appMensajes/ServletUsuario" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                        <legend class="text-center text-2xl mb-4">Registrar Usuario</legend>

                        <!-- Usuario input -->
                        <div class="mb-4">
                            <label for="usuario" class="block text-gray-700 text-sm font-bold mb-2">Usuario</label>
                            <input id="usuario" name="usuario" type="text" placeholder="Username" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>

                        <!-- Password input -->
                        <div class="mb-4">
                            <label for="clave" class="block text-gray-700 text-sm font-bold mb-2">Password</label>
                            <input id="clave" name="clave" type="password" placeholder="*****" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>

                        <!-- Nombre input -->
                        <div class="mb-4">
                            <label for="nombre" class="block text-gray-700 text-sm font-bold mb-2">Nombre</label>
                            <input id="nombre" name="nombre" type="text" placeholder="Nombre" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>

                        <!-- Email input -->
                        <div class="mb-4">
                            <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email</label>
                            <input id="email" name="email" type="email" placeholder="user@domain.com" class="form-input mt-1 p-2 w-full border rounded-md">
                        </div>

                        <!-- Submit button -->
                        <div class="mb-6">
                            <input type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full" value="Registrar">
                        </div>

                        <!-- Volver atrás link -->
                        <a href="index.jsp" class="block text-center text-blue-500 hover:underline">Volver Atrás</a>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
