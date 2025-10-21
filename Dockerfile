# Use an official Node runtime as a parent image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Bundle app source
COPY . .

# Expose port and start app
EXPOSE 3000
CMD ["node", "app.js"]
