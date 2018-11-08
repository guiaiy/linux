#将pxelinux.0拷贝到/var/lib/tftpboot/目录下
cp  /usr/share/syslinux/pxelinux.0  /var/lib/tftpboot/
#拷贝引导装机的内核、初始镜像，部署到TFTP目录,当文件较多时，可以在TFTP目录下创建子目录
mkdir  /var/lib/tftpboot/rhel7
#再通过RHEL7光盘目录找到PXE版内核vmlinuz、初始镜像initrd.img，等必备文件，将其拷贝到上述子目录：
cd  /var/lib/tftpboot/rhel7/
cp /var/www/html/rh7dvd/isolinux/vmlinuz .
cp /var/www/html/rh7dvd/isolinux/initrd.img .
cd ..
cp /var/www/html/rh7dvd/isolinux/vesamenu.c32 .
cp /var/www/html/rh7dvd/isolinux/splash.png 
mkdir pxelinux.cfg
cd pxelinux.cfg
cp /var/www/html/rh7dvd/isolinux/isolinux.cfg ./default

