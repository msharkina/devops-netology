#!/usr/bin/env python3
import json
import yaml
from socket import gethostbyname

serviceStorageFile = "services.json"
def initialize():
    try:
        with open(serviceStorageFile) as f:
            print("File exists.")
    except IOError:
        print("File not accessible. Populationg with defaults.")
        defaults = {"drive.google.com":"0.0.0.0", "mail.google.com":"0.0.0.0", "google.com":"0.0.0.0"}
        json.dump(defaults, open(serviceStorageFile,'w'))


def checkIp():
    for hostname in services.keys():
        ip = services[hostname]
        print(f'{hostname} - {ip}')
        new_ip = gethostbyname(hostname)
        print(f'{hostname} - {new_ip}')
        if ip != new_ip:
            print(f'[ERROR] {hostname} IP mismatch: {ip} {new_ip}.')
            print(f'{hostname} - {new_ip}')
            services[hostname] = new_ip

def write_to_file(isJsonSupported, isYamlSupported):
    if isJsonSupported == True:
        with open(serviceStorageFile, 'w') as f:
            json.dump(services, f, indent=4)
    if isYamlSupported == True:
        with open("services.yaml", 'w+') as f:
            yaml.dump(services, f)

initialize()
with open(serviceStorageFile) as f:
    services = json.load(f)
checkIp()
write_to_file(True, True)
