#!/bin/sh

# CREATE A PYTHON3 ENVIRONMENT AND SET ITS PATH HERE
export PYROMS_PATH=/home/rsoutelino/Envs/pyroms/lib/python3.8/site-packages/pyroms

# INSTALL via apt:
# sudo apt install lp-solve liblpsolve55-dev
# lpsolve installation still not working

export DESTDIR=/usr/local

pip install -r requirements.txt
pip install https://github.com/matplotlib/basemap/archive/v1.2.0rel.zip

# lpsolve installation is a pain
# wget -O 'lp_solve.tar.gz' https://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.5/lp_solve_5.5.2.5_Python_source.tar.gz/download

# tar -xzf lp_solve.tar.gz
# cd lp_solve_5.5/extra/Python
# bash build.sh

#pip install -e pyroms
#pip install -e pyroms_toolbox
#pip install -e bathy_smoother

# cd pyroms
# export CURDIR=`pwd`

# echo
# echo "installing pyroms..."
# echo
# python setup.py build --fcompiler=gnu95 
# python setup.py install 

# echo "installing external libraries..."
# echo "installing gridgen..."

# cd $CURDIR/external/nn
# ./configure --prefix=$DESTDIR
# make && make install

# cd $CURDIR/external/csa
# ./configure --prefix=$DESTDIR
# make && make install

# cd $CURDIR/external/gridutils
# ./configure CPPFLAGS=-I$DESTDIR/include LDFLAGS=-L$DESTDIR/lib CFLAGS=-I$DESTDIR/include --prefix=$DESTDIR
# make && make install

# cd $CURDIR/external/gridgen
# export SHLIBS=-L$DESTDIR/lib
# ./configure CPPFLAGS=-I$DESTDIR/include LDFLAGS=-L$DESTDIR/lib CFLAGS=-I$DESTDIR/include --prefix=$DESTDIR
# make
# make lib
# make shlib
# make install
# # Now setting this above because this gave me an error:
# #PYROMS_PATH=`python -c 'import pyroms ; print pyroms.__path__[0]'`
# # $ echo $PYROMS_PATH
# cp libgridgen.so $PYROMS_PATH

# echo "installing scrip..."
# cd $CURDIR/external/scrip/source

# perl -pe "s#\/usr\/local#$DESTDIR#" makefile > makefile2
# make -f makefile2
# make -f makefile2 f2py
# make -f makefile2 install
# +# Write it this way for Darwin...
# cp -r scrip*.so* $PYROMS_PATH


# cd $CURDIR
# echo
# echo "Done installing pyroms..."
# echo "pyroms make use of the so-called gridid file to store"
# echo "grid information like the path to the grid file, the"
# echo "number of vertical level, the vertical transformation"
# echo "use, ..."
# echo "Please set the environment variable PYROMS_GRIDID_FILE"
# echo "to point to your gridid file. A gridid file template"
# echo "is available here:"
# echo "$CURDIR/pyroms/gridid.txt"
# read -p "Press any key to continue or Ctrl+C to quit this install"
# echo


