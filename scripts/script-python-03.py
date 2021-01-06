#!/usr/bin/env python3
import json
from socket import gethostbyname

serviceStorageFile = "services.txt"
try:
    with open(serviceStorageFile) as f:
        print("File exists.")
        # Do something with the file
except IOError:
    print("File not accessible. Populationg with defaults.")
    defaults = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}
    json.dump(defaults, open(serviceStorageFile,'w'))

with open(serviceStorageFile) as f:
    services = json.load(f)

for hostname in services.keys():
    ip = services[hostname]
    print(f'{hostname} - {ip}')
    new_ip = gethostbyname(hostname)
    print(f'{hostname} - {new_ip}')
    if ip != new_ip:
        print(f'[ERROR] {hostname} IP mismatch: {ip} {new_ip}.')
    print(f'{hostname} - {new_ip}')
    services[hostname] = new_ip

with open(serviceStorageFile, 'w') as f:
    json.dump(services, f, indent=4)
