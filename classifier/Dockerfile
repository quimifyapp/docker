FROM python:3

ADD api.py api.py
ADD model.py model.py

COPY models /models/

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt # To install dependencies

EXPOSE 8070
CMD ["python", "api.py", "models"]
ENV TZ Europe/Madrid
