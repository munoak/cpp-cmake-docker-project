# Use an official Ubuntu image
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /usr/src/app

# Copy the C++ project files
COPY . .

#Create build Dir
RUN mkdir build

# Run CMake and build the project
WORKDIR /app/build
RUN cmake . && make

# Run the application
CMD ["./main"]
