#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 environment_name python_version"
    exit 1
fi

ENV_NAME=$1
PYTHON_VERSION=$2

# Create a new conda environment with the provided name and Python version
conda create -n $ENV_NAME python=$PYTHON_VERSION --yes

# Activate the new environment
conda activate $ENV_NAME

# Install ipykernel in the activated environment
conda install ipykernel --yes

# Install the environment as an IPython kernel
ipython kernel install --name "$ENV_NAME" --user
