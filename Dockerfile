FROM sirboops/php:7.2.9

ENV WIKI_VER="1.31.1"

RUN cd /opt && \
    wget https://releases.wikimedia.org/mediawiki/${WIKI_VER%.*}/mediawiki-$WIKI_VER.tar.gz && \
    tar xf mediawiki-$WIKI_VER.tar.gz && \
    mv mediawiki-$WIKI_VER wiki && \
    cd wiki && \
    rm -rf mw-config && \
    cd /opt && \
    rm mediawiki-$WIKI_VER.tar.gz

COPY ./php-confs/* /opt/php/etc/

CMD /opt/php/sbin/php-fpm --nodaemonize --fpm-config /opt/php/etc/php-fpm.conf
