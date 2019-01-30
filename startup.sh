# update Linux package manager and run available upgrades
# (at the time this was written, this was needed for an OpenAI Gym dependency)
sudo apt update && sudo apt -y upgrade

# Download Anaconda
curl https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh -o conda_install.sh

# Install Anaconda
bash conda_install.sh -b -p ~/anaconda
rm conda_install.sh

# Add conda command to PATH
echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc

# Refresh terminal
source .bashrc

# Update conda
conda update -y conda

# Add channels to conda
conda config --add channels conda-forge # For ONNX/tensorboardX
conda config --add channels pytorch # For PyTorch

# Clone Horizon
git clone https://github.com/facebookresearch/Horizon.git
cd Horizon/

# Install Horizon dependencies (and Jupyter)
conda install -y --file docker/requirements.txt
conda install jupyter
conda install jupyterlab

# Install ONNX
pip install onnx

# Set JAVA_HOME to location of anaconda
export JAVA_HOME="~/anaconda"

# Install Spark
wget http://apache.claz.org/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
tar -xzf spark-2.4.0-bin-hadoop2.7.tgz
sudo mv spark-2.4.0-bin-hadoop2.7 /usr/local/spark

# Add Spark to path for spark-submit
export PATH=$PATH:/usr/local/spark/bin

# Install OpenAI Gym
pip install gym

# Build Horizon Thrift classes with Apache Thrift
thrift --gen py --out . ml/rl/thrift/core.thrift

# Install Horizon
pip install -e .

# Run Horizon unit tests
python setup.py test

# Go back to root directory
cd

# Start Jupyter server
jupyter notebook
