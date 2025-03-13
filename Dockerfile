# Usa Python 3.12 como imagen base
FROM python:3.12

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instala dependencias del sistema y Poetry
RUN pip install --no-cache-dir poetry

# Copia los archivos del proyecto
COPY . /app

# Usa Poetry para instalar las dependencias
RUN poetry install

RUN pip list

# Expone el puerto 81 (si es necesario)
EXPOSE 81

# Comando por defecto para ejecutar la aplicación
CMD ["poetry", "run", "start-server"]