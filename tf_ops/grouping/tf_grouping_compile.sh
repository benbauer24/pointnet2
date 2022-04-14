#/bin/bash
#/usr/local/cuda-11.4/bin/nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF1.2
#g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
#g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -I /usr/local/lib/python2.7/dist-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L/usr/local/lib/python2.7/dist-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF2.8
#g++ -std=c++14 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I $venv/py38/lib/python3.8/site-packages/tensorflow/include -I /usr/local/cuda-11.4/include -I $venv/py38/lib/python3.8/site-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda-11.4/lib64/ -L$venv/py38/lib/python3.8/site-packages/tensorflow -fPIC -O2

CUDA_ROOT=/usr/local/cuda-11.4
TF_ROOT=$venv/py38/lib/python3.8/site-packages/tensorflow
$CUDA_ROOT/bin/nvcc -std=c++11 -c -o tf_grouping_g.cu.o tf_grouping_g.cu -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
#TF 1.8
g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I ${TF_ROOT}/include -I ${CUDA_ROOT}/include -I ${TF_ROOT}/include/external/nsync/public -lcudart -L ${CUDA_ROOT}/lib64/ -L ${TF_ROOT} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0