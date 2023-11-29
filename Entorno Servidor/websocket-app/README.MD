# Bili-Bili Chat App

## Overview

Bili-Bili Chat is a real-time text chat application developed in Java, utilizing JSP (JavaServer Pages) and Servlets for the server-side logic. The application connects to a MySQL database using JDBC (Java Database Connectivity) for user authentication and storage of chat data. To enable real-time communication, WebSockets are implemented to facilitate efficient and instantaneous chat updates between users.

## Features

- **User Authentication:** Users can register on the web platform, providing necessary details for creating an account. Registered users can then log in securely to access the chat features.

- **Real-Time Chat:** The application features a real-time chat functionality powered by WebSockets. Users can send and receive messages instantly, creating a seamless and dynamic chatting experience.

- **MySQL Database Integration:** User account information and chat data are stored in a MySQL database. JDBC is used to establish a connection to the database, allowing for efficient data retrieval and storage.

## Technologies Used

- **Java:** The core programming language for server-side logic and application development.

- **JSP (JavaServer Pages):** Used for creating dynamic, data-driven web pages.

- **Servlets:** Handle HTTP requests, manage user sessions, and process data on the server side.

- **JDBC (Java Database Connectivity):** Enables communication with the MySQL database for user authentication and data storage.

- **WebSockets:** Facilitate real-time, bidirectional communication between the server and clients for instant chat updates.

- **MySQL:** A relational database management system used for storing user information and chat data.

- **TailwindCSS:** Beautifully designed, expertly crafted components and templates, built by the makers of Tailwind CSS.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/DAW-IES-El-Lago/Entorno-Servidor/new/main/Entorno%20Servidor/websocket-app
   cd websocket-app
   ```

2. **Database Setup:**
   - Set up a MySQL database and update the database configuration in the application.
   - Execute the SQL scripts provided in the `database` folder to create the necessary tables.

3. **Run the Application:**
   - Deploy the application on a Servlet container like Apache Tomcat.
   - Access the application through a web browser.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests to enhance the functionality, fix bugs, or suggest improvements.

## License

This project is licensed under the [MIT License](LICENSE).

---

Feel free to customize this README according to your specific project details and structure.
