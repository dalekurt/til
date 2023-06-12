# Network Isolation on Ubiquiti UniFi

These instructutions were done on the UDM pro running UniFi OS UDM Pro 2.4.27 with Unifi Network application 7.2.97


## Why

### What is Internet of Things?

The Internet of Things (IoT) describes the network of physical objects—“things”—that are embedded with sensors, software, and other technologies for the purpose of connecting and exchanging data with other devices and systems over the internet.

Use Case

You want to be able to use your mobile app to adjust the lights in your smart home, but you want to prevent your light bulb or any other IoT device to access other devices on the network. 

Any device on the `Trusted Network` will bea ble to connect o any device on the `IoT`

However, devices on the `IoT` network can _only_ respond to traffic sent from the `Trusted Network`, and can't initiate traffic to devices on the `Trusted Network`.

## Create a Networks

### Create the Default (Management) network

In the _Classic_ UI:

`UniFi OS` --> `Network` --> `Settings` --> `Networks` --> Edit Default

-   Name: **Default**
-   VLAN: **20** *
-   Gateway IP/Subnet: 172.16.3.1/24 *
    -   Click **UPDATE DHCP RANGE**
-   IGMP Snooping: Enable, by checking the box
-   mDns: Enable, by checking the box

### Create the Guest network

### Create the Homelab network

### Create the IoT network

## Create Wireless Networks

### Create the Default network

In the _Classic_ UI:

`UniFi OS` --> `Network` --> `Settings` --> `Wireless Networks` --> `+ CREATE NEW NETWORK`

-   Name: **MURRAY**
-   Security: **WPA Personal**
-   Security Key: **SomeRandomString** (use something else obviously)
-   Network: Guest (the one we created above)
- Advance Options
	- Wifi Band: Select `Both`

### Create the Guest network

In the _Classic_ UI:

`UniFi OS` --> `Network` --> `Settings` --> `Wireless Networks` --> `+ CREATE NEW NETWORK`

-   Name: **MURRAY-Guest**
-   Security: **WPA Personal**
-   Security Key: **SomeRandomString** (use something else obviously)
-   Network: Guest (the one we created above)
- Advance Options
	- Wifi Band: Select `2.4 GHz`


### Create the IoT network

In the _Classic_ UI:

`UniFi OS` --> `Network` --> `Settings` --> `Wireless Networks` --> `+ CREATE NEW NETWORK`

-   Name: **MURRAY-IOT**
-   Security: **WPA Personal**
-   Security Key: **SomeRandomString** (use something else obviously)
-   Network: IoT (the one we created above)
- Advance Options
	- Wifi Band: Select `2.4 GHz`
	- Hide SSID: Check Prevent this SSID from being broadcast
	- 
## Configure Firewall

### Create Groups

#### Address

`UniFi OS` --> `Network` --> `Settings` --> `Routeing & Firewall` --> `Firewall` --> `Groups` --> `+ CREATE NEW GROUP`

Name | Address | 
-- | -- |
Trusted Network (Management) | 172.16.3.0/24 |
Trusted Private Networks (All Private) | 10.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12 |
All Gateways | |
IoT Network | |

#### Port
`UniFi OS` --> `Network` --> `Settings` --> `Routeing & Firewall` --> `Firewall` --> `Groups` --> `+ CREATE NEW GROUP`

Name | Ports / Range | Protocol | 
-- | -- | -- | 
Apple HomeKit | 51826-51827 | TCP |
Apple AirPlay | 554  | TCP/UDP |
Apple AirPlay | 3689  | TCP | 
Apple AirPlay | 49159  | UDP |
Apple AirPlay | 49163  | UDP |
Philips Hue | 80, 53, 433, 123, 1900| |
mDNS | 5353 | UDP | 
HomeAssistant | 8123 | TCP | 
NTP | 123 | |
NFS | 2049 | |
HTTP and HTTPS | |
All UDM Pro Access Ports | 80, 443, 22 | 



