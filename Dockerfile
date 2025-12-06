# Imagen de Python
FROM python:3.10-slim

# Crear directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean

# Copiar Pipfile y Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Instalar pipenv
RUN pip install --no-cache-dir pipenv

# Instalar dependencias del proyecto dentro del sistema
RUN pipenv install --system --deploy

# Copiar todo el resto del código
COPY . .

# Exponer puerto 8080
EXPOSE 8080

# Leer variables de entorno desde Azure

# Comando para ejecutar la API
CMD ["python3", "app.py"]

