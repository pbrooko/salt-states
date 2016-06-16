{% set default_node_version = '4.x' %}

nodesource-repo:
  pkgrepo.managed:
    - humanname: NodeSource Node.js {{ salt.pillar.get('nodejs:version', default_node_version) }} Repo
    - name: deb https://deb.nodesource.com/node_{{ salt.pillar.get('nodejs:version', default_node_version) }} {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/nodesource.list
    - keyid: AA01DA2C
    - keyserver: keyserver.ubuntu.com
    - refresh_db: True
