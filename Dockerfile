FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# Install exact versions
RUN npm install --no-optional --production

# Bundle app source
COPY . .

# Fix permissions
RUN chown -R node:node .
USER node

# Expose port
EXPOSE 3000

# Run the application
CMD ["node", "server.js"]
