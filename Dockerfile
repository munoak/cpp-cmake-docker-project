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

# Run CMake and build the project
RUN cmake . && make

# Run the application
CMD ["./main"]
