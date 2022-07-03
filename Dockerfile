FROM python:latest

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY requirements.txt .
RUN pip install -r ./requirements.txt

COPY app.py .

CMD [ "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]