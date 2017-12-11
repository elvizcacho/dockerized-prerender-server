FROM alpine:edge

# update sources and upgrade packages
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# add git
RUN apk add --no-cache git

RUN apk add --update nodejs 

# add chromium
RUN apk update && apk upgrade && apk add --no-cache \
    zlib-dev \
    chromium \
    xvfb \
    wait4ports \
    xorg-server \
    dbus \
    ttf-freefont \
    mesa-dri-swrast

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

ENV PATH="/usr/src/app:$PATH"
#RUN mv /usr/bin/chromium-browser /usr/bin/google-chrome


ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

EXPOSE 3000
