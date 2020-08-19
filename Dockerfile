# Stage 1
FROM alpine AS node-build
RUN apk add --no-cache  --update nodejs npm
RUN npm install npm@latest -g

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Stage 2 

# For NPM
# npm install testing audit and tests
FROM node-build AS node-test
RUN npm install mongoose-unique-validator && npm install mongoose -g   && npm install nodemon -g && npm install newman -g
# FOR TEST && npm install nodemon -g && npm install newman -g
RUN npm install -g
#RUN npm audit fix 


#RUN npm install testing
#RUN npm install && npm audit fix && npm install testing 
# If you are building your code for production
#RUN npm ci --only=production
# SET VARS
ENV APIURL=http://nodesvc:30000/api
ENV API_ROOT=http://nodesvc:30000/api
ENV APIROOT=http://nodesvc:30000/api
ENV MONGODB_URI=mongodb://mongosvc:30017
ENV secret=SECRET
ENV SECRET=SECRET
COPY . .

EXPOSE 3000
#RUN npm test 
#CMD [ "npm", "start" ]
#CMD [ "npm", "run", "dev" ]
CMD [ "npm", "run", "start" ]
#CMD [ "npm", "run", "test" ]
#CMD [ "npm", "test" ]
