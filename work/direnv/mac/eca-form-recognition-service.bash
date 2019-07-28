# Variables needed to build OpenCV.
export OPENCV_ROOT=~/dev/3p/ocv/opencv
export OPENCV_INCLUDE_DIR=${OPENCV_ROOT}/include
export OPENCV_LIB_DIR=${OPENCV_ROOT}/lib

# Turns off building of OpenVCV4NodeJS everytime and 'npm install' is run in that directory.
#export OPENCV4NODEJS_DISABLE_AUTOBUILD=1
export OPENCV4NODEJS_DISABLE_AUTOBUILD=true

# Allows Tesseract to be spawned and for it to find its tessdata files.
export TESSERACT_ROOT=~/bin/tesseract
export TESSDATA_PREFIX=$TESSERACT_ROOT/tessdata

export PATH=$PATH:${OPENCV_ROOT}'/bin':$TESSERACT_ROOT
unset OPENCV_ROOT TESSERACT_ROOT

# Quiets the test output by not showing the JSON? payload sent for each request.
export SKIP_PAYLOAD_LOG=true

