FROM python:3.9

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONPYCACHEPREFIX=/tmp

COPY requirements.txt .
COPY requirements_dev.txt .

RUN pip install -r requirements_dev.txt

COPY . .

CMD ["gunicorn", "-b", ":5000", "src.main:app", "--reload"]