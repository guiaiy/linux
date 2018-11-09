http://note.youdao.com/noteshare?id=3919a2bfcf3758d0f7a078ca9875f5b1

- ### 软件包
  - #### < subversion >
- ### 步骤
  - #### 运行命令< svn create /var/svn/project >创建库目录"/var/svn/project/"（需要事先创建/var/svn目录）
  - #### 运行命令< svn import 目录|文件  file:///var/svn/project/ >将目录或文件导入库
  - #### 修改配置文件
    - #### 路径 <==/var/svn/project/conf/==>
    - #### <[svnserve](https://github.com/guiaiy/linux/blob/master/SVN/svnserve.conf)> <[passwd](https://github.com/guiaiy/linux/blob/master/SVN/svnserve.conf)> <[authz](https://github.com/guiaiy/linux/blob/master/SVN/authz)>
  - #### 运行命令< svnserve -d -r /var/svn/ >启动服务 “/var/svn/” 设置为根目录
  - #### 客户端运行命令< svn co svn://服务端ip/project 目录>同步文件到目录
  - #### 第一次运行需要添加选项--username=  --password=
  - #### 其他命令运行< svn --help >查看
