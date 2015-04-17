FROM java:7-jre

RUN apt-get update \
	&& apt-get install -y git \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/vimac/elasticsearch-rtf.git /usr/share/elasticsearch-rtf

ENV PATH /usr/share/elasticsearch-rtf/bin:$PATH
COPY config /usr/share/elasticsearch-rtf/config

VOLUME /usr/share/elasticsearch-rtf/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch-rtf", "console"]