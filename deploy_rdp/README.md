# Instruction

1. Please copy this folder `deploy_rdp` to the root home directory
   请将 `deploy_rdp` 文件夹拷贝到 `root@foundation0` 的家目录


2. Modify the list of managed hosts in line 29 of `playbook.yml`
   请修改 `playbook.yml` 中第29行受管主机的内容，默认值为 `all`
   ```bash
   $ vim +29 playbook.yml
   29 hosts: all
   ``` 

3. Run command `ansible-playbook playbook.yml`
   运行命令 `ansible-playbook playbook.yml`
   ```bash
   $ ansible-playbook playbook.yml
   ```   

