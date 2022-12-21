# pull official base image
FROM python:3.10.9-slim-buster

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt update && apt -y install gettext-base

# install python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# add run.sh
RUN chmod +x run.sh

# run run.sh
CMD ["./run.sh"]
