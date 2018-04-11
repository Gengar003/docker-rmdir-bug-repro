FROM alpine

COPY src/stuff/ /stuff

RUN mkdir -p /stuff-mkdir && touch /stuff-mkdir/parent-mkdir-thing.txt

RUN ls -hal /stuff && ls -hal /stuff-mkdir

RUN rm -rfv /stuff && rm -rfv /stuff-mkdir
