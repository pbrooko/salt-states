include:
  - .repo

{% set default_pg_version = '9.5' %}

postgresql-install:
  pkg.installed:
    - name: {{ "postgresql-" + salt.pillar.get('postgres:version', default_pg_version) }}
    - require:
      - pkgrepo: postgresql-repo
