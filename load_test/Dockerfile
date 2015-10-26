FROM mblouin/ab_gnuplot

VOLUME /var/www

COPY ./tests /tests
WORKDIR /tests

CMD ["bash", "loadtest.sh"]

