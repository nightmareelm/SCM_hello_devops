# 1. ESPECIFICAR IMAGEN BASE (FROM)
# Usamos una imagen oficial de OpenJDK (Java Development Kit) con solo el JRE (Runtime Environment)
# y la variante 'slim' para que sea lo más ligera posible.
FROM openjdk:17-jre-slim

# 2. DEFINIR VARIABLES DE ENTORNO
# Esta variable apunta al archivo .jar compilado por Maven, que se encuentra en la carpeta 'target'.
# Es útil para que la ruta sea más fácil de leer en los comandos posteriores.
ARG JAR_FILE=target/hello-devops-0.0.1-SNAPSHOT.jar

# 3. COPIAR EL ARCHIVO EJECUTABLE
# Copiamos el JAR compilado de tu proyecto (que Jenkins creará) al contenedor,
# renombrándolo simplemente a 'app.jar'.
# (Asumimos que el JAR ya fue creado en la etapa de 'Build' de Jenkins)
COPY ${JAR_FILE} app.jar

# 4. EXPONER PUERTO
# Informa a Docker que el contenedor escuchará peticiones en el puerto 8081 (el que configuraste).
# OJO: Esto es solo documentación, no abre el puerto, solo lo anuncia.
EXPOSE 8081

# 5. COMANDO DE INICIO (ENTRYPOINT)
# Define el comando que se ejecutará CADA VEZ que el contenedor se inicie.
# Ejecutamos el archivo 'app.jar' con el comando estándar de Java.
ENTRYPOINT ["java","-jar","/app.jar"]