FROM parent

COPY src/stuff/ /stuff

RUN mkdir -p /stuff-mkdir && touch /stuff-mkdir/child-mkdir-thing.txt

RUN ls -hal /stuff && ls -hal /stuff-mkdir

RUN rm -rfv /stuff && rm -rfv /stuff-mkdir
