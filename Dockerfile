# cant reproduce image from git source
FROM ciricihq/wkhtmltopdf-aas:latest

RUN apt update \
&& apt full-upgrade -y \
&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
&& rm -rf /var/lib/apt/lists/* /tmp/* /root/* \
&& groupadd --gid 1000 wkhtmltopdf \
&& useradd --uid 1000 --gid wkhtmltopdf --shell /bin/bash --create-home wkhtmltopdf

# add health endpoint fix port binding
COPY app.py /app.py

USER wkhtmltopdf

CMD ["python","app.py"]
