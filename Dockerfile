FROM sirboops/php:7.2.10

ENV WIKI_VER="1.31.1"

RUN cd /opt && \
    wget https://releases.wikimedia.org/mediawiki/${WIKI_VER%.*}/mediawiki-$WIKI_VER.tar.gz && \
    tar xf mediawiki-$WIKI_VER.tar.gz && \
    rm -rf www && \
    mv mediawiki-$WIKI_VER www && \
    cd www && \
    rm -rf mw-config && \
    cd /opt && \
    rm mediawiki-$WIKI_VER.tar.gz

COPY ./php-confs/* /opt/php/etc/

CMD /opt/httpd/bin/httpd -e info -DFOREGROUND
