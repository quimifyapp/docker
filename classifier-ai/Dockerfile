FROM python:3.8

ADD build/api.py api.py
ADD build/model.py model.py

COPY build/models/ models/

COPY build/requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt # To install dependencies

EXPOSE 8070
CMD ["python", "api.py", "models"]
ENV TZ Europe/Madrid
