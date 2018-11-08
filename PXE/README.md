https://note.youdao.com/web/#/file/WEBfbb3fd3f05a69f9238217f98b921a07f/markdown/WEBc7da725e43fc554224beb1ce9e3f93c5/

- #### 软件包
    - #####  <httpd> 
    - #####  <dhcp> 
    - #####  <tftp-server> <tftp>
    - #####  <syslinux>
    - #####  <system-config-kickstart>
- #### 基本步骤
    - ##### 修改==/etc/fstab==<[挂载光盘]> 
    - ##### 修改==/etc/dhcp/dhcp.conf==<[配置DHCP]>
    - ##### 运行kickstart生成<[应答文件]>到==/var/www/html/==
    - ##### 搭建TFTP服务器并<[部署启动文件]>到==/var/lib/tftpboot/==
    - ##### 修改==/var/lib/tftpboot/pxelinux.cfg/default/==<[调整启动参数]>
