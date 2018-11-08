https://note.youdao.com/web/#/file/WEBfbb3fd3f05a69f9238217f98b921a07f/markdown/WEB854da7bd39720802047d44d5fbddfcd7/


- #### 软件包
	 - ##### <bind> <bindchroot>
- #### 服务名
- ##### <named>
- #### 端口号
- ##### <53>
- #### 配置文件
- ##### 路径：==/etc/named.conf==
- #### 地址库文件
- ##### 路径：==/var/named/==
- #####指定DNS服务器：==<[/etc/resolv.conf](https://github.com/guiaiy/linux/blob/master/DNS/resolv.conf)>==
- #### 配置
- #####指定DNS服务器：==<[/etc/resolv.conf](https://github.com/guiaiy/linux/blob/master/DNS/resolv.conf)>==
- ##### 配置文件：<[基本配置](https://github.com/guiaiy/linux/blob/master/DNS/default.cn.zone)> <[DNS轮询](https://github.com/guiaiy/linux/blob/master/DNS/namedlunxun.conf)> <[泛域名解析](https://github.com/guiaiy/linux/blob/master/DNS/fanyuming.conf)> <[子域授权：父](https://github.com/guiaiy/linux/blob/master/DNS/namedfu.conf)> <[子域授权：子](https://github.com/guiaiy/linux/blob/master/DNS/zi.conf)> <[缓存DNS](https://github.com/guiaiy/linux/blob/master/DNS/huancun.conf)> <[分离解析](https://github.com/guiaiy/linux/blob/master/DNS/split.conf)>
- ##### 
- ##### 地址库文件：<[基本配置](https://github.com/guiaiy/linux/blob/master/DNS/default.cn.zone)> <[DNS轮询](https://github.com/guiaiy/linux/blob/master/DNS/lunxun.cn.zone)> <[泛域名解析](https://github.com/guiaiy/linux/blob/master/DNS/fanyuming.cn.zone)> <[子域授权：父](https://github.com/guiaiy/linux/blob/master/DNS/fu.cn.zone)> <[子域授权：子](https://github.com/guiaiy/linux/blob/master/DNS/zi.fu.cn.zone)>
- ###### 首先执行以下操作，防止权限出现问题
- ###### cd /var/named
- ###### cp -p named.locahost default.cn.zone
- ###### ==配置文件与地址库文件一一对应==
	

