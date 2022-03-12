# fcitx5 not working with mendeley

### 确定mendeley采用的QT版本
```
strings /usr/local/mendeleydesktop-1.19.8-linux-x86_64/lib/qt/libQt5Core.so.5 |grep Qt |grep version
```

### 下载对应版本QT
``` 
wget https://download.qt.io/new_archive/qt/5.10/5.10.1/qt-opensource-linux-x64-5.10.1.run

chmod +x qt-opensource-linux-x64-5.10.1.run
sudo ./qt-opensource-linux-x64-5.10.1.run

export PATH=/opt/Qt5.10.1/5.10.1/gcc_64/bin:$PATH
export LD_LIBRARY_PATH=/opt/Qt5.10.1/5.10.1/gcc_64/lib:$LD_LIBRARY_PATH
```


### 同步fcitx5-qt仓库
```
git clone https://github.com/fcitx/fcitx5-qt.git
cd fcitx5-qt
```

### 安装缺省依赖
```
sudo aptitude install extra-cmake-modules libxkbcommon-x11-dev libfcitx5utils-dev libglu1-mesa-dev
mkdir build
cd build/
cmake ..
make -j4
```

### 将编译好的动态库拷贝到mendeley库路径下面去
```
sudo cp qt5/platforminputcontext/libfcitx5platforminputcontextplugin.so /usr/local/mendeleydesktop-1.19.8-linux-x86_64/lib/mendeleydesktop/plugins/platforminputcontexts
```
