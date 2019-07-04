#!/bin/bash
  
set -e 

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    csys=Linux
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    csys=MacOSX
else
    echo "Unsupported system $TRAVIS_OS_NAME"
    exit 1
fi

wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-$csys-x86_64.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -f -p $CONDA_HOME
conda config --set always_yes yes --set changeps1 no
conda config --set anaconda_upload no # not automatically at least
conda update -q conda
conda info -a
conda install conda-build conda-verify anaconda-client
