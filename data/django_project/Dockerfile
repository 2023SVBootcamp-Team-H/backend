FROM python:3.10

WORKDIR /app

RUN python -m venv server
ENV PATH="/app/server/bin:$PATH"

COPY backend/ .
COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt