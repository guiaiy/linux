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
- ##### cd /var/named
- #####	cp -p named.locahost default.cn.zone
- #### 配置
- ##### 文件：<[基本配置]> <[DNS轮询]> <[泛域名解析]> <[子域授权：父]> <[子域授权：子]> <[缓存DNS]> <[分离解析]>
- ##### 
- ##### 地址库文件：<[基本配置]> <[DNS轮询]> <[泛域名解析]> <[子域授权：父]> <[子域授权：子]>
- ###### 首先执行以下操作，防止权限出现问题
- ###### cd /var/named
- ###### cp -p named.locahost default.cn.zone

	

