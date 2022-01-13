### .bashrc
ulimit -s unlimited
export MKL_DEBUG_CPU_TYPE=5

export PATH=/home/lsvvt/work/orca:$PATH
export LD_LIBRARY_PATH=/home/lsvvt/work/orca:$LD_LIBRARY_PATH

export PATH=/home/lsvvt/openmpi/bin:$PATH
export LD_LIBRARY_PATH=/home/lsvvt/openmpi/lib:$LD_LIBRARY_PATH


### LuxCore 2.5
wget https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v2.5/luxcorerender-v2.5-linux64.tar.bz2
tar xf luxcorerender-v2.5-linux64.tar.bz2
cd LuxCore/
python3 pyluxcoretools.zip console scenes/cornell/cornell.cfg


### Gaussian 16 C01


### xtb 6.4.1
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh
bash Miniconda3-py39_4.9.2-Linux-x86_64.sh
eval /home/lsvvt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
conda config --add channels conda-forge
conda create --name xtb-mkl xtb "libblas=*=*mkl"
conda activate xtb-mkl


### Orca 5.0.0
conda install -c conda-forge openmpi=4.1.1
scl enable devtoolset-8 -- bash

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.bz2
tar xf openmpi-4.1.1.tar.bz2
cd openmpi-4.1.1
./configure --prefix=/home/lsvvt/openmpi
make -j8
make install


## RUN
nohup ./run.sh 24 & 
