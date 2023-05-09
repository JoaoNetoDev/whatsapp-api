FROM node:16.19.0

LABEL version="1.2.0" description="Api to control whatsapp features through http requests." 
LABEL maintainer="Cleber Wilson" git="https://github.com/jrCleber"
LABEL contact="contato@codechat.dev"

RUN apt-get update -y
RUN apt-get upgrade -y

WORKDIR /codechat

COPY ./package.json .

# See https://github.com/code-chat-br/whatsapp-api/blob/main/Docker/dev.env
# This file composes an image from the data in this repository.
# Check here the official image of this api: https://hub.docker.com/r/codechat/api

ENV DOCKER_ENV=true

ENV CORS_ORIGIN='*' 
ENV CORS_METHODS='POST,GET,PUT,DELETE'
ENV CORS_CREDENTIALS=true

ENV LOG_LEVEL='ERROR,WARN,DEBUG,INFO,LOG,VERBOSE,DARK'
ENV LOG_COLOR=true

ENV DEL_INSTANCE=5

ENV STORE_CLEANING_INTERVAL=7200 
ENV STORE_MESSAGE=true
ENV STORE_CONTACTS=false
ENV STORE_CHATS=false

ENV DATABASE_ENABLED=false
ENV DATABASE_CONNECTION_URI='mongodb://<USER>:<PASSWORD>@<HOST>/?authSource=admin&readPreference=primary&ssl=false&directConnection=true'
ENV DATABASE_CONNECTION_DB_PREFIX_NAME='codechat'
ENV DATABASE_SAVE_DATA_INSTANCE=false
ENV DATABASE_SAVE_DATA_OLD_MESSAGE=false
ENV DATABASE_SAVE_DATA_NEW_MESSAGE=true
ENV DATABASE_SAVE_MESSAGE_UPDATE=true
ENV DATABASE_SAVE_DATA_CONTACTS=true
ENV DATABASE_SAVE_DATA_CHATS=true

ENV REDIS_ENABLED=false
ENV REDIS_URI='redis://<HOST>'
ENV REDIS_PREFIX_KEY='codechat'

ENV WEBHOOK_GLOBAL_URL='<url>'
ENV WEBHOOK_GLOBAL_ENABLED=false

ENV WEBHOOK_EVENTS_STATUS_INSTANCE=true
ENV WEBHOOK_EVENTS_QRCODE_UPDATED=true
ENV WEBHOOK_EVENTS_MESSAGES_SET=true
ENV WEBHOOK_EVENTS_MESSAGES_UPDATE=true
ENV WEBHOOK_EVENTS_MESSAGES_UPSERT=true
ENV WEBHOOK_EVENTS_SEND_MESSAGE=true
ENV WEBHOOK_EVENTS_CONTACTS_SET=true
ENV WEBHOOK_EVENTS_CONTACTS_UPSERT=true
ENV WEBHOOK_EVENTS_CONTACTS_UPDATE=true
ENV WEBHOOK_EVENTS_PRESENCE_UPDATE=true
ENV WEBHOOK_EVENTS_CHATS_SET=true
ENV WEBHOOK_EVENTS_CHATS_UPSERT=true
ENV WEBHOOK_EVENTS_CHATS_UPDATE=true
ENV WEBHOOK_EVENTS_CONNECTION_UPDATE=true
ENV WEBHOOK_EVENTS_GROUPS_UPSERT=false
ENV WEBHOOK_EVENTS_GROUPS_UPDATE=false
ENV WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=false

ENV WEBHOOK_EVENTS_NEW_JWT_TOKEN=true

ENV CONFIG_SESSION_PHONE_CLIENT='codechat'
ENV CONFIG_SESSION_PHONE_NAME='Chrome'

ENV QRCODE_LIMIT=6

ENV AUTHENTICATION_TYPE='jwt' 

ENV AUTHENTICATION_API_KEY='t8OOEeISKzpmc3jjcMqBWYSaJsafdefer'

ENV AUTHENTICATION_JWT_EXPIRIN_IN=3600
ENV AUTHENTICATION_JWT_SECRET='L0YWtjb2w554WFqPG'

RUN npm install

COPY . .

CMD [ "node", "./dist/src/main.js" ]
