# Dockerfile to create image

# Base image, we are using alpine distro as this is smallest image size
FROM node:14-alpine

# Working directory
WORKDIR /app

# Copy source to image
COPY /karsajobs-ui /app/

# Install libs and build the app
RUN npm install --unsafe-perm && npm run lint && npm run build

# Expose port so can be access from outside
EXPOSE 8000

# Command to start the app. Will be executed when the container is up
CMD ["npm", "run", "production"]