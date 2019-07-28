# Variables needed to build OpenCV.
export OPENCV_ROOT='c:/dev/wksp/3rd_party/opencv/opencv-3.3.1/build'
export OPENCV_INCLUDE_DIR=${OPENCV_ROOT}'/include'
export OPENCV_LIB_DIR=${OPENCV_ROOT}'/x64/vc14/lib'

# When set to 1, turns off building of OpenVCV4NodeJS everytime and 'npm install' is run in that directory.
export OPENCV4NODEJS_DISABLE_AUTOBUILD=1

# Allows Tesseract to be spawned and for it to find its tessdata files.
export TESSERACT_ROOT=/c/dev/bin/tesseract
export TESSDATA_PREFIX=$TESSERACT_ROOT/tessdata

export PATH=$PATH:${OPENCV_ROOT}'/x64/vc14/bin':$TESSERACT_ROOT
unset OPENCV_ROOT TESSERACT_ROOT

# Quiets the test output by not showing the JSON? payload sent for each request.
export SKIP_PAYLOAD_LOG=true

