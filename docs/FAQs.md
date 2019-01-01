# 常见问题及处理

<!-- TOC -->

- [常见问题及处理](#常见问题及处理)
    - [运行过程中常见问题](#运行过程中常见问题)
        - [deepin软件的文件在哪](#deepin软件的文件在哪)
        - [微信黑方框问题](#微信黑方框问题)
            - [解决方案](#解决方案)
        - [多屏幕微信图标卡死问题](#多屏幕微信图标卡死问题)
            - [解决方案](#解决方案-1)
        - [高分屏调整DPI](#高分屏调整dpi)
            - [解决方案](#解决方案-2)
        - [更新微信QQ到最新版](#更新微信qq到最新版)
        - [微信QQ快捷键](#微信qq快捷键)
            - [为`deepin-wine`添加快捷键](#为deepin-wine添加快捷键)
            - [设置系统快捷键](#设置系统快捷键)
    - [安装过程中常见问题](#安装过程中常见问题)
        - [`different version`错误](#different-version错误)
        - [`overwrite`错误](#overwrite错误)
        - [`dependency`错误](#dependency错误)

<!-- /TOC -->

## 运行过程中常见问题

### deepin软件的文件在哪

- `deepin-wine`软件本身安装在`/usr/bin/`目录下，可以用`which deepin-wine`查看
- `deepin-wine`安装的软件容器在`/opt/deepinwine/apps/`目录下
- `deepin`移植的软件的DesktopEntry文件在`/usr/local/share/applications/`目录下，微信的在`/opt/deepinwine/apps/Deepin-WeChat`目录下
- `deepin-wine`容器产生的文件在`~/.deepinwine/`目录下，如果想清空容器就删除在`～/.deepinwine`目录下对应的文件夹

### 微信黑方框问题

这个是由于表情包弹窗bug导致的

#### 解决方案

在任意聊天界面打一下会弹出表情的问题，比如我常用的“哈哈哈”会弹出表情，然后再把这些文字删除就行了

### 多屏幕微信图标卡死问题
使用多屏幕时微信在要用了一段时间之后会卡死，这是由于主屏幕的位置起点不是(0,0)引起的
#### 解决方案
将主屏放到左边即可解决
> 参考资料： https://bbs.deepin.org/forum.php?mod=viewthread&tid=155949&page=1#pid459114

### 高分屏调整DPI

`deepin-wine`打包的软件默认96 dpi，在高分屏下字体和窗口会很小
#### 解决方案
打开Wine configuration界面，以微信为例

```sh
WINEPREFIX=~/Deepin-WeChat/ deepin-wine winecfg
```

在Graphics标签下修改dpi，我设置的120(1.25倍)

### 更新微信QQ到最新版
如果有人追求微信的最新版本，可以下载最新版本微信`WeChatSetup.exe`，通过`deepin-wine`安装，QQ的安装类似

```sh
WINEPREFIX=~/Deepin-WeChat/ deepin-wine WeChatSetup.exe
```

如果想退回，就直接直接删除`~/.deepinwine/`目录下对应的文件夹即可

### 微信QQ快捷键

`deepin-wine`可以将Ubuntu系统上的快捷键传入容器，很方便

#### 为`deepin-wine`添加快捷键

```sh
/opt/deepinwine/tools/add_hotkeys "打开微信" " w WeChat" "<Control><Alt>W"
/opt/deepinwine/tools/add_hotkeys "打开微信" " z QQ" "<Control><Alt>Z"
```

#### 设置系统快捷键

在系统键盘设置中设置"打开微信"快捷键

- 命令：/opt/deepinwine/tools/sendkeys.sh w WeChat
- 快捷键：Ctrl+Alt+w

设置"打开QQ"快捷键

- 命令：/opt/deepinwine/tools/sendkeys.sh z QQ
- 快捷键：Ctrl+Alt+z

> 参考资料： https://bbs.deepin.org/forum.php?mod=viewthread&tid=154921

## 安装过程中常见问题

### `different version`错误

在安装包的时候可能会遇到版本不同的问题，类似报错信息如下：

```sh
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

```sh
sudo apt install -f
```

会告诉你要安装一些包，问你是否继续

```sh
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

### `overwrite`错误

错误提示在覆盖某一个文件时失败：

```sh
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

```sh
sudo rm /usr/share/doc/libgstreamer0.10-0/changelog.Debian.gz
sudo apt install -f
```

> **注意：** 这里可能会多次处理错误二，要有耐心

### `dependency`错误

有时安装`deb`包的时候会出现依赖问题错误，类似如下：

```sh
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

**解决办法：**

运行

```sh
sudo apt install -f
```

会提示需要安装一些包，问你是否安装

```sh
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
