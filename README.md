os_check_configure_ansible
---

Ansible自动化收集集群基本配置信息，并备份指定文件

### 设计原则
- 初步实现持续集成流程中`配置管理`与`环境管理`的部分功能
- Ansible服务节点收集Agent节点硬件配置与系统内核参数信息，并备份到服务节点做`环境管理`
- Ansible服务节点收集Agent节点指定文件或目录数据，并备份到服务节点做`配置管理`

### 使用方法

> 1. 使用前确定主节点已完成无密码访问，Ansible能正常连接Agent

- Hosts配置

```
# hosts 文件配置如下:
## 各自node对应服务节点地址，可重复填写，可自由添加
[mongodb-node] 

[mysql-node]

[springboot_cloud-node]

[all-node:children]
mongodb-node
mysql-node
springboot_cloud-node
```

- 备份节点硬件配置与系统内核参数信息

```
# 备份hosts配置文件中各主机基本信息到当前目录，形成后缀即时html文件，可直接点击使用
sh example-configure.sh
```

- 备份节点指定文件或目录数据

```
# 备份hosts配置文件中各主机指定文件或目录数据当前目录backup目录下，形成即时目录存档

sh example-backup.sh

```

- 回滚节点指定版本文件或目录数据

```
sh example-restore.sh
```

### 其它
- 节点信息备份脚本使用了[ansible-cmdb](https://github.com/fboender/ansible-cmdb)模块，详细使用方式请查看官方github
