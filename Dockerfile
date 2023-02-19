FROM tensorflow/tensorflow:latest-gpu-jupyter

ENV python_version 3.8

# Install desired Python version (the current TF image is based on Ubuntu at the moment)
RUN apt install -y python${python_version}

# Set default version for root user 
RUN update-alternatives --install /usr/local/bin/python python /usr/bin/python${python_version} 1

# Update pip: https://packaging.python.org/tutorials/installing-packages/#ensure-pip-setuptools-and-wheel-are-up-to-date
RUN python -m pip install --upgrade pip setuptools wheel

COPY requirements.txt requirements.txt

RUN python -m pip install -r requirements.txt

EXPOSE 8888