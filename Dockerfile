# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir jupyterlab numpy

# Copy the current directory contents into the container
COPY . .

# Expose the Jupyter port
EXPOSE 8888

# Run Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]