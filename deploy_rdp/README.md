# Instruction

## 1. Download
✅Login `root@foundation0`

✅Please copy this folder `deploy_rdp` to the root home directory
```bash
$ tree -d deploy_rdp
deploy_rdp
├── epel_pkgs
│   ├── Packages
│   └── repodata
└── roles
    ├── config_net
    │   ├── defaults
    │   ├── files
    │   ├── meta
    │   ├── tasks
    │   └── templates
    ├── f0server
    │   ├── defaults
    │   ├── files
    │   ├── handlers
    │   ├── meta
    │   ├── tasks
    │   ├── templates
    │   ├── tests
    │   └── vars
    ├── kiosk_gdm
    │   ├── defaults
    │   ├── files
    │   ├── meta
    │   ├── tasks
    │   └── tests
    └── xrdp
        ├── defaults
        ├── handlers
        ├── meta
        ├── tasks
        ├── tests
        └── vars

```

## 2. Modify
✅Modify the list of managed hosts in line 2 of `deploy_foundationx.yml`, default vault is `all`:
   ```bash
   $ vim +2 deploy_foundationx.yml 
   2 - hosts: all
   ``` 
✅Modify the list of managed hosts in line 2 of `cron_power.yml`(only for cloudshell student,NOT red hat), default vault is `all`:
   ```bash
   $ vim +2 cron_power.yml
   2 - hosts: all
 
   # enable cron job
   $ ansible-playbook -e state=present cron_poweroff.yml
   # disable cron job
   $ ansible-playbook -e state=absent cron_poweroff.yml
   ```
  

## 3. Run
✅Run command `ansible-playbook playbook.yml`:
   ```bash
   $ ansible-playbook playbook.yml
   ```
