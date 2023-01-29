FROM python:3.8.2-alpine

WORKDIR /src/app/

COPY ./requirements.txt .

RUN ["pip", "install", "-r", "./requirements.txt"]

COPY . .

RUN addgroup -S projects && adduser -S -H projects -G projects
RUN chown -R projects:projects /src/app
USER projects

EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]