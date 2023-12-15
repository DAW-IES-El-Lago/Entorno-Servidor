<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Enlace al archivo de estilo de Tailwind CSS mediante CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center bg-gray-900">

<div class="bg-white p-8 rounded-md shadow-md max-w-md w-full">
    <h2 class="text-3xl font-semibold text-center mb-6">Log in</h2>

    <form action="/appMensajes/ServletValidar" method="post">
        <div class="mb-6">
            <label for="user" class="text-gray-700 text-sm font-bold mb-2">Usuario</label>
            <input id="user" name="user" type="text" placeholder="username" class="form-input mt-1 p-3 w-full border rounded-md">
        </div>

        <div class="mb-6">
            <label for="pass" class="text-gray-700 text-sm font-bold mb-2">Password</label>
            <input id="pass" name="pass" type="password" placeholder="*****" class="form-input mt-1 p-3 w-full border rounded-md">
        </div>

        <input type="submit" class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-700" value="Aceptar">

        <p class="text-center mt-4">
            <a href="frmUsuario.jsp" class="text-blue-500">Registrarse</a>
        </p>
    </form>
</div>

</body>
</html>
