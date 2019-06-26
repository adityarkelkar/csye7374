#FROM node:7
#ADD app.js /app.js
#ENTRYPOINT ["node", "app.js"]

#FROM node:7
#ADD app.js /app.js
#ENTRYPOINT ["node", "oldapp.js"]


#FROM node:8
# Create app directory
#COPY node/package.json .
#RUN npm install
#COPY node/app.js .
#CMD ["node", "app.js"]

FROM node:7
COPY node/app.js .
ENTRYPOINT ["node", "app.js"]
