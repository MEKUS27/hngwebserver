# Use the official Node.js image from the Docker Hub
FROM node:17-alpine

# Create and set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./



# Copy the rest of the application code
COPY package.json ./

# Install Prettier (For our package's bulid function)
RUN npm install prettier -g

# Install Files
RUN npm install

# Copy Source files
COPY . .

#Build
RUN npm Build

# Expose the port your app runs on
EXPOSE 1337

# Command to run the application
CMD ["node", "build/server.js"]
