FROM microsoft/aspnet

COPY project.json /app/
WORKDIR /app
RUN ["dnu", "restore"]

COPY . /app

EXPOSE 80
ENTRYPOINT ["dnx", ".", "kestrel"]