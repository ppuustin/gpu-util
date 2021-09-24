Intro
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