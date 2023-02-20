# Update hostname

Update hostname 

```shell
sudo hostnamectl set-hostname <HOSTNAME>
```

Edit the `/etc/cloud/cloud.cfg` file 

```shell
sudo vim /etc/cloud/cloud.cfg
```

Search for preserve_hostname and change the value from false to true:

```shell
# This will cause the set+update hostname module to not operate (if true)
preserve_hostname: true
```

To verify that the hostname was successfully changed, once again use the hostnamectl command:

```shell
hostnamectl
```

Then reboot
