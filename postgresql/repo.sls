postgresql-repo:
  pkgrepo.managed:
    - humanname: PostgreSQL Upstream Repository
    - name: deb http://apt.postgresql.org/pub/repos/apt/ {{grains['oscodename']}}-pgdg main
    - file: /etc/apt/sources.list.d/postgresql.list
    - keyid: ACCC4CF8
    - keyserver: keyserver.ubuntu.com
    - refresh_db: True
