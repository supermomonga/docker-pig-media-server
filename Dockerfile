FROM ssig33/ruby-imagemagick-groonga
MAINTAINER supermomonga

RUN ["useradd", "-m", "pig"]
RUN ["adduser", "pig", "staff"]
USER pig
WORKDIR /home/pig

RUN git clone https://github.com/ssig33/pig-media-server.git
WORKDIR /home/pig/pig-media-server
USER root
RUN bundle install
USER pig


VOLUME /home/pig/user_data
VOLUME /home/pig/groonga
VOLUME /home/pig/media
VOLUME /home/pig/.pit

EXPOSE 10010
CMD chmod 777 /home/pig \
    && chmod 777 /home/pig/groonga \
    && bundle exec pig-media-server server 10010