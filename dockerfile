# Use the official ROS Kinetic core image as a base
FROM ros:kinetic-ros-core

# Set the working directory
WORKDIR /root

# Install dependencies
RUN apt-get update && apt-get install -y \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    build-essential \
    git

# Initialize rosdep
RUN rosdep init

# Update rosdep
RUN rosdep update

# Create a catkin Workspace
RUN mkdir -p ~/catkin_ws/src
WORKDIR /root/catkin_ws/src

# Initialize the workspace
RUN /bin/bash -c ". /opt/ros/kinetic/setup.bash; catkin_init_workspace"

# Clone the segway_rmp package
RUN git clone https://github.com/segwayrmp/segway_rmp.git

# Back to catkin workspace directory
WORKDIR /root/catkin_ws/

# Build the package
RUN /bin/bash -c ". /opt/ros/kinetic/setup.bash; catkin_make"

# Source the new overlay
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
