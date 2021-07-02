#!/bin/sh

# CREATE A PYTHON3 ENVIRONMENT AND SET ITS PATH HERE
export PYROMS_PATH=$1
# export PYROMS_PATH=/home/rsoutelino/Envs/pyroms/lib/python3.8/site-packages/pyroms

# INSTALL via apt:
# sudo apt install lp-solve liblpsolve55-dev libnetcdff-dev
# lpsolve installation still not working

export DESTDIR=/usr/local

pip install -r requirements.txt
pip install https://github.com/matplotlib/basemap/archive/v1.2.0rel.zip

# lpsolve installation is a pain
# git clone https://github.com/chandu-atina/lp_solve_python_3x.git
# wget -O 'lp_solve.tar.gz' http://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.0/lp_solve_5.5.2.0_source.tar.gz/download
# tar -xzvf lp_solve.tar.gz
# cp -r lp_solve_python_3x/extra/Python lp_solve_5.5
# cd lp_solve_5.5/extra/Python
# sh ccc

cd pyroms
export CURDIR=`pwd`

echo
echo "installing pyroms..."
echo
python setup.py build --fcompiler=gnu95 
python setup.py install 

echo "installing external libraries..."

cd $CURDIR/external/nn
./configure --prefix=$DESTDIR
make && sudo make install

cd $CURDIR/external/csa
./configure --prefix=$DESTDIR
make && sudo make install

cd $CURDIR/external/gridutils
./configure CPPFLAGS=-I$DESTDIR/include LDFLAGS=-L$DESTDIR/lib CFLAGS=-I$DESTDIR/include --prefix=$DESTDIR
make && sudo make install

cd $CURDIR/external/gridgen
export SHLIBS=-L$DESTDIR/lib
./configure CPPFLAGS=-I$DESTDIR/include LDFLAGS=-L$DESTDIR/lib CFLAGS=-I$DESTDIR/include --prefix=$DESTDIR
make
make lib
make shlib
sudo make install
# Now setting this above because this gave me an error:
#PYROMS_PATH=`python -c 'import pyroms ; print pyroms.__path__[0]'`
# $ echo $PYROMS_PATH
cp libgridgen.so $PYROMS_PATH

echo "installing scrip..."
cd $CURDIR/external/scrip/source

make
make f2py
sudo make install
cp -r scrip*.so* $PYROMS_PATH

cd $CURDIR/
cd ../pyroms_toolbox
sudo python setup.py install
cd $PYROMS_PATH
cp -r $CURDIR/../pyroms_toolbox/pyroms_toolbox ..

cd $CURDIR
cd ../bathy_smoother
sudo python setup.py install
cd $PYROMS_PATH
cp -r $CURDIR/../bathy_smoother/bathy_smoother ..

echo
echo "Done installing pyroms..."



