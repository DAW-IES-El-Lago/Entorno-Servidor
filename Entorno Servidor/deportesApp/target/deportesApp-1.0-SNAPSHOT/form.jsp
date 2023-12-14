<%-- 
    Document   : form
    Created on : 13 dic 2023, 9:40:48
    Author     : dawmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BD Deportes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="max-w-md mx-auto p-6 bg-white rounded-md shadow-md">
        <h1 class="text-3xl font-bold mb-6">SportThingsManagement</h1>

        <form action="HelloWorld" class="mb-4">
            <label for="insert" class="block mb-2">Insertar Deporte:</label>
            <input type="text" name="deporte" id="insert" class="border rounded-md px-4 py-2">
            <input type="hidden" name="task" value="insert">
            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition duration-300">Insert</button>
        </form>

        <form action="HelloWorld" class="mb-4">
            <label for="delete" class="block mb-2">Eliminar Deporte:</label>
            <input type="text" name="deporte" id="delete" class="border rounded-md px-4 py-2">
            <input type="hidden" name="task" value="delete">
            <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300">Delete</button>
        </form>

        <form action="HelloWorld">
            <input type="hidden" name="task" value="list">
            <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600 transition duration-300">Listar Deportes</button>
        </form>
    </div>

</body>
</html>
