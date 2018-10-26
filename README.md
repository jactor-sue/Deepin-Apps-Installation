# Deepin 软件安装教程
本仓库介绍如何在基于Ubuntu的系统上安装deepin-wine以及[Deepin](https://zh.wikipedia.org/wiki/%E6%B7%B1%E5%BA%A6%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F)公司移植的一些软件，比如微信、QQ、TIM、迅雷等。

This repo shows how to install apps packaged with deepin-wine by Deepin on Ubuntu based linux distributions, like Wechat, QQ, TIM, Thunder Speed etc. [ENGLISH README](./docs/README-en.md)

![screenshot-desktop](./docs/images/screenshot-desktop.png)

## 克隆仓库到本地
```sh
git clone https://github.com/Jactor-Sue/Deepin-Apps-Installation.git
```
## 安装
### 安装`deepin-wine`
```sh
chmod +x ./install-deepin-wine.sh && ./install-deepin-wine.sh
```
### 安装Deepin移植的软件
`deepin-apps`文件夹下有一些常用的软件，选择需要的软件安装
```sh
cd ./deepin-apps
sudo dpkg -i xxx.deb
```

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

之后就可以在Launcher中找到所安装的软件了。

![screenshot-launcher](./docs/images/screenshot-launcher.png)

>**注意：** 安装好后第一次启动时间可能较长，也可能失败，如果失败可以多长尝试几次或重启桌面
### 其他软件
大家可以到Deepin的源下载更多软件进行测试 [Deepin packages non-free](http://packages.deepin.com/deepin/pool/non-free/)


## 卸载
#### 卸载apps
```sh
sudo dpkg -P xxx #xxx为安装时的包名
```
#### 卸载`deepin-wine`
```sh
chmod+x ./uninstall-deepin-wine.sh ./uninstall-deepin-wine.sh
```
>**注意：** 卸载`deepin-wine`之后已经安装的apps会由于依赖问题也被卸载

## 已测试系统/桌面
系统|桌面|支持
-|-|-
Ubuntu16.04|Unity|是
Ubuntu18.04|Gnome|是
LinuxMint18.x|Cinnamon|是
LinuxMint19.0|Cinnamon|是
Kubuntu|KDE Plasma|否

## 常见问题
[常见错误和问题](/docs/FAQs.md)

## 社区
我在[深度社区](https://bbs.deepin.org/forum.php)找到了很多问题的解决办法。

## 支持
- [捐赠深度社区](https://bbs.deepin.org/forum.php?mod=viewthread&tid=40784&extra=page%3D1)
- [分享](https://github.com/Jactor-Sue/Deepin-Apps-Installation/issues)你测试过好用的软件
- [反馈](https://github.com/Jactor-Sue/Deepin-Apps-Installation/issues)你测试过的系统和桌面
- [分享](https://github.com/Jactor-Sue/Deepin-Apps-Installation/issues)在使用过程中遇到的问题和解决办法
