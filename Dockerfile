#Install alpine base node image
FROM node:alpine3.21

#create directory to store application data
WORKDIR /app

#copy current directory data to created directory
COPY . /app

#Run & install dependency application
RUN npm init -y && \
    npm install

CMD ["start" "npm"]