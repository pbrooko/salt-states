include:
  - .repo

oracle-java-license-autoaccept:
  debconf.set:
    - name: oracle-javar8-installer
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
    - require_in: 
      - pkg: oracle-java8-installer

oracle-java8-installer:
  pkg.installed:
    - require:
      - pkgrepo: oracle-java-repo
