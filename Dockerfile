FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    git \
    curl \
    netcat-traditional \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir Flask-Session==0.5.0

# Copy the entire project into the container
COPY . .

# Expose the necessary ports (Airflow webserver, Postgres)
EXPOSE 8080 5432

# Create airflow directories
RUN mkdir -p /app/airflow/logs /app/airflow/dags

# Set the working directory for Airflow
ENV AIRFLOW_HOME=/app/airflow

# Initialize Airflow DB (will be overridden by the command in docker-compose)
CMD ["airflow", "webserver"]