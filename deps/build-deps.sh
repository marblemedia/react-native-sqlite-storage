# You'll need android sdk + ndk installed
# Change 
NDK_DIR=${ANDROID_NDK_HOME:-~/Library/Android/sdk/ndk/24.0.8215888}

echo "Building sqlite-connector.jar"
cd Android-sqlite-connector
make
cp sqlite-connector.jar ../../platforms/android-native/libs
cd ..

echo "Building native drivers"
cd Android-sqlite-native-driver
make init
PATH=$PATH:$NDK_DIR make
cp -r lib/* ../../platforms/android-native/libs
