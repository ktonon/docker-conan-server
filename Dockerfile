FROM python:alpine
MAINTAINER Christian Günther <cguenther.tu.chemnitz@gmail.com>

# Install dependencies so they get cached with the image
VOLUME /var/lib/conan
RUN pip install --no-cache-dir conan
RUN adduser -S conan -h /var/lib/conan -s /bin/sh

# Run uwsgi listening on port 9300
EXPOSE 9300

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]
