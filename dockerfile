FROM python:3.11-slim
WORKDIR /docker
COPY docker.py .
CMD ["python", "docker.py"]

