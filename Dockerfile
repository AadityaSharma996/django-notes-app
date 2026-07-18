FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y gcc curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && gunicorn notesapp.wsgi:application --bind 0.0.0.0:8000"]
