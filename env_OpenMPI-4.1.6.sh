#!/bin/bash

# Setting up environmental variables for the installation
# Only SOFTWARE_DIRECTORY will need to be changed on future updates
# If a user wants to clone and install a local copy for themselves/groups
# CLUSTER_DIRECTORY needs to be modified

module load explorer/1.0

export CLUSTER_DIRECTORY=/home/j.cooke/MPI-Testing
#export CLUSTER_DIRECTORY=/shared/EL9/explorer
export SOFTWARE_NAME=OpenMPI
export SOFTWARE_VERSION=4.1.6
export GITHUB_URL=git@github.com:northeastern-rc-software-modules/OpenMPI-4.1.6.git

export SOFTWARE_DIRECTORY=$CLUSTER_DIRECTORY/$SOFTWARE_NAME/$SOFTWARE_VERSION
export PATH=$SOFTWARE_DIRECTORY/bin:$PATH
export LIBRARY_PATH=$SOFTWARE_DIRECTORY/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$SOFTWARE_DIRECTORY/lib:$LD_LIBRARY_PATH
export CPATH=$SOFTWARE_DIRECTORY/include:$CPATH
