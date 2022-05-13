# Instruction

1. ✅Please copy this folder `deploy_rdp` to the root home directory

2. ✅Modify the list of managed hosts in line 29 of `playbook.yml`, default vault is `all`:
   ```bash
   $ vim +29 playbook.yml
   29 hosts: all
   ``` 

3. ✅Run command `ansible-playbook playbook.yml`:
   ```bash
   $ ansible-playbook playbook.yml
   ```