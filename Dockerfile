# inherit from python 3.9
FROM python:3.9

RUN apt-get update && \
  apt-get install --no-install-recommends --no-install-suggests --yes \
  libgl1-mesa-glx \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# create app directory
WORKDIR /app

# install requirements
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# copy application
COPY app.py /app/app.py

# start command
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]
