# Use node image as base
FROM node:20

# Set working directory
WORKDIR /app

# # Copy package.json and package-lock.json to container
# COPY package*.json ./

# Copy the rest of the application to the container
COPY . .

# Install dependencies
RUN npm install

# # Migrate the database
RUN npx --schema=./prisma/schema.prisma --generator client

# Expose port 5000
EXPOSE 5000

# Command to run the node server
CMD ["npm", "run", "start"]
