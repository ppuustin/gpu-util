Windows
==============

This is a simple example to enable GPU support for Windows.
It includes the overview of the needed utility software
as well as testing utilities to verify the usage.

CUDA supported card is assumed to be available.

The versions of needed software are listed in [Tensorflow support pages](https://www.tensorflow.org/install/source_windows).
There, a table of tested CPU and GPU Tensorflow configurations are found.
The example aims to install Tensorflow GPU version 2.6.0 and for it,
the reguired software and versions are listed in correct installation order as follows:
```
MSVC 2019
CUDA: 11.2
cuDNN: 8.1
Python: 3.6-3.9	
tensorflow-gpu: 2.6.0
```
The detailed installation instructions can be found from [CUDA](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html) and [cuDNN](https://docs.nvidia.com/deeplearning/cudnn/archives/cudnn_765/cudnn-install/index.html) support pages.
The [NVIDIA smi](https://developer.nvidia.com/nvidia-system-management-interface) utility offers different manageent functions including the utilisation of the GPU device.

The MSVC, CUDA and Python does not require any specific setup to be done during the installation.
The cuDNN requires its libraries to be copied from the package bin, include and lib
directories to the corresponding CUDA installation directories.

Installation of the specific Tensorflow example can be found from the following batch file.
```
pip.bat
```
A training example code are executed using the runpy batch file.
```
runpy.bat
```
Whether available GPU is utilized, it can be seen by using the nvidiasmi utility.
```
nvidiasmi.bat
```
The following example illustrates the output of the tool, where the GPU-util
percentage is non-zero if the training is using the GPU.
```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 442.23       Driver Version: 442.23       CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name            TCC/WDDM | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Quadro T1000       WDDM  | 00000000:01:00.0 Off |                  N/A |
| N/A   48C    P8     5W /  N/A |    134MiB /  4096MiB |     12%      Default |
+-------------------------------+----------------------+----------------------+
```

Ubuntu
==============

Target packages.

```
CUDA 10.0
cuDNN 7.4
tensorflow_gpu-1.15.0
```
Check the graphic card.
```
$ lspci | grep -i nvidia
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1080] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller (rev a1)
```
Or.
```
$ lspci | grep VGA
VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1080] (rev a1)
```
Check the CPU and the memory.
```
$ cat /proc/cpuinfo | grep "model name"
model name	: Intel(R) Core(TM) i7-6700K CPU @ 4.00GHz
```

```
$ sudo dmidecode -t 17 | grep Size
	Size: 8192 MB
	Size: 8192 MB
```

```
$ grep MemTotal /proc/meminfo | awk '{print $2 / 1024}'
15955.6
```
Install Nvidia drivers.
Check what version the current version is and what is available.
```
$ modinfo nvidia | grep version
$ ubuntu-drivers devices
```
Select version 430.
```
$ sudo ubuntu-drivers autoinstall
```
Or.
```
$ sudo apt install nvidia-430
```
Select Nvidia driver before rebooting.
```
$ prime-select query
$ prime-select nvidia
```
Reboot.


Install Cuda.

Check first.
```
$ nvcc --version
$ apt list --installed | grep -i nvcc
```
Install.
```
$ sudo apt-get install cuda=10.0.130-1
```
Install cuDNN: Download runtime, developer libs and examples packages first.
```
$ sudo dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
$ sudo dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb 
$ sudo dpkg -i libcudnn7-doc_7.4.2.24-1+cuda10.0_amd64.deb
```

```
$ sudo apt-mark hold libcudnn7 libcudnn7-dev
$ apt-mark showhold
```
Set the path.
```
$ vi ~/.bashrc
```

```
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-10.0/bin:$PATH
```

```
$ source ~/.bashrc
```
Check the Python version.
```
$ python3 -V
Python 3.6.8
```
Install the Tensorflow.
```
$ pip install "tensorflow-gpu==1.15.0"
```
When needed, remove the previous releases: (cuda 11.4 or later has an unistaller)
```
$ sudo apt-get --purge remove "*cublas*" "cuda*" "nsight*" 
$ sudo apt-get --purge remove "libcudnn7*"
$ sudo apt-get --purge remove "*nvidia*"
```


