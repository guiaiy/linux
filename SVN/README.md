- ### 软件包
  - #### < subversion >
- ### 步骤
  - #### 运行命令< svn create /var/svn/project >创建库目录"/var/svn/project/"（需要事先创建/var/svn目录）
  - #### 运行命令< svn import 目录|文件  file:///var/svn/project/ >将目录或文件导入库
  - #### 修改配置文件
    - #### 路径 <==/var/svn/project/conf/==>
    - #### <[svnserve](https://github.com/guiaiy/linux/blob/master/SVN/svnserve.conf)> <[passwd](https://github.com/guiaiy/linux/blob/master/SVN/svnserve.conf)> <[authz](https://github.com/guiaiy/linux/blob/master/SVN/authz)>

