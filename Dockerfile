# Use node image as base
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# # Migrate the database
RUN  node --stack-size=8192 node_modules/.bin/prisma migrate deploy --preview-feature

# Expose port 5000
EXPOSE 5000

# Command to run the node server
CMD ["npm", "run", "start"]
