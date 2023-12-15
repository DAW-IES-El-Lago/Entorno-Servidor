# Proyecto Java con JSP, Servlet y MySQL CRUD

Este proyecto es una aplicación web sencilla desarrollada en Java que utiliza tecnologías como JSP (JavaServer Pages) y Servlet para realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) en una base de datos MySQL. El objetivo principal es permitir a los usuarios gestionar notas mediante la creación, visualización, actualización y eliminación de mensajes.

## Requisitos

Asegúrate de tener instalados los siguientes componentes antes de ejecutar la aplicación:

- Java Development Kit (JDK)
- Apache Tomcat (o cualquier otro servidor web compatible)
- MySQL Database

## Configuración de la Base de Datos

1. Crea una base de datos MySQL llamada `notasdb`.
2. Ejecuta el script SQL proporcionado en `db_script.sql` para crear la tabla `usuarios` y `mensajes` necesarias.

```sql
-- db_script.sql
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL
);

CREATE TABLE mensajes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
```

## Configuración del Proyecto

1. Abre el archivo `src/main/webapp/WEB-INF/web.xml` y configura el nombre de tu base de datos, usuario y contraseña.

```xml
<!-- web.xml -->
<context-param>
    <param-name>db_url</param-name>
    <param-value>jdbc:mysql://localhost:3306/notasdb</param-value>
</context-param>
<context-param>
    <param-name>db_user</param-name>
    <param-value>tu_usuario_mysql</param-value>
</context-param>
<context-param>
    <param-name>db_password</param-name>
    <param-value>tu_contraseña_mysql</param-value>
</context-param>
```

## Ejecución

1. Compila el proyecto y genera un archivo WAR:

   ```bash
   mvn clean install
   ```

2. Despliega el archivo WAR generado en tu servidor web (por ejemplo, Apache Tomcat).

3. Accede a la aplicación desde tu navegador:

   ```
   http://localhost:8080/nombre-de-tu-proyecto
   ```

¡Listo! Ahora puedes utilizar la aplicación para realizar operaciones CRUD en la base de datos de usuarios y mensajes.

## Estructura del Proyecto

- **src/main/java/com/ejemplo/controladores:** Contiene los controladores Servlet para manejar las operaciones CRUD.
- **src/main/webapp:** Contiene las páginas JSP y otros recursos web.

## Contribuciones

¡Siéntete libre de contribuir al proyecto! Puedes enviar solicitudes de extracción para mejorar la funcionalidad o corregir errores.

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE.md](LICENSE.md) para más detalles.
