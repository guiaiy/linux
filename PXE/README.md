https://note.youdao.com/web/#/file/WEBfbb3fd3f05a69f9238217f98b921a07f/markdown/WEBc7da725e43fc554224beb1ce9e3f93c5/

- #### 软件包
    - #####  <httpd>                      通过web服务将光盘镜像发布
    - #####  <dhcp>                       为机器提供ip地址
    - #####  <tftp-server> <tftp>         存放各种必需文件
    - #####  <syslinux>                   引导文件
    - #####  <system-config-kickstart>    生成应答文件
- #### 基本步骤
    - ##### 修改==/etc/fstab==<[挂载光盘](https://github.com/guiaiy/linux/blob/master/PXE/fstab)> 
    - ##### 修改==/etc/dhcp/dhcp.conf==<[配置DHCP](https://github.com/guiaiy/linux/blob/master/PXE/dhcp.conf)>
    - ##### 运行kickstart生成<[应答文件](https://github.com/guiaiy/linux/blob/master/PXE/ks7.cfg)>到==/var/www/html/==
    - ##### 搭建TFTP服务器并<[部署启动文件](https://github.com/guiaiy/linux/blob/master/PXE/start.sh)>到==/var/lib/tftpboot/==
    - ##### 修改==/var/lib/tftpboot/pxelinux.cfg/default/==<[调整启动参数](https://github.com/guiaiy/linux/blob/master/PXE/default)>
