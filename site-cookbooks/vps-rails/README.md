vps-rails Cookbook
==================
Provisioning VPS for Ruby on Rails development or production. Cookbook will forbid root login and password authentication so be careful to have proper SSH keys or you won't be able to log in to the VPS.

Requirements
------------
Depends on following cookbooks:
1. users
2. openssh
3. sudo
4. rbenv
5. mysql

Usage
-----
#### vps-rails::default
User that will be created is defined in `data_bags/users/deployer.json` file where public key is set as well as user name.

Set up deploy user name in vps-rails/attributes/default.rb file, as well as required Ruby version and SSH port.

e.g.
Just include `vps-rails` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[vps-rails]",
    "role[dev_vps]"
  ],
  "automatic": {
    "ipaddress": "127.0.0.1"
  }
}
```

Provisioning local Virtual Box machine:
```
be knife solo prepare vagrant@127.0.0.1 -p 2222 -i <path_to_vagrant_key_within_vm_folder>
be knife solo cook vagrant@127.0.0.1 -p 2222 -i <path_to_vagrant_key_within_vm_folder>
```

Provisioning remote VPS:

```
be knife solo prepare <user@server.address>
be knife solo cook <user@server.address>
```
