# api/Dockerfile

FROM python:3.13-slim
# Instal·lar paquets del sistema necessaris per compilar mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Crear directori de treball
WORKDIR /app

# Copiar el contingut
COPY . .

# Instal·lar dependències Python
RUN pip install --no-cache-dir -r requirements.txt

# Executar l'app
CMD ["python", "app.py"]
