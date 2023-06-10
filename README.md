# Docker-SegwayRMP

This repository contains a Docker container setup for interfacing with Segway RMP 200. The container is built using ROS Kinetic and is designed to run the [segway_rmp](http://wiki.ros.org/segway_rmp?distro=groovy) packages, which are primarily released in End-of-Life (EOL) ROS distributions.

## Dockerfile and Compose

The Dockerfile describes the steps to set up the ROS environment, install necessary dependencies, and build the segway_rmp package. The resulting Docker image provides a self-contained and isolated environment for running segway_rmp.

The docker-compose file is used to run the Docker container, specifying necessary runtime settings such as devices and network configuration. It simplifies the process of starting the Docker container, particularly when integrating with existing systems or development workflows.

## Usage

To use this setup, you first need to build the Docker image:

```bash
docker-compose build
```

Then, you can run the Docker container:

```bash
docker-compose up
```