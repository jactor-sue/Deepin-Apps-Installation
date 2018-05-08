# Linux Mint18/Ubuntu16.04安装deepin软件
本文介绍如何在Linux Mint18/Ubuntu16.04上安装deepin-wine以及deepin移植的一些软件，比如微信、QQ、TIM、迅雷等。
## 适合系统
本文只在Linux Mint18上进行了安装，Linux Mint18是基于Ubuntu16.04的系统，所以理论上Ubuntu16.04也可以安装。
## 预备知识
### 安装`deb`包
首先说明安装`deb`包的命令如下：
```
sudo dpkg -i xxx.deb
```
其中`xxx.deb`为包名
### 错误处理
在安装的过程中可能会出现一些错误，下面来介绍解决办法
#### 错误一：`different version`错误
在安装包的时候可能会遇到版本不同的问题，类似报错信息如下：
```
dpkg: warning: downgrading libgstreamer0.10-0:i386 from 0.10.36-1.5ubuntu1 to 0.10.36-1.5
(Reading database ... 596296 files and directories currently installed.)
Preparing to unpack libgstreamer0.10-0_0.10.36-1.5_i386.deb ...
De-configuring libgstreamer0.10-0:amd64 (0.10.36-1.5ubuntu1) ...
Unpacking libgstreamer0.10-0:i386 (0.10.36-1.5) over (0.10.36-1.5ubuntu1) ...
dpkg: error processing package libgstreamer0.10-0:i386 (--install):
 package libgstreamer0.10-0:i386 0.10.36-1.5 cannot be configured because libgstreamer0.10-0:amd64 is at a different version (0.10.36-1.5ubuntu1)
dpkg: error processing package libgstreamer0.10-0:amd64 (--install):
 package libgstreamer0.10-0:amd64 0.10.36-1.5ubuntu1 cannot be configured because libgstreamer0.10-0:i386 is at a different version (0.10.36-1.5)
Errors were encountered while processing:
 libgstreamer0.10-0:i386
 libgstreamer0.10-0:amd64
```
错误信息提示在安装`libgstreamer0.10-0:i386`包时遇到版本错误。
**解决办法：**

运行
```
sudo apt install -f
```
会告诉你要安装一些包，问你是否继续
```
Reading package lists... Done
Building dependency tree
Reading state information... Done
Correcting dependencies... Done
The following additional packages will be installed:
  libgstreamer0.10-0:i386
Suggested packages:
  gstreamer0.10-tools:i386
The following packages will be upgraded:
  libgstreamer0.10-0:i386
1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
2 not fully installed or removed.
Need to get 0 B/674 kB of archives.
After this operation, 1,006 kB disk space will be freed.
Do you want to continue? [Y/n] Y
```
输入`Y`继续，这时可能会出现**错误二**。
#### 错误二：`overwrite`错误
错误提示在覆盖某一个文件时失败：
```
(Reading database ... 596335 files and directories currently installed.)
Preparing to unpack .../libgstreamer0.10-0_0.10.36-1.5ubuntu1_i386.deb ...
Unpacking libgstreamer0.10-0:i386 (0.10.36-1.5ubuntu1) over (0.10.36-1.5) ...
dpkg: error processing archive /var/cache/apt/archives/libgstreamer0.10-0_0.10.36-1.5ubuntu1_i386.deb (--unpack):
 trying to overwrite shared '/usr/share/doc/libgstreamer0.10-0/changelog.Debian.gz', which is different from other instances of package libgstreamer0.10-0:i386
dpkg-deb: error: subprocess paste was killed by signal (Broken pipe)
Errors were encountered while processing:
 /var/cache/apt/archives/libgstreamer0.10-0_0.10.36-1.5ubuntu1_i386.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
```
**解决办法：**

