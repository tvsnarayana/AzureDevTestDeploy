FROM microsoft/aspnet

COPY project.json /app/
WORKDIR /app
RUN ["dnu", "restore"]

COPY . /app

EXPOSE 8888
ENTRYPOINT ["dnx", ".", "kestrel-dev"]