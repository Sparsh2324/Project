#Build NodeJS image for javascript
FROM node:alpine3.21

#Create working directory
WORKDIR /app

#Copy data from currect working directory
COPY . /app

#install dependency applications
RUN npm init -y && \
    npm install

#Expose network port which we want to access.
EXPOSE	3000

#execute command after container create
CMD ["node", "index.js"]