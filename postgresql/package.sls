include:
  - .repo

{% set default_pg_version = '9.5' %}
{% set postgresql_name = "postgresql-{{salt.pillar.get('postgres:version', default_pg_version)}}" %}

postgresql-install:
  pkg.installed:
    - name: {{ postgresql_name }}
    - require:
      - pkgrepo: postgresql-repo
