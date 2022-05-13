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
    ├── kiosk_gdm
    │   ├── defaults
    │   ├── files
    │   ├── meta
    │   ├── tasks
    │   ├── templates
    │   └── tests
    └── xrdp
        ├── defaults
        ├── files
        ├── handlers
        ├── meta
        ├── tasks
        ├── templates
        ├── tests
        └── vars
```

## 2. Modify
✅Modify the list of managed hosts in line 29 of `playbook.yml`, default vault is `all`:
   ```bash
   $ vim +29 playbook.yml
   29 hosts: all
   ``` 

## 3. Run
✅Run command `ansible-playbook playbook.yml`:
   ```bash
   $ ansible-playbook playbook.yml
   ```