FROM alpine:edge

ARG PORT=3000

ENV PORT=$PORT

# update sources and upgrade packages
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# add git
RUN apk add --no-cache git

RUN apk add --update nodejs 

RUN apk add openssh

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

RUN mkdir -p /usr/src/app && mkdir ~/.ssh
WORKDIR /usr/src/app

RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY . /usr/src/app

ENV PATH="/usr/src/app:$PATH"

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

EXPOSE 3000
