FROM python:3.12-slim

# Buenas prácticas de Python en contenedores
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Instala dependencias primero para cachear capas
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código
COPY . .

# Usuario no root
RUN useradd -m appuser
USER appuser

# Punto de entrada
CMD ["python", "main.py"]
