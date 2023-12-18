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
            <form action="HelloWorld" class="mb-4">
                <label for="buscar_patron" class="block mb-2">Buscar Deporte patron:</label>
                <input type="text" name="deporte" id="patron" class="border rounded-md px-4 py-2">
                <input type="hidden" name="task" value="buscar_patron">
                <button type="submit" class="bg-pink-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300">Buscar</button>
            </form>

            <form action="HelloWorld" class="mb-4">
                <label for="insert_aficionado" class="block mb-2">Insertar Aficionado</label>
                <input type="text" name="aficionado" id="insert_aficionado" class="border rounded-md px-4 py-2">
                <input type="hidden" name="task" value="insert_aficionado">
                <button type="submit" class="bg-yellow-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition duration-300">Insert</button>
            </form>

            <form action="HelloWorld" class="mb-4">
                <label for="update" class="block mb-2">Actualizar Deporte:</label>
                <input type="text" name="deporteViejo" id="updateViejo" class="border rounded-md px-4 py-2">
                <input type="text" name="deporteNuevo" id="updateNuevo" class="border rounded-md px-4 py-2">
                <input type="hidden" name="task" value="update">
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300">Update</button>
            </form>

            <form action="HelloWorld" class="mb-4">
                <label for="delete_on_cascade" class="block mb-2">Eliminar En Cascada:</label>
                <input type="text" name="delete_word" id="delete_word" class="border rounded-md px-4 py-2">
                <input type="hidden" name="task" value="delete_on_cascade">
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300">Delete</button>
            </form>
            <form action="HelloWorld">
                <input type="hidden" name="task" value="list">
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600 transition duration-300">Listar Deportes</button>
            </form>
        </div>

    </body>
</html>
