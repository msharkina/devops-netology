# Prerequisites:
1. Download java and place downloaded archive into `playbook/files/`` directory.
   Make sure variable variables defined in
   `/playbook/group_vars/all/vars.yml` matche the archive name and archive version.
2. To be able to test this playbook prepare virtual hosts.
It uses Docker container `centos-elastic`, this default behavior might be changed in
`inventory/prod.yml` .
To run docker container execute following commands:
```javascript
   docker run -dit --name centos-elastic centos:7
   docker exec -it centos-elastic /bin/bash -c 'yum install -y sudo'
```

# What Play Does:
This Play would install Java, Elasticsearch and Kibana on your hosts
Java would be installed into `/opt/jdk/{{ java_jdk_version }}"`
Version can be specified in `group_vars/all/vars.yml`

Elasticsearch is installed into `/opt/elastic/$elastic_version/` directory.
Version can be specified in `group_vars/elasticsearch/vars.yml`

Kibana is installed `/opt/kibana/$kibana_version/` directory.
You can specify Kibana version in `group_vars/elasticsearch/vars.yml`.
