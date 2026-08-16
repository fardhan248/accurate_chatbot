FROM python:3.11-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    tesseract-ocr \
    libtesseract-dev \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# COPY ./langgraph_app ./langgraph_app

# RUN python /app/setup_db.py

EXPOSE 8000

# CMD ["uvicorn", "app", "--host", "0.0.0.0", "--port", "8000", "--reload"]