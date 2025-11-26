# Imagen base con Python.
FROM python:3.11-slim

# Establecer el directorio de trabajo.
WORKDIR /app

# Copiar los archivos de requisitos e instalar las dependencias.
COPY requirements.txt .

# Instalar las dependencias.
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos de la aplicación.
COPY . .

# Exponer el puerto en el que la aplicación correrá.
EXPOSE 8000

# Comando para ejecutar la aplicación.
CMD ["python", "app.py"]
