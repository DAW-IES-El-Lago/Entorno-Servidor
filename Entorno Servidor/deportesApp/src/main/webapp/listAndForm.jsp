<%-- 
    Document   : listAndForm
    Created on : 13 dic 2023, 9:42:05
    Author     : dawmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.melakugb.deportesapp.Deporte" %>
<%@ page import="com.melakugb.deportesapp.DBConnection" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Backend</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    </head>

    <body class="bg-gray-100 min-h-screen flex items-center justify-center">

        <div class="max-w-md mx-auto p-6 bg-white rounded-md shadow-md">

            <h1 class="text-3xl font-bold mb-6">SportThingsManagement</h1>

            <%
                DBConnection db = new DBConnection();

                int total = db.totalRegistros("deporte");
            %>

            <h1>Total Deportes: <%= total %></h1>

            <% 
                ArrayList<Deporte> l=(ArrayList<Deporte>) session.getAttribute("listSports");
                if(l!=null){
            %>
            <table class="mb-6">
                <%
                    for (Object sp : l) {
                        Deporte s = (Deporte) sp;
                %>
                <tr>
                    <td class="pr-4">Sport:</td>
                    <td><%= s.getName() %></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                } else {
            %>
            <h2>No data</h2>
            <%
                }
            %>

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
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600 transition duration-300">List sports</button>
            </form>
        </div>

    </body>

</html>
