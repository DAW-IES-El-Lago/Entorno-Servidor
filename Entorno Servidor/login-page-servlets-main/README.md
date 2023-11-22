
# Aplicación de Inicio de Sesión y Registro con JSP y Servlets

Esta es una aplicación web sencilla que demuestra la implementación de la arquitectura Modelo-Vista-Controlador (MVC) y el patrón de diseño Singleton en Java Server Pages (JSP) y Servlets. La aplicación permite a los usuarios iniciar sesión y registrar nuevas cuentas utilizando una clase con un HashMap para almacenar los datos de usuario en lugar de una base de datos externa.

## Arquitectura MVC

La aplicación está estructurada utilizando la arquitectura MVC para separar las responsabilidades y promover la organización del código y la facilidad de mantenimiento:

- **Modelo (com.example.model):** El modelo representa los datos y la lógica de negocio de la aplicación. En esta aplicación, tenemos una clase `User` que encapsula los datos del usuario y una clase `Database` que actúa como un repositorio de datos utilizando un HashMap para almacenar los registros de usuario.

- **Vista (Archivos JSP):** La vista representa la interfaz de usuario. Tenemos archivos JSP para las páginas de inicio de sesión (`login.jsp`) y registro (`registro.jsp`). Estos archivos generan formularios HTML y presentan información al usuario.

- **Controlador (com.example.controladores):** El controlador maneja la entrada del usuario y coordina el modelo y la vista. Las clases `ProcesarLoginServlet` y `ProcesarRegisterServlet` procesan las solicitudes de los usuarios, interactúan con el modelo para realizar acciones (por ejemplo, inicio de sesión o registro de usuario) y redirigen las respuestas a los archivos JSP apropiados.

## Patrón de Diseño Singleton

Para asegurarnos de que tanto el `LoginServlet` como el `RegisterServlet` puedan acceder a la misma instancia de la base de datos (implementada como una clase `UsuariosMapSingleton` con un HashMap en este caso), hemos implementado el patrón de diseño Singleton. Esto garantiza que solo haya una instancia de la base de datos en la aplicación, evitando inconsistencias de datos y permitiendo un acceso sin problemas a los datos desde múltiples componentes.

La clase `UsuariosMapSingleton` está diseñada como un Singleton y se inicializa solo una vez durante el ciclo de vida de la aplicación. Cualquier intento de crear una nueva instancia de la base de datos devolverá la instancia existente, asegurando que ambos servlets trabajen con el mismo almacén de datos.

```java

public class UsuarioMapSingleton {
    private static UsuarioMapSingleton instance;
    private HashMap<String, String> usuarioMap;

    private UsuarioMapSingleton() {
        usuarioMap = new HashMap<>();
                // Agrega usuarios y contraseñas manualmente
        usuarioMap.put("carlos", "contraseña");
        usuarioMap.put("gary", "gary123");
        usuarioMap.put("admin", "root");
    }
    
    public static synchronized UsuarioMapSingleton getInstance() {
        if (instance == null) {
            instance = new UsuarioMapSingleton();
        }
        return instance;
    }

    public HashMap<String, String> getUsuarioMap() {
        return usuarioMap;
    }
}
    // Resto de los métodos para interactuar con la base de datos...
}
```

# Cómo ejecutar la aplicación

Para poner en marcha esta aplicación, primero debe desplegarla en un contenedor de servlets Java, como Apache Tomcat. Asegúrese de configurar su entorno de servlets de manera adecuada, lo que incluye la disposición de los archivos JSP necesarios y la configuración de las asignaciones de servlet.

Es importante destacar que esta aplicación utiliza una clase especial llamada `UsuariosMapSingleton` que contiene un HashMap para almacenar los datos de los usuarios en lugar de utilizar una base de datos externa. A medida que continúe desarrollando su proyecto, tendrá la oportunidad de implementar una base de datos real según sus necesidades específicas. En ese momento, podrá actualizar la lógica en la clase `UsuariosMapSingleton` para que interactúe con la base de datos externa en lugar de utilizar el HashMap.

Siéntase libre de explorar y personalizar esta sencilla aplicación de inicio de sesión y registro de acuerdo a sus requisitos y preferencias, adaptándola a las necesidades de sus proyectos futuros.
