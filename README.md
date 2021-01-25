#说明

这里放的是各种配置文件

##VIM安装步骤

0. git代理设置
```
git config --global http.https://github.com.proxy http://127.0.0.1:1087
git config --global https.https://github.com.proxy http://127.0.0.1:1087
```
ssh 方式  `~/.ssh/config`
```
Host github.com
HOSTNAME github.com
User git
ProxyCommand nc -X 5 -x 127.0.0.1:1080 %h %p
```

1.dot文件
```
git clone https://github.com/haharazer/dotfile
cp -r vim ~/.vim
cp vimrc ~/.vimrc
```

2.安装vundle
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

3.安装插件
打开vim
```
:BundleInstall
```
