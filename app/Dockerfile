FROM python:3.9-slim
WORKDIR /app
RUN pip install --no-cache-dir flask
COPY app/templates/ /app/templates/
# نسخ كل الملفات والفولدرات (بما فيها templates) لداخل الحاوية
EXPOSE 5000
CMD ["python", "app.py"]
