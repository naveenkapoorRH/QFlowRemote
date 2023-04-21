FROM nodered/node-red

COPY package.json .
# RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# COPY settings.js ./settings.js
COPY flows_cred.json ./flows_cred.json
COPY flows.json ./flows.json

EXPOSE 1880

CMD ['sh']