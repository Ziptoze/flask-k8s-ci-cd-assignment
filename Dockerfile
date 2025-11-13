# Stage 1: Build stage
FROM python:3.10-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime stage
FROM python:3.10-slim
WORKDIR /app
COPY --from=build /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