删除错误信息中给出的路径指定的文件`/usr/share/doc/libgstreamer0.10-0/changelog.Debian.gz`，然后重新运行命令：
```
sudo rm /usr/share/doc/libgstreamer0.10-0/changelog.Debian.gz
sudo apt install -f
```
> **注意：** 这里可能会多次处理错误二，要有耐心
#### 错误三：`dependency`错误
有时安装`deb`包的时候会出现依赖问题错误，类似如下：
```
Selecting previously unselected package deepin-libwine-dev:i386.
(Reading database ... 598079 files and directories currently installed.)
Preparing to unpack deepin-libwine-dev_2.18-8~rc4_i386.deb ...
Unpacking deepin-libwine-dev:i386 (2.18-8~rc4) ...
dpkg: dependency problems prevent configuration of deepin-libwine-dev:i386:
 deepin-libwine-dev:i386 depends on libc6-dev.

dpkg: error processing package deepin-libwine-dev:i386 (--install):
 dependency problems - leaving unconfigured
Errors were encountered while processing:
 deepin-libwine-dev:i386
```
错误信息中提示`deepin-libwine-dev:i386 depends on libc6-dev`，也就是说`deepin-libwine-dev:i386`包依赖`libc6-dev`包。

**解决办法：（同错误一）**

运行
```
sudo apt install -f
```
会提示需要安装一些包，问你是否安装
```
Reading package lists... Done
Building dependency tree
Reading state information... Done
Correcting dependencies... Done
The following additional packages will be installed:
  libc6-dev:i386 linux-libc-dev:i386
Suggested packages:
  glibc-doc:i386 manpages-dev:i386
The following NEW packages will be installed:
  libc6-dev:i386 linux-libc-dev:i386
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
1 not fully installed or removed.
Need to get 2,522 kB of archives.
After this operation, 14.1 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
输入`Y`继续，将依赖的包安装。
## 安装库文件
进入`libs`文件夹：
首先安装如下几个包：
- libgif4_4.1.6-11_i386.deb
- libgnutls26_2.12.23-18_i386.deb
- libgnutls-deb0-28_3.3.20-1_i386.deb
- libjpeg62-turbo_1.5.1-2_i386.deb
- libpng16-16_1.6.34-1_i386.deb
- libreadline7_7.0-1_i386.deb
- udis86_1.72-2_i386.deb
- libgstreamer0.10-0_0.10.36-1.5_i386.deb
- libgstreamer-plugins-base0.10-0_0.10.36-2_i386.deb
## 安装deepin-wine
进入`deepin-wine`文件夹，**按照如下顺序**安装各包。
> **注意**：由于包之间有依赖关系，所以请按照如下顺序安装，可以重复安装，但是不能漏装
- deepin-fonts-wine_2.18-8~rc4_all.deb
- deepin-libwine_2.18-8~rc4_i386.deb
- deepin-libwine-dbg_2.18-8~rc4_i386.deb
- deepin-libwine-dev_2.18-8~rc4_i386.deb
- deepin-wine32_2.18-8~rc4_i386.deb
- deepin-wine32-preloader_2.18-8~rc4_i386.deb
- deepin-wine_2.18-8~rc4_all.deb
- deepin-wine-binfmt_2.18-8~rc4_all.deb
- deepin-wine-plugin_1.0deepin2_i386.deb
- deepin-wine-plugin-virtual_1.0deepin0_all.deb
- deepin-wine-helper_1.1deepin9_i386.deb
- deepin-wine-uninstaller_0.1deepin2_i386.deb
## 安装deepin-apps
进入`deepin-apps`文件夹，安装需要的软件，之后就可以在Launcher中找到所安装的软件了。
>**注意：** 安装好后第一次启动时间可能较长，也可能失败，如果失败可以多长尝试几次

包名和软件对照如下表：
包名|软件名
-|-
deepin.com.baidu.pan_5.5.4deepin8_i386.deb|百度网盘
deepin.com.qq.im_8.9.19983deepin20_i386.deb|QQ
deepin.com.qq.im.light_7.9.14308deepin8_i386.deb|QQ轻聊版
deepin.com.qq.office_2.0.0deepin1_i386.deb|TIM
deepin.com.taobao.wangwang_9.11.02Cdeepin0_i386.deb|阿里旺旺
deepin.com.thunderspeed_7.10.35.366deepin17_i386.deb|迅雷精简版
deepin.com.wechat_2.6.2.31deepin0_i386.deb|微信
